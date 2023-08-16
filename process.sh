# Dmenu script to play, copy, delete and extract file name of local files

#!/bin/bash
set -e

folder_name="$HOME/Downloads/"
dmenu_options="-i -l 20 -nb black -nf white -sb dodgerblue -sf white -fn 'Monospace-12'"

select_destination_folder() {
    local destination_folder
    while true; do
        destination_folder=$(ls -d ~/Downloads/*/ | dmenu -p "Destination folder:" $dmenu_options)
        if [[ -d "$destination_folder" ]]; then
            echo "$destination_folder"
            break
        fi
    done
}

while true; do
    result="$(ls -t "$folder_name" | { echo '..'; cat; } | dmenu -p "$folder_name" $dmenu_options)"

    if [[ "$result" == ".." ]]; then
        folder_name="$(dirname "$folder_name")/"
    elif [[ -d "$folder_name$result" ]]; then
        folder_name="$folder_name$result/"
   else
        # Present options for the selected file
        options=("Play" "Copy name" "Move" "Delete" "Cancel")
        selected_option=$(printf '%s\n' "${options[@]}" | dmenu -p "Selected file:$result" $dmenu_options)

        case "$selected_option" in
            "Play")
                # Add code to play the selected file
                mpv "$folder_name$result"
                ;;
            "Copy name")
                 # Add code to copy the selected file name to clipboard
                 echo "$result" | xclip -sel c
                 break
                 ;;
            "Move")
                destination_folder=$(select_destination_folder)
                if [[ -n "$destination_folder" ]]; then
                    mv "$folder_name$result" "$destination_folder"
                else
                    echo "Invalid destination folder. File not moved."
                fi
                ;;
            "Delete")
                # Add code to delete the selected file
                rm "$folder_name$result"
                ;;
            "Cancel")
                # User chose to cancel, break out of the loop
                break
                ;;
        esac
    fi
done
