#!/bin/sh
watch -n1 'hostname; grep foo /etc/passwd; echo; ps aufx; echo; ip addr show; echo; free -om'
