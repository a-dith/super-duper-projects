# Dmenu script to open files using default application
#!/bin/bash
set -e

folder_name="$HOME/Downloads/"
dmenu_options="-i -l 20 -nb black -nf white -sb dodgerblue -sf white -fn 'Monospace-12'"


while true; do
 result="$(ls -c "$folder_name" | { echo '..'; cat; } | dmenu -p "$folder_name" $dmenu_options)"
    if [[ "$result" == ".." ]]; then
        folder_name="$(dirname "$folder_name")/"

    elif [[ -d "$folder_name$result" ]]; then
        folder_name="$folder_name$result/"

    else
        break
    fi
done

exo-open "$folder_name$result"
