#!/bin/bash

if ! [ "$1" ]; then
    echo "usage to recompile: $0 <file.apk>"
    exit -1
fi

fn=${1%.apk}

rm -f $fn.unaligned.apk $fn.smali.apk
rm -rf smali/build

apktool b -f smali/ -o $fn.unaligned.apk
jarsigner -verbose -sigalg MD5withRSA -digestalg SHA1 -keystore ~/.android/debug.keystore  -storepass android  $fn.unaligned.apk  androiddebugkey
./zipalign -v 4 $fn.unaligned.apk $fn.smali.apk
rm -rf smali/build

echo "Recompile done."