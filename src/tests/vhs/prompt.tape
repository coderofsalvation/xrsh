# Where should we write the GIF?
Output ./../media/terminal/prompt.gif

# Set up a 1200x600 terminal with 46px font.
Set Margin 0
Set FontSize 19
Set Width  500
Set Height 200
Set CursorBlink true

# Type a command in the terminal.
Type "prompt 'whatsup'"

# Pause for dramatic effect...
Sleep 700ms

Enter

# Pause for dramatic effect...
Sleep 700ms

Type "FOSS"

Enter

# Admire the output for a bit.
Sleep 3s

# Type a command in the terminal.
Type "in=$(prompt 'whatsup')"
Sleep 1000ms

Enter
Sleep 700ms 

Type "FOSS"
Sleep 1000ms

Enter
Sleep 1000ms

Type "echo $in"
Sleep 1000ms 

Enter
Sleep 1000ms

Type "test $in = FOSS && echo ♥"
Sleep 2000ms

Enter

# Admire the output for a bit.
Sleep 3s
