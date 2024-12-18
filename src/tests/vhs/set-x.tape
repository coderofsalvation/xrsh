# Where should we write the GIF?
Output ./../media/terminal/set-x.gif

# Set up a 1200x600 terminal with 46px font.
Set Margin 0
Set FontSize 19
Set Width  600
Set Height 500
Set CursorBlink true

# Type a command in the terminal.
Type 'vi'

# Pause for dramatic effect...
Sleep 1000ms

Enter

# Type a command in the terminal.
Type "i#!/bin/sh"

Enter

Type "set -x   # enable debugging
Enter
Enter
Type "foo=bar"
Enter
Type "echo $foo"
Enter

Sleep 4000ms

# Type a command in the terminal.
Escape
Type ":wq! myscript"

# Pause for dramatic effect...
Sleep 2000ms

Enter

Type "chmod +x myscript"

Sleep 1000ms

Enter

Type "./myscript"

Sleep 2000ms

Enter 

# Admire the output for a bit.
Sleep 4s

