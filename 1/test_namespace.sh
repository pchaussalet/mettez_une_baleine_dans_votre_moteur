#/bin/sh
CMD="docker run -it -u bar -v $(pwd)/demo.sh:/demo.sh --rm bbl_pch/namespaces /demo.sh"
echo ${CMD}
read foo
${CMD}
