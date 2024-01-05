#!/bin/bash

cleanup_file="$(dirname ${BASH_SOURCE[0]})"/cleanup.lst 


find "$(dirname ${BASH_SOURCE[0]})" -type f -name "*.meta" > "${cleanup_file}"

while IFS= read -r line; do
    rm "${line:2}"
done < "${cleanup_file}"

rm  "${cleanup_file}"