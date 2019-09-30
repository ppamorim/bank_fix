#!/bin/sh

# if ! [ "$1" ]; then
#     echo "usage to recompile: $0 <file.apk>"
#     exit -1
# fi

# Configuration based on these scripts: 
# https://stackoverflow.com/a/44236755/2430555
# https://github.com/scottyab/rootbeer/blob/master/rootbeerlib/src/main/java/com/scottyab/rootbeer/Const.java

./decompile.sh $1

FOO=$2
BAR=$3

cd smali

echo "Removing Root strings"

apps=( 
    "com.noshufou.android.su" 
    "com.noshufou.android.su.elite" 
    "eu.chainfire.supersu"
    "com.koushikdutta.superuser"
    "com.thirdparty.superuser"
    "com.yellowes.su"
    "com.topjohnwu.magisk"
    "com.koushikdutta.rommanager"
    "com.koushikdutta.rommanager.license"
    "com.dimonvideo.luckypatcher"
    "com.chelpus.lackypatch"
    "com.ramdroid.appquarantine"
    "com.ramdroid.appquarantinepro"
    "com.android.vending.billing.InAppBillingService.COIN"
    "com.chelpus.luckypatcher"
    "com.devadvance.rootcloak"
    "com.devadvance.rootcloakplus"
    "de.robv.android.xposed.installer"
    "com.saurik.substrate"
    "com.zachspong.temprootremovejb"
    "com.amphoras.hidemyroot"
    "com.amphoras.hidemyrootadfree"
    "com.formyhm.hiderootPremium"
    "com.formyhm.hideroot"
)

echo "Removing blacklisted apps"

for app in "${apps[@]}"; do
    find . -type f -name "$FOO.smali" -print0 | xargs -0 sed -i '' -e "s/\"$app\"/\"\"/g";
    find . -type f -name "$BAR.smali" -print0 | xargs -0 sed -i '' -e "s/\"$app\"/\"\"/g";
done

echo "Blacklisted apps removed"

paths=(
    "/data/local/"
    "/data/local/bin/"
    "/data/local/xbin/"
    "/sbin/"
    "/su/bin/"
    "/system/bin/"
    "/system/bin/.ext/"
    "/system/bin/failsafe/"
    "/system/sd/xbin/"
    "/system/usr/we-need-root/"
    "/system/xbin/"
    "/cache/"
    "/data/"
    "/dev/"
    "/system"
    "/system/bin"
    "/system/sbin"
    "/system/xbin"
    "/vendor/bin"
    "/sbin"
    "/etc"
)

echo "Removing paths"

for path in "${paths[@]}"; do
    find . -type f -name "$FOO.smali" -print0 | xargs -0 sed -i '' -e "s+\"$path\"+\"\"+g";
    find . -type f -name "$BAR.smali" -print0 | xargs -0 sed -i '' -e "s+\"$path\"+\"\"+g";
done

echo "Paths removed"

suPaths=(
    "/system/app/Superuser.apk"
    "/sbin/su"
    "/system/bin/su"
    "/system/xbin/su"
    "/data/local/xbin/su"
    "/data/local/bin/su"
    "/system/sd/xbin/su"
    "/system/bin/failsafe/su"
    "/data/local/su"
)

echo "Removing SU paths"

for suPath in "${suPaths[@]}"; do 
    find . -type f -name "$FOO.smali" -print0 | xargs -0 sed -i '' -e "s+\"$suPath\"+\"\"+g";
    find . -type f -name "$BAR.smali" -print0 | xargs -0 sed -i '' -e "s+\"$suPath\"+\"\"+g";
done

miscs=(
    "/system/xbin/which",
    "su"
)

for misc in "${miscs[@]}"; do 
    find . -type f -name "$FOO.smali" -print0 | xargs -0 sed -i '' -e "s+\"$misc\"+\"\"+g";
    find . -type f -name "$BAR.smali" -print0 | xargs -0 sed -i '' -e "s+\"$misc\"+\"\"+g";
done

echo "SU paths removed"

echo "Cleanup completed, recompiling..."

cd ..

./recompile.sh $1