#!/bin/bash

rm -rf __MACOSX

folderA="iphone"
folderB="PC"

echo "This script is about to merge the content of $folderA.zip into your main Obsidian vault $folderB. If this is NOT what you want to do, smash Ctrl+C now!"
read

echo "Close Obsidian and press a key when done"
read

echo "Press a key to run: rm -r $folderA"
read
rm -rf ${folderA}

echo "Press a key to run: unzip $folderA.zip"
read
unzip ${folderA}.zip

timestamp=`date +%s`
echo "Press a key to run: cp -r ${folderB} ${folderB}_bkp_${timestamp}"
read
cp -r ${folderB} ${folderB}_bkp_${timestamp}

echo "Press a key to run: oowvm $folderA $folderB | less"
read
oowvm ${folderA} ${folderB} | less
