#!/bin/bash

if ! [ "$1" ]; then
    echo "usage to recompile: $0 <file.apk>"
    exit -1
fi

fn=${1%.apk}

rm -f $fn.unaligned.apk $fn.smali.apk
rm -rf smali/build

# We need a key to sign the apk (in order to install it easily)
if [ ! -f "fix.keystore" ]; then
    keytool -genkey -v -keystore fix.keystore \
        -storepass fixerpass \
        -dname "cn=Fixer, ou=Fixer, o=Fixer, c=NA" \
        -alias fixerkey -keyalg RSA \
        -keysize 2048 -validity 10000
fi

apktool b -f smali/ -o $fn.unaligned.apk

jarsigner -keystore fix.keystore \
    -storepass fixerpass \
    $fn.unaligned.apk fixerkey

zipalign 4 $fn.unaligned.apk $fn.fixed.apk
rm -rf smali/build $fn.unaligned.apk

echo "Recompile done."
