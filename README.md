https://medium.com/@authmane512/how-to-build-an-apk-from-command-line-without-ide-7260e1e22676


export PROJ=/home/hezzie/myp/android/HelloAndroid {path/to/HelloAndroid}

cd ~/Android/Sdk/build-tools/28.0.3/             
./aapt package -f -m -J $PROJ/src -M $PROJ/AndroidManifest.xml -S $PROJ/res -I ~/Android/Sdk/platforms/android-28/android.jar


cd $PROJ
javac -d obj -classpath src -bootclasspath ~/Android/Sdk/platforms/android-28/android.jar src/com/example/helloandroid/*.java


cd ~/Android/Sdk/build-tools/28.0.3/   
./dx --dex --output=$PROJ/bin/classes.dex $PROJ/obj

./aapt package -f -m -F $PROJ/bin/hello.unaligned.apk -M $PROJ/AndroidManifest.xml -S $PROJ/res -I ~/Android/Sdk/platforms/android-28/android.jar
cp $PROJ/bin/classes.dex .
./aapt add $PROJ/bin/hello.unaligned.apk classes.dex

./apksigner sign --ks mykey.keystore $PROJ/bin/hello.unaligned.apk


./zipalign -f 4 $PROJ/bin/hello.unaligned.apk $PROJ/bin/hello.unaligned.apk

## Connect USB first

adb install $PROJ/bin/hello.apk
adb shell am start -n com.example.helloandroid/.MainActivity

