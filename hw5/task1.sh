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

[[ $@ =~ (--help|-h).* ]] && usage && exit 0
[[ $# == 0 ]] && echo "File not specified" && usage && exit 1
[[ $# -gt 1 ]] && echo "Too many files" && usage && exit 2
[[ ! -f $@ ]] && echo "File does not exist" && usage && exit 3

sed -i 's/\(.*\)/\U\1/; /^[[:blank:]]*$/d' $@
cat $@