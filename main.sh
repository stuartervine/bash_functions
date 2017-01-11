#!/usr/bin/env bash
function fb_verifyArgs() {
    local errorMessage=$1
    numberOfArgsExpected=$2
    local args=${@:3}
    numberOfArgsProvided=0

    if [[ ${args[@]} == "" ]]; then
        echo "No arguments provided to verify"
        return
    fi
    for arg in ${args[@]};
    do
        numberOfArgsProvided=$((numberOfArgsProvided+1))
        if [[ $arg == "" ]]; then
            echo $errorMessage
            echo "Argument #$numberOfArgsProvided was not provided."
            return
        fi
    done
    if [[ ! "$numberOfArgsProvided" == "$numberOfArgsExpected" ]]; then
        echo "Incorrect number of arguments provided"
        return
    fi
    return
}

function fb_remoteSource() {
    local verified=$(fb_verifyArgs "fb_remoteSource requires an argument to source" 1 $@)
    if [[ $verified == "" ]]; then
        if [ -s $1 ]; then
            echo "source local $1"
            source $1
        else
            echo "source remote $1"
            tmpfile=$(mktemp /tmp/abc-script.XXXXXX)
            curl $1 -o $tmpfile
            source $tmpfile
            rm $tmpfile
        fi
    else
        echo $verified
    fi
}
