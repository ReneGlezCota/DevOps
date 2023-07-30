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

echo "${MYPATH}/Dockerfile"

# create the image
docker build -t web-app-image -f "${MYPATH}/Dockerfile" .

# create the container from the image
docker container create -i -t --name web-app-container web-app-image

# mapping the container to the port 8080 
docker run -p 8080:8080 -d -v /c/temp-keys:/root/.aspnet/DataProtection-Keys  web-app-image


# create the MYSQL container
docker volume prune
docker volume create mysql-db-data
docker run -d -p 33060:3306 --name mysql-db -e MYSQL_ROOT_PASSWORD=D@cker1234 --mount src=mysql-db-data,dst=/var/lib/mysql mysql
docker exec -it mysql-db mysql -p

