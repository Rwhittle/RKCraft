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


FIRST_PAGE_MAX_LINKS = 6
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
    self.linkcolor = "blue"
    self.doublespaced = True
    self.autobreak = True

    self.tags = []
    
    self.page_links = {}
    
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
      elif key == "linkcolor":
        self.linkcolor = value
      elif key == "doublespaced":
        self.doublespaced = False if value.lower() == "false" else True
      elif key == "autobreak":
        self.autobreak = False if value.lower() == "false" else True
      elif key == "tags":
        self.tags = [s.strip() for s in value.split(",")]

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
    if not self.autobreak:
      return
    if ((self.page == 0 and self.links == FIRST_PAGE_MAX_LINKS)
        or self.links == LATER_PAGE_MAX_LINKS):
      self.new_page()


  def reset_color(self):
    self.pages[-1] += [{"text": "\\n\\n" if self.doublespaced else "\\n",
                        "color": "reset"}]

  def make_click_event(self, command):
    if command.startswith("/:page"):
      v = command.split("page")[1].strip()
      if v.isdigit():
        v = str(v)
      else:
        v = "$" + str(v)
      return {
        "action": "change_page",
        "value": v
      }
    return {
      "action": "run_command",
      "value": command
    }
    
  def add_text(self, text, color=None):
    if not color:
      color = "black"
    for part in text.split("%"):
      if not part:
        continue
      if part[0] == "{":
        visible, cmd = part[1:].split("(")
        self.pages[-1].append({"text": visible,
                               "underlined": True,
                               "color": color,
                               "clickEvent": self.make_click_event(cmd[:-2])})
      else:
        self.pages[-1].append({"text": part,
                               "underlined": False,
                               "color": color})
    self.reset_color()
    self.links += 1

  def add_link(self, text, command, color=None):
    if not color:
      color = self.linkcolor
    self.pages[-1].append({"text": text,
                           "underlined": True,
                           "color": color,
                           "clickEvent": self.make_click_event(command)})
    self.reset_color()
    self.links += 1

  def link_page_numbers(self, contents):
    for link in self.page_links:
      contents = contents.replace("$" + link, str(self.page_links[link]))
    return contents
    
  def generate(self):
    pages = self.pages[:]
    pages[0] = self.make_title() + pages[0]
    data = {
      "title": (self.title,),
      "author": (self.author,),
      "pages": [(self.link_page_numbers(json.dumps(page).replace("'", r"\'")),) for page in self.pages],
      "CustomModelData": 1,
      "Tags": [(tag,) for tag in self.tags]
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
        if comment.find("$") != -1:
          book.page_links[comment.split("$")[1].split()[0]] = len(book.pages)
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
