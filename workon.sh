# shell-script-to-do-shell-scripting-fast
# Based on https://www.theunixschool.com/2011/08/shell-script-to-do-shell-scripting.html

#!/usr/bin/bash

# check to ensure that the correct number of command-line arguments is provided.
# If not, the script displays the correct usage and exits.
if [ $# -ne 1 ]; then
# '$#' is a special variable in Bash that represents the number of commandline
# arguments passed to the script.
  echo "Usage: $0 <script_filename.sh>"
  exit 1
fi

# Check if file is present
if [ ! -f "$PWD/$1" ]; then
    echo -e "# A Program for\n\n#!/usr/bin/bash\n\n# Set the shell option to exit immediately if any command exits with a non-zero status\nset -e" > ""$1""
fi

# Check if file is executable
if [ ! -x "$PWD/$1" ]; then
  chmod +x "$PWD/$1"
fi

while true;
do
    nano "$PWD/$1"
    "$PWD/$1"
    read -rp "Press Enter to continue..."
    # wait for you to press the Enter key before looping again 
    # and opening the script for editing
done
