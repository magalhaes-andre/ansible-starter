#!/bin/bash

while getopts 'r:c:' input
do
    case $input in
    r) roles=$OPTARG;;
    c) config=$OPTARG;;
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

errorMessage(){
    echo "The script returned a error message: $1"
}

installCommand(){
    sudo cp ansible-starter.sh /usr/local/bin/
    sudo mv /usr/local/bin/ansible-starter.sh /usr/local/bin/ansible-starter 
    sudo chmod +x /usr/local/bin/ansible-starter
}

start () {

    if [ ! -z "$1" ] && [ ! -z "$2" ] 
    then
        errorMessage "Two Arguments"
    fi

    if [ ! -z "$1" ] && [ -z "$2" ] || [ -z "$1" ] && [ -z "$2" ]
    then
        createBaseStructure
        processRoles "$1"
    fi

    if [ ! -z "$2" ] && [ -z "$1" ]
    then
        readConfig
    fi

    createBaseStructure
}

if [ ! -z "$1" ]
then
    installCommand
else
    start "$roles" "$config"
fi

