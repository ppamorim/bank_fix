#!/bin/bash

if ! [ "$1" ]; then
    echo "usage decompile: $0 <file.apk>"
    exit -1
fi

fn=${1%.apk}
target_apk=$fn.apk

apktool -r d -f "$target_apk" -o smali

echo "Decompile done."