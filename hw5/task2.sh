#!/bin/bash

usage(){
	cat <<eof
This is script show online messages if authorization was failed.
Usage: $0
Options:
	- help
Examples:
	$0 --help
	./task2.sh
eof
}


if [[ $1 == --help ||  $1 == -h ]]; then
	usage
	exit 0
else
	echo "Below you see a messages about failed authorization attempt:"
	tail -f /var/log/auth.log | grep -i 'FAILED LOGIN\|Failed password'
fi