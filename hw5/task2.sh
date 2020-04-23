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

[[ $@ =~ (--help|-h).* ]] && usage && exit 0

tail -f /var/log/auth.log | grep -i 'authentication failure'
