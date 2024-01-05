#!/bin/bash

input_file="$(dirname ${BASH_SOURCE[0]})"/meta_files.lst 
output_file="$(dirname ${BASH_SOURCE[0]})"/meta_files.js

find "$(dirname ${BASH_SOURCE[0]})" -type f -name "*.meta.js" > "${input_file}"

echo 'const metaFiles = [' > "${output_file}"

while IFS= read -r line; do
    key="${line:2:-8}"
    echo "'${key}'," >> "${output_file}"
done < "${input_file}"

echo '];' >> "${output_file}"

rm "${input_file}";

