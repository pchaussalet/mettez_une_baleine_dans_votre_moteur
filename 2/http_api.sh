#!/bin/sh
run() {
  read foo
  clear
  echo ${CMD}
  read foo
}

raw() {
  ${CMD}
}

json() {
  ${CMD} |json_pp
}

CMD='curl -s 127.0.0.1:4243/containers/json?all=true'
run
json

read foo
clear
echo curl -s -X POST -H "content-type: application/json" -d '{"Image":"debian:jessie", "Cmd":["/usr/bin/vmstat", "1"]}' 127.0.0.1:4243/containers/create?name=hello_world
read foo
curl -s -X POST -H "content-type: application/json" -d '{"Image":"debian:jessie", "Cmd":["/usr/bin/vmstat", "1"]}' 127.0.0.1:4243/containers/create?name=hello_world |json_pp

CMD='curl -s 127.0.0.1:4243/containers/json?all=true'
run
json

CMD='curl -s 127.0.0.1:4243/containers/hello_world/json'
run
json

CMD='curl -s -X POST 127.0.0.1:4243/containers/hello_world/start'
run
raw

CMD='curl -s 127.0.0.1:4243/containers/hello_world/json'
run
json

CMD='curl -s -X POST 127.0.0.1:4243/containers/hello_world/stop'
run
raw

CMD='curl -s 127.0.0.1:4243/containers/hello_world/json'
run
json

CMD='curl -s -X POST 127.0.0.1:4243/containers/hello_world/start'
run
raw

CMD='curl -s -X POST 127.0.0.1:4243/containers/hello_world/attach?logs=true&stdout=true&stderr=true'
run
raw

CMD='curl -s -X POST 127.0.0.1:4243/containers/hello_world/attach?stream=true&stdout=true&stderr=true'
run
raw

CMD='curl -s -X POST 127.0.0.1:4243/containers/hello_world/stop'
run
raw

CMD='curl -s -X DELETE 127.0.0.1:4243/containers/hello_world'
run
raw


