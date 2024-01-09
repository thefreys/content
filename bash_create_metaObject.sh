#!/bin/bash

input_file="$(dirname ${BASH_SOURCE[0]})"/meta_files.lst 
output_file="$(dirname ${BASH_SOURCE[0]})"/meta_object.js


find "$(dirname ${BASH_SOURCE[0]})" -type f -name "*.meta.js" > "${input_file}"

echo 'export const metaObject = {' > "${output_file}"

while IFS= read -r filename; do
    echo ${filename}
    key="${filename:2:-8}"
    #rm "${filename:0:-3}.tmp"
    file_contents=$(cat ${filename})
    #echo "$file_contents"  # Access the file contents stored in the variable

    positions1=()
    positions2=()
    position=0
    while IFS= read -r line; do
        for ((i = 0; i < ${#line}; i++)); do
            if [[ "${line:i:1}" == "{" ]]; then
                positions1+=($((position + i)))
            fi
            if [[ "${line:i:1}" == "}" ]]; then
                positions2+=($((position + i)))
            fi
        done
        ((position+=${#line}+1))  # Account for newline character
    done <<< "$file_contents"
    #echo "${positions1[@]}"  # Output: 17 28 46
    #echo "${positions2[@]}"  # Output: 17 28 46
    len_positions1=${#positions1[@]}
    len_positions2=${#positions2[@]}
    if [[ "${len_positions1}" == "0"  || "${len_positions2}" == "0" ]]; then
        echo "'${key}':{}," >> "${output_file}"
    else
        start=${positions1[0]}
        end=${positions2[-1]}
        len=($((${end} - ${start} + 1)))
        echo "'${key}':${file_contents:start:len}," >> "${output_file}"
    fi
    
done < "${input_file}"
echo '};' >> "${output_file}"

#rm "${input_file}";

