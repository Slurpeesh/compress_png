#!/bin/bash

pngquant_path="/usr/local/bin/pngquant"
optipng_path="/usr/local/bin/optipng"
exiftool_path="/usr/local/bin/exiftool"

find . -type f -name "*.png" | while read -r file; do
    echo "Processing file: \"$file\""

    "$pngquant_path" --quality=65-80 --ext .png --force "$file"

    "$optipng_path" -o7 "$file"

    echo "Removing metadata with ExifTool: \"$file\""
    "$exiftool_path" -overwrite_original -all= "$file"
done

echo "Optimization complete!"
read -p "Press [Enter] to continue..."
