#!/bin/bash

# run from root folder: ./docker/build.sh

function gentags {
    local basetag="cyberbit/satpaper"

    local array=()
    for arg in "$@"; do
        array+=("-t $basetag:$arg")
    done

    echo ${array[@]}
}

[[ -z "$1" ]] && { echo "Please provide version to buildinate" ; exit 1; }

tagargs=$(gentags $@)

echo Satpaper :: Building tags: $@
echo Satpaper :: Generated tag arguments: $tagargs
docker build $tagargs -f docker/Dockerfile .

# docker logout
# docker login
# docker push cyberbit/satpaper:TAG