#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 [-d <directory>] [-n <name>] [-t <type>]"
    echo "  -d <directory>  Directory to search in (default: ~)"
    echo "  -n <name>       Name of the file or directory to search for (default: .*)"
    echo "  -t <type>       Type of search: 'f' for file, 'd' for directory (default: d)"
    exit 1
}

# Initialize variables
directory="$HOME"
name="$1"
type="d"

# Parse command line options
while getopts "d:n:t:" opt; do
    case $opt in
        d) directory="$OPTARG" ;;
        n) name="$OPTARG" ;;
        t) type="$OPTARG" ;;
        *) usage ;;
    esac
done

# Determine the type of search
case "$type" in
    f) type_option="-type f" ;;
    d) type_option="-type d" ;;
    *) type_option="" ;;
esac

# Perform the search
echo "Searching for '$name' in '$directory'..."
find "$directory" $type_option -name "$name" -print -quit

# Check if any results were found
if [ $? -eq 0 ]; then
    echo "Search completed."
else
    echo "No matches found."
fi

