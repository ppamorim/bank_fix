# bank_fix
Remove the root detector implemented by an app.

**I am not to be liable for direct, indirect or consequential damages by this modification, use it at your own risk.**

### What?

XXX has introduced new amazing checkups to assert that the device running it is not rooted. 
This is giving a false positive in my One Plus 3T unrooted device.

### Please explain me everything!

Basically this project gets `smali` files from the DEXes from the APK running the `decompiler.sh` and replaces known strings with empty ones.
After than, the script inside `recompiler.sh` rebuilds the APK. Unfortunately it needs to be unsigned so you will need to uninstall the app. :(

### How to?

Just run `fix.sh <APK NAME WITHOUT .apk>` and wait.

I am not to be liable for direct, indirect or consequential damages by this modification, use it at your own risk.