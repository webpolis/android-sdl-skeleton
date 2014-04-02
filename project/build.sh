#!/bin/bash
if [ "$1" == "full" ];
	then
		cd .. && ./changeAppSettings.sh -a && android update project -p project && cd project && ndk-build NDK_DEBUG=1 && ant debug && adb install -r bin/MainActivity-debug.apk
	else
		ndk-build NDK_DEBUG=1 && ant debug && adb install -r bin/MainActivity-debug.apk
fi

adb shell am start -n com.webpolis.game.soccerkup/.MainActivity
sleep 1
~/dev/android-log.sh com.webpolis.game.soccerkup

exit 1
