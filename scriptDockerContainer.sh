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

# create the image from the docker file
docker build -t web-app-image -f "${MYPATH,,}/dockerfile"


# create the container from the image
docker container create -i -t --name web-app-container web-app-image
