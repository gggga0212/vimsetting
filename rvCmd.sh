#!/bin/bash

# Find all .c and .h files in the current directory and subdirectories
find . -type f \( -name "*.c" -o -name "*.h" \) | while read -r file
do
    # Use gcc to preprocess and remove comments (-E -P) and overwrite the original file
    gcc -fpreprocessed -dD -E -P "$file" -o "$file.tmp" && mv "$file.tmp" "$file"
    echo "Processed $file"
done
