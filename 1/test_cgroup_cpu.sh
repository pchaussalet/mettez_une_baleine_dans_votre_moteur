#/bin/sh
CMD="docker run -it --cpuset=0 --rm bbl_pch/namespaces stress --cpu 2"
echo ${CMD}
read foo
${CMD}
CMD="docker run -it --cpuset=0,4 --rm bbl_pch/namespaces stress --cpu 2"
echo ${CMD}
read foo
${CMD}
CMD="docker run -it --cpuset=0-3 --rm bbl_pch/namespaces stress --cpu 2"
echo ${CMD}
read foo
${CMD}
read foo
${CMD}
read foo
${CMD}

