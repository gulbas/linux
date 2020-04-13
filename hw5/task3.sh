#!/bin/bash
usage(){
	cat << eof
This is script create files in a selected directory. 
	Usage: $0 [pattern] [selected directory] [file(s)] 
Options:
	-d (pointer to direcotory)
Examples: 
	$0 -d /tmp/task_3
	$0 -d file1 file2 file3
	$0 -d /tmp/task_3 file1 file2.sh file3
	$0 -d /tmp/task_3 -d /tmp/task_3_2 file1 file2.sh file3
eof
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	usage
	exit 0
elif [[ "$1" == "-d" ]]; then
	while [[ $# -gt 1 ]]; do
		[ "$2" == "-d" ]&&shift
		[ -e "$2" ]&&echo "File ${2} already exists"&&shift&&continue
	 	case $2 in
	 		*.sh)
				touch $2
				chmod +x $2
				echo "File ${2} created"
			;;
	 		*)
				touch $2
				echo "File ${2} created"
	 	esac
	 	shift
	 done 
	 exit 0
	else
		usage
		exit 1
fi