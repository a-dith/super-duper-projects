# Change the brightness to predefined value
# Usage - for 25 % brightness  ./brightness.sh 25
# Usage - for 1 % brightness  ./brightness.sh 1
# Usage - for lcd off  ./brightness.sh 0
#!/bin/bash
set -e
count=$1
for f in {1..100} ;do xdotool key XF86MonBrightnessDown;done
for ((f=1; f<=count; f++)); do xdotool key XF86MonBrightnessUp;done
