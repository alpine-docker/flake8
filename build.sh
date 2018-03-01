#!/usr/bin/env bash

# Prerequisite
# Make sure you have login hub.docker.com with 
# docker login -u <your_account>

set -ex

image="alpine/flake8"
repo="PyCQA/flake8"

latest=`curl -s https://api.github.com/repos/${repo}/tags |jq -r ".[].name"|head -1`
sum=0
echo "Lastest release is: ${latest}"

tags=`curl -s https://hub.docker.com/v2/repositories/${image}/tags/ |jq -r .results[].name`

for i in ${tags}
do
  if [ ${i} == ${latest} ];then
    sum=$((sum+1))
  fi
done

if [[ ( $sum -ne 1 ) || ( $1 == "rebuild" ) ]];then
  docker build --build-arg FLAKE8_VERSION=$latest -t ${image}:${latest} .
  docker tag ${image}:${latest} ${image}:latest
  docker push ${image}:${latest}
  docker push ${image}:latest
fi
