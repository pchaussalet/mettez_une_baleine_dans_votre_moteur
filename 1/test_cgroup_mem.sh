#/bin/sh
CMD="docker run -it -m 128m --rm bbl_pch/namespaces stress --vm 1 --vm-bytes 128M"
echo ${CMD}
read foo
${CMD}

echo
CMD="docker run -it -m 128m --rm bbl_pch/namespaces stress --vm 1 --vm-bytes 512M"
echo ${CMD}
read foo
${CMD}

echo
CMD="docker run -it -m 128m --rm bbl_pch/namespaces stress --vm 1 --vm-bytes 200M"
echo ${CMD}
read foo
${CMD}
