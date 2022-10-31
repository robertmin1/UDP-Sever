#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob globstar

git clone https://github.com/robertmin1/UDP-Sever && cd UDP-Sever/testdata
go run make-file.go
cd ..
go run UDP-sever.go
xdotool key ctrl+alt+t

./send-to-sever.sh
if grep -i "hello world" /testdata/test.txt; then
    return 0
else
    return 1
fi