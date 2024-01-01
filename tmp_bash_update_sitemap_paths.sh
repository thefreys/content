#!/bin/bash

find "$(dirname ${BASH_SOURCE[0]})" -type f -name "*.meta" > "$(dirname ${BASH_SOURCE[0]})"/sitemap_paths.lst



input_file="$(dirname ${BASH_SOURCE[0]})"/sitemap_paths.lst # Replace with your input file name
output_file="$(dirname ${BASH_SOURCE[0]})"/tmp_sitemap.html # Replace with your output file name

echo "var temp_items = [" > "$output_file"
# Process each line
while IFS= read -r line; do
    # Modify the line as needed

    filename="$line"
    filename_without_extension="${filename%.*}"
    modified_line="'index.html?x=${filename_without_extension}'," # Replace this with your line modification logic

    # Write the modified line to the output file
    echo "$modified_line" >> "$output_file"
done < "$input_file"

echo "];" >> "$output_file"
