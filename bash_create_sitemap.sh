#!/bin/bash

find "$(dirname ${BASH_SOURCE[0]})" -type f -name "*.md" > "$(dirname ${BASH_SOURCE[0]})"/sitemap_paths.lst

input_file="$(dirname ${BASH_SOURCE[0]})"/sitemap_paths.lst 
output_file="$(dirname ${BASH_SOURCE[0]})"/sitemap_items.json



echo "{\"items\": [
" > "$output_file"
while IFS= read -r line; do
    filename="${line}"
    filename_without_extension="${filename%.*}"
    echo "
{\"xpath\":\"${filename_without_extension:2}\", \"meta\": " >> "$output_file"
    meta=$(<"$filename")
    meta=$(echo "$meta" | sed 's/[[:space:]]*$//')
    echo "${meta}}," >> "$output_file"
done < "$input_file"

echo "]}" >> "$output_file"
