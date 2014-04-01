#!/bin/sh

if [ $1 -eq "full" ]
	then
		cd .. && ./changeAppSettings.sh -a && android update project -p project && cd project && ndk-build NDK_DEBUG=1 && ant debug && adb install -r bin/MainActivity-debug.apk
	else
		ndk-build NDK_DEBUG=1 && ant debug && adb install -r bin/MainActivity-debug.apk
exit 1
fi
