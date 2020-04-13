#!/bin/bash

usage(){
	cat <<eof
This is a script delete empty strings in a text file and change small characters to large ones.
Usage: $0 [file]
Options:
	- help
Examples:
	$0 --help
	$0 file.txt

eof
}

# If files not specified
if (( $# < 1 )); then
	echo "Files not specified or options not found. Please use --help or -h."
	exit 3
fi

# Read options
while [[ $# -gt 0 ]] ; do
	# If file is specified
	if [[ -e $1 ]] ; then
	      	  read file <<<$1
	      	  sed '/^$/d' $1 | sed 's/.*/\U&/'
              exit 0
              # If option help is found
		elif [[ $1 == --help ||  $1 == -h ]]; then
				usage
				exit 0
    fi
done