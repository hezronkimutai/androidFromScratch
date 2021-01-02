export PROJ=/home/hezzie/myp/android/

cd ~/Android/Sdk/build-tools/28.0.3/             
./aapt package -f -m -J $PROJ/src -M $PROJ/AndroidManifest.xml -S $PROJ/res -I ~/Android/Sdk/platforms/android-28/android.jar


cd $PROJ
javac -d obj -classpath src -bootclasspath ~/Android/Sdk/platforms/android-28/android.jar src/com/example/Mrbn/*.java


cd ~/Android/Sdk/build-tools/28.0.3/   
./dx --dex --output=$PROJ/bin/classes.dex $PROJ/obj

./aapt package -f -m -F $PROJ/bin/hello.unaligned.apk -M $PROJ/AndroidManifest.xml -S $PROJ/res -I ~/Android/Sdk/platforms/android-28/android.jar
cp $PROJ/bin/classes.dex .
./aapt add $PROJ/bin/hello.unaligned.apk classes.dex

./apksigner sign --ks mykey.keystore $PROJ/bin/hello.unaligned.apk


./zipalign -f 4 $PROJ/bin/hello.unaligned.apk $PROJ/bin/hello.apk


adb install $PROJ/bin/hello.unaligned.apk
adb shell am start -n com.example.Mrbn/.MainActivity
