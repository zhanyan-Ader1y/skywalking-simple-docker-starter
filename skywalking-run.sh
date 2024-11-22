#!/bin/bash

while getopts p:n opt
do
	case "${opt}" in
		p) profile=${OPTARG};;
    n) name=${OPTARG};;
    *) echo "usage: $0 [-p]" >&2
       exit 1 ;;
	esac
done

echo "compose active profile: $profile";
echo "compose name: $name";



# check volume exists
volumes=$(docker volume ls -q)
skywalking_volume="sw"

if echo "$volumes" | grep -q "$skywalking_volume"; then
    echo "volume: $skywalking_volume , is exists."
else
    echo "auto create volume: $skywalking_volume"
    docker volume create --name "$skywalking_volume"
fi

# check network exists
networks=$(docker network ls --format {{.Name}})
skywalking_network="sw"

if echo "$networks" | grep -q "$skywalking_network"; then
    echo "network: $skywalking_network , is exists."
else
    echo "auto create network: $skywalking_network"
    docker network create "$skywalking_network"
fi

docker compose --env-file ./env/.env."$profile" -f ./docker-compose-sw.yml -p "$name" up -d