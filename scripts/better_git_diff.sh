#!/usr/bin/env sh

gd=$(git diff)

changed_files=$(echo $gd  | grep '\(^--- \|^+++\)' | sed 's/\//\\\//g' | tr ' ' ';')

for filename in $(echo $changed_files); do
    filename=$(echo $filename | tr ';' ' ')
    colored_filename=$(echo "$(tput setaf 12)$filename$(tput sgr0)")

    gd=$(echo $gd | sed "s/$filename/$colored_filename/g")
done

[[ -n $gd ]] && echo $gd | less -r
unset gd
