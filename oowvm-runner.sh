#!/bin/bash

# old oneliner
# rm -r __MACOSX; rm -r iphone PC_backup; unzip iphone; cp -r PC PC_backup

rm -r __MACOSX

echo "Close Obsidian and press a key when done"
read

echo "Press a key to run: rm -r iphone"
read
rm -r iphone

echo "Press a key to run: unzip iphone.zip"
read
unzip iphone.zip

timestamp=`date +%s`
echo "Press a key to run: cp -r PC PC_bkp_${timestamp}"
read
cp -r PC PC_bkp_${timestamp}

echo "Press a key to run: oowvm iphone PC | less"
read
oowvm iphone PC | less
