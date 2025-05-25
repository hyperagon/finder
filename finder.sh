#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <search_string> [search_directory]"
    exit 1
fi

search_string=$1
search_directory=${2:-$HOME}

# Use find to locate files or directories ending with the search string, including hidden ones
find "$search_directory" \( -type f -name "*$search_string" -o -type d -name "*$search_string" \) -o \( -type f -name ".*$search_string" -o -type d -name ".*$search_string" \)

