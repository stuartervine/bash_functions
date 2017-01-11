#!/usr/bin/env bash

#arg1 mac command, #arg2 linux command, #arg3 windoze command
function osRun() {
    if [ "$(uname)" == "Darwin" ]; then
        echo $1
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo $2
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        echo "Please don't use Windows"
        exit 1
    fi
}