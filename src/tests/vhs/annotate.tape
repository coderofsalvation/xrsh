# Where should we write the GIF?
Output ./../media/terminal/annotate.gif

# Set up a 1200x600 terminal with 46px font.
Set Margin 0
Set FontSize 19
Set Width  500
Set Height 200
Set CursorBlink true

Type "mkdir /tmp/foo"
# Pause for dramatic effect...
Sleep 1000ms

# Run the command by pressing enter.
Enter

Type "cd /tmp/foo"
# Pause for dramatic effect...
Sleep 1000ms

# Run the command by pressing enter.
Enter

# Type a command in the terminal.
Type "annotate this is a cool directory"

# Pause for dramatic effect...
Sleep 1000ms

# Run the command by pressing enter.
Enter

Type "cd /tmp/foo"

# Pause for dramatic effect...
Sleep 1000ms

# Run the command by pressing enter.
Enter

# Admire the output for a bit.
Sleep 3s
