#! /bin/bash

# Runs the command, saves the output to the Ctrl-V clipboard,
# and outputs the command to the terminal.
# For ease of checking and loading into Minecraft.

$* | xclip -selection clipboard; echo; xclip -selection clipboard -o
