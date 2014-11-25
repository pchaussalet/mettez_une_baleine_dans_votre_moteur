#!/bin/sh
docker rmi 127.0.0.1/foo 2>&1 > /dev/null
CMD='docker run -d -p 80:5000 --name registry registry'
echo ${CMD}
${CMD}

echo "Waiting for registry to start..."
sleep 5
echo
IMG_ID=$(docker images |grep debian |grep jessie |awk '{print $3}')
docker images |egrep "^REPOSITORY|${IMG_ID}"
CMD='docker tag debian:jessie 127.0.0.1/foo'
echo ${CMD}
read foo
${CMD}
docker images |egrep "^REPOSITORY|${IMG_ID}"

echo
CMD='docker push 127.0.0.1/foo'
echo ${CMD}
read foo
${CMD}

echo 
CMD='curl -s 127.0.0.1/v1/repositories/foo/tags'
echo ${CMD}
read foo
${CMD} |json_pp

docker rm $(docker kill registry)
