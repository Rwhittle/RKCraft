#! /usr/bin/env python3

# Produces a Minecraft written book.

# If run as a script, accepts a file to be made as a verbatim book.
# [newlines?]
# [bold?]
#
# "Link text" /command...
#
#
# For more complicated books, like special data file formats or
# fancier text, make a separate file that imports this one and
# instantiates or subclasses Book.

import json
import re
import sys
from util import mc_json


def escape(s):
  return s.replace('"', r'\\"').replace("'", r"\'")


class Book(object):

  class Style(object):
    bold = False
    italic = False
    underlined = False
    color = None

    def get_color(self):
      return self.color or "reset"

    def __str__(self):
      return json.dumps({"bold": self.bold,
                         "italic": self.italic,
                         "underlined": self.underlined})
    
  def __init__(self, title):
    self.title = title
    self.pages = [[]]
    self.bookdata = None
    self.page = 0

    self.author = "Someone"

    self.modifiers = {
      "[b]": "bold",
      "[i]": "italic",
      "[u]": "underlined"
    }
    self.style = Book.Style()
    
    self.tags = []

  def parse_config(self, line):
    if line.strip().startswith("pagebreak"):
      self.new_page()
      return
    for assignment in line.split(";"):
      key, value = assignment.split("=")
      key = key.strip()
      value = value.strip()
      if key == "title":
        self.title = value
      elif key == "author":
        self.author = value
      elif key == "tags":
        self.tags = [s.strip() for s in value.split(",")]

  def preamble(self):
    return r"/give @p written_book"

  def new_page(self):
    self.page += 1
    self.pages.append([{"text": ""}])

  def add_text(self, text, style):
    self.pages[-1].append({"text": text.replace("\n", "\\n"),
                           "bold": style.bold,
                           "italic": style.italic,
                           "underlined": style.underlined,
                           "color": style.get_color()})

  def negated(self, modifier):
    return modifier.replace("[", "[/")
    
  def next_modifier(self, s):
    pos = len(s)
    mlen = 0
    modifier = None
    value = None
    for mod in self.modifiers:
      for opening in [True, False]:
        m = mod
        if not opening:
          m = self.negated(m)
        mpos = s.find(m)
        if mpos == -1 or mpos > pos:
          continue
        pos = mpos
        mlen = len(m)
        modifier = mod
        value = opening

    return (pos, mlen, modifier, value)
    
  def add_line(self, text):
    pos = 0
    counter = 0
    while pos < len(text):
      modifier_pos, modifier_len, modifier, value = self.next_modifier(text[pos:])
      self.add_text(text[pos:pos + modifier_pos], self.style)
      pos += modifier_pos + modifier_len
      if modifier:
        setattr(self.style, self.modifiers[modifier], value)

  def generate(self):
    pages = self.pages[:]
    data = {
      "title": (self.title,),
      "author": (self.author,),
      "pages": [(json.dumps(page).replace("'", r"\'").replace(r'\"', r'\\"'),) for page in self.pages],
      "Tags": [(tag,) for tag in self.tags]
    }
    return self.preamble() + mc_json(data)


def commandbook(filename):
  book = Book("Book")

  with open(filename) as f:
    for i, line in enumerate(f):
      if line.startswith(":"):
        book.parse_config(line[1:])
        continue
      elif line.startswith("[p]"):
        book.new_page()
      else:
        book.add_line(line)

  return book.generate()


def usage():
  print("Usage: {} <book file>\n".format(sys.argv[0]))
  print("This program produces a Minecraft command that gives a book to the issuing player.")
  print("The book is filled with text which, when clicked, issues a command.")
  print("The generated command is usually too long to enter directly into Minecraft, so put it in a command block.")
  print("The text and commands are defined by the <book file> that is passed in.")
  print("A command file (like test.commands) has on each line link text in quotes, followed by a command starting with a slash, like this:")
  print("\"Teleport to 0,0,0\" /teleport @p 0 0 0")


def main():
  if len(sys.argv) < 2:
    usage()
    exit()
  print(commandbook(sys.argv[1]))


if __name__ == "__main__":
  main()
