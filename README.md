# bank_fix
Remove the root detector implemented by an app.

**I am not to be liable for direct, indirect or consequential damages by this modification, use it at your own risk.**

### What?

XXX has introduced new amazing checkups to assert that the device running it is not rooted. 
This is giving a false positive in my One Plus 3T unrooted device.

### Please explain me everything!

Basically this project gets `smali` files from the DEXes from the APK running the `decompiler.sh` and replaces known strings with empty ones.
After than, the script inside `recompiler.sh` rebuilds the APK.  
During this process we sign the app with new keys,
so you'll need to uninstall the old version of the app.

### How to?
#### I love Docker
Great! The easiest way to run this tool is using Docker.
You can build/use the image specified in this repository.

If you're building the image yourself, you can use:
```bash
docker build --rm -t ppamorim/bank_fix
```

Once you have the image on your machine, you can run it using:
```bash
docker run -it -v `pwd`:/app ppamorim/bank_fix bork FOO BAR
```
Here, we assume the name of the apk is *bork.apk*, with *FOO* and *BAR* being arguments.  
Note that the `-v` mounts your **current directory** inside the running Docker container.  
Therefore, you should execute this container from the directory containing `bork.apk`.  

#### I hate Docker
Awh. Okay, then just go ahead and install `openjdk-11-jdk-headless`,
`apktool` and `zipalign`
(these include `keytool` and `jarsigner` also).

Place your `bork.apk` file in the same directory as this repository, and then run:
```bash
./fix.sh bork FOO BAR
```
similar to the above.

Enjoy!

I am not to be liable for direct, indirect or consequential damages by this modification, use it at your own risk.