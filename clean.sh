#!/usr/bin/env bash

# clean gradle cache
echo -e "\033[32mScanning ~/.android/build-cache ...\033[0m"
rm -rvf ~/.android/build-cache

# clean user cache
echo -e "\033[32mScanning ~/.cache ...\033[0m"
rm -rvf ~/.cache

# clean gradle caches
echo -e "\033[32mScanning ~/.gradle ...\033[0m"
rm -rvf ~/.gradle/caches/jars-*
rm -rvf ~/.gradle/caches/transforms-*
rm -rvf ~/.gradle/daemon
rm -rvf ~/.gradle/wrapper/dists/gradle-*

# clean application log
echo -e "\033[32mScanning ~/Library/Logs ...\033[0m"
rm -rvf ~/Library/Logs

# clean xcode archives
echo -e "\033[32mScanning ~/Library/Developer/Xcode/Archives ...\033[0m"
rm -rvf ~/Library/Developer/Xcode/Archives/*

# clean Cache
echo -e "\033[32mScanning ~/Library/Caches ...\033[0m"
rm -rvf ~/Library/Caches

# clean DingTalk
echo -e "\033[32mScanning ~/Library/Application\ Support/DingTalk ...\033[0m"
rm -rvf ~/Library/Application\ Support/DingTalk
rm -rvf ~/Library/Application\ Support/DingTalkMac

# clean WeChat
echo -e "\033[32mScanning ~/Library/Containers/com.tencent.xinWeChat ...\033[0m"
rm -rvf ~/Library/Containers/com.tencent.*
rm -rvf ~/Library/Containers/*.com.tencent.*

# clean iPhone Software Updates
echo -e "\033[32mScanning ~/Library/iTunes/iPhone Software Updates ...\033[0m"
rm -rvf ~/Library/iTunes/iPhone\ Software\ Updates/*.ipsw

# clean iOS backup
echo -e "\033[32mScanning ~/Library/Application\ Support/MobileSync/Backup ...\033[0m"
rm -rvf ~/Library/Application\ Support/MobileSync/Backup

