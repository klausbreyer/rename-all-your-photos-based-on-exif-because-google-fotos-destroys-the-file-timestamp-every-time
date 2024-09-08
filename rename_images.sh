#!/bin/bash

# Check if a folder path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/folder"
    exit 1
fi

# Path to the folder containing the images
folder_path="$1"

# Loop through all JPG files in the specified folder
for file in "$folder_path"/*.jpg "$folder_path"/*.jpeg; do
    # Check if the file exists
    [ -e "$file" ] || continue

    # Extract EXIF date and time in the format YYYY-MM-DD_HH-MM-SS
    datetime=$(exiftool -d "%Y-%m-%d_%H-%M-%S" -DateTimeOriginal "$file" | awk -F': ' '{print $2}')

    if [ ! -z "$datetime" ]; then
        # New filename in the format YYYY-MM-DD_HH-MM-SS.jpg
        new_filename="${folder_path}/${datetime}.jpg"

        # If a file with the new name already exists, add a number to avoid duplicates
        if [ -e "$new_filename" ]; then
            counter=1
            while [ -e "${folder_path}/${datetime}_${counter}.jpg" ]; do
                ((counter++))
            done
            new_filename="${folder_path}/${datetime}_${counter}.jpg"
        fi

        # Rename the file
        mv "$file" "$new_filename"
        echo "Renamed: $file -> $new_filename"
    else
        echo "No EXIF data found for $file. Skipping."
    fi
done
