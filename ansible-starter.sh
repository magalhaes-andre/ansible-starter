#!/bin/bash

while getopts 'r:' input
do
    case $input in
    r) roles=$OPTARG;;
    esac
done

createBaseStructure () {
    mkdir -p provision
    touch provision/playbook.yml
}

createRoleStructure () {
    mkdir -p provision/roles/$1/tasks/
    touch provision/roles/$1/tasks/main.yml
    mkdir -p provision/roles/$1/vars/
    touch provision/roles/$1/vars/main.yml
}

processRoles () {
    IFS='/' #Internal Field Separator
    read -ra ADDR <<< "$1"
    for index in "${ADDR[@]}"; do
        createRoleStructure "$index"    
    done
}

start () {
    createBaseStructure
    if [ ! -z "$1" ]
    then
        processRoles "$1"
    fi
}

start "$roles"