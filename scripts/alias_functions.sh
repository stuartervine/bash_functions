#!/usr/bin/env bash

VERBOSE_LOGGING='false'
multi_command_flag='false'
THIS_SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $THIS_SCRIPT_DIRECTORY/os_run.sh

function log() {
    if [ "$VERBOSE_LOGGING" == "true" ] ; then echo -e $1; fi
}

function bash_profile_file() {
    echo `osRun "$HOME/.profile" "$HOME/.bashrc"`
}

function remove_alias() {
    bash_profile_file=`bash_profile_file`
    log "${green}Removing existing alias: $1.${no_colour}"
    sed -i.bak "/^alias $1/d" ${bash_profile_file}
}

function install_alias() {
    remove_alias $1
    bash_profile_file=`bash_profile_file`
    log "${green}Inserting alias $1:${blue}"
    log ${command_alias}
    echo "alias $1=\"$2\"" >> $bash_profile_file
    log "${no_colour}"
}

function install_export() {
    remove_alias $1
    bash_profile_file=`bash_profile_file`
    log "${green}Inserting alias $1:${blue}"
    log ${command_alias}
    echo "alias $1=\"$2\"" >> $bash_profile_file
    log "${no_colour}"

}