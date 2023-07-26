#!/bin/bash
# a script that create a docker container
MYPATH=$1

# check input parameters
if [ -z "$MYPATH" ]; then
    echo "Error: local path is not set"
    echo "Create the path in your local: $MYPATH"
    exit
fi

#for file in "$MYPATH"/*
#do
#    if [[ -f $file ]]; then
#	echo "$file"
#    fi
#done

echo "${MYPATH,,}/dockerfile"

docker build . -f '${MYPATH,,}/dockerfile'
