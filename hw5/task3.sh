#!/bin/bash

usage(){
        cat << eof
Script will create files on the specified directory and assign execute permissions to '.sh' files. If file is already there, you will be warned.
        Usage: $0 [pattern] [selected directory] [file(s)]
Options:
        -d (pointer to direcotory)
Examples:
        $0 -d /tmp/task_3
        $0 -d file1 file2 file3
        $0 -d /tmp/task_3 file1 file2.sh file3
        $0 -d /tmp/task_3 -d /tmp/task_3_2 file1 file2.sh file3
        $0 file1 file2.sh file3 -d /tmp/task_3_2
eof
}

while [[ $# -gt 0 ]] ; do
        case $1 in
                --help|-h)
                usage
                exit 0
        ;;
                -d)
                DIR+=( $2 )
                shift 2
        ;;
                *)
                [[ $1 =~ .*/.* ]] && echo "File name '$1' contains '/' char" && exit 1
                FILES+=( $1 )
                shift
        ;;
  esac
done

(( ${#DIR[@]} == 0 )) && echo "Directory not specified" && exit 2
(( ${#FILES[@]} == 0 )) && echo "Files not specified" && exit 3
(( ${#DIR[@]} > 1 )) && echo "More than one directory specified '${DIR[@]}'" && exit 4

mkdir -p $DIR

for f in ${FILES[@]} ; do
            file=$DIR/$f
            if [[ -f $file ]] ; then
                    echo -n "File '$file' already exists"
            else
                    echo -n "Creating file '$file'"
                    date > $file
                    [[ $file =~ .+\.sh$ ]] && echo -n " and adding exec permissions" && chmod +x $file
            fi
            echo
done