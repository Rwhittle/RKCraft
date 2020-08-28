#! /usr/bin/env python3

# Produces a Minecraft "Command Book", a book with text that
# executes commands when clicked.

# If run as a script, accepts a file with lines in the form:
#
# "Link text" /command...
#
#
# For more complicated books, like special data file formats or
# fancier text, make a separate file that imports this one and
# instantiates or subclasses Book.

import json
import sys
from util import mc_json


FIRST_PAGE_MAX_LINKS = 5
LATER_PAGE_MAX_LINKS = 6


def escape(s):
  return s.replace('"', r'\\"').replace("'", r"\'")


class Book(object):

  def __init__(self, title):
    self.title = title
    self.pages = [[]]
    self.bookdata = None
    self.page = 0
    self.links = 0

    self.spaces = 7
    self.author = "commandbook.py"

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
      elif key == "spacing":
        self.spaces = int(value)

  def preamble(self):
    return r"/give @p written_book"

  def make_title(self):
    spacing = r" \u0020" * int(self.spaces / 2)
    if self.spaces % 2 == 1:
      spacing += " "
    return [{"text":r"%s" % spacing},
            {"text":r"%s\n\n" % self.title, "underlined":True}]

  def new_page(self):
    self.page += 1
    self.pages.append([{"text": ""}])
    self.links = 0

  def maybe_new_page(self):
    if ((self.page == 0 and self.links == FIRST_PAGE_MAX_LINKS)
        or self.links == LATER_PAGE_MAX_LINKS):
      self.new_page()

    
  def reset_color(self):
    self.pages[-1] += [{"text": "\\n\\n",
                        "color": "reset"}]

  def add_text(self, text, color=None):
    if not color:
      color = "black"
    self.pages[-1].append({"text": text,
                           "underlined": False,
                           "color": color})
    self.reset_color()
    self.links += 1

  def add_link(self, text, command, color=None):
    if not color:
      color = "blue"
    if command.startswith("/:page"):
      click_event = {
        "action": "change_page",
        "value": command.split("page")[1].strip()
      }
    else:
      click_event = {
        "action": "run_command",
        "value": command
      }
    self.pages[-1].append({"text": text,
                           "underlined": True,
                           "color": color,
                           "clickEvent": click_event})
    self.reset_color()
    self.links += 1
  
  def generate(self):
    pages = self.pages[:]
    pages[0] = self.make_title() + pages[0]
    data = {
      "title": (self.title,),
      "author": (self.author,),
      "pages": [(json.dumps(page).replace("'", r"\'"),) for page in self.pages],
      "CustomModelData": 1
    }
    return self.preamble() + mc_json(data)


def commandbook(filename):
  book = Book("Command Book")

  with open(filename) as f:
    for i, line in enumerate(f):
      if line.startswith(":"):
        book.parse_config(line[1:])
        continue
      try:
        book.maybe_new_page()
        comment, text, command = line.split('"', 2)

        color = None
        if comment.startswith("color"):
          color = comment.split(" ")[0].split("color")[1]
        if command.strip():
          book.add_link(text, command.strip(), color)
        else:
          book.add_text(text, color)
      except ValueError:
        if line.strip():
          sys.stderr.write("Warning: couldn't parse line %d: '%s'\n" % (i + 1, line.strip()))

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
