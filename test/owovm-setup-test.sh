#!/bin/bash

rm -rf A
rm -rf B

mkdir A
mkdir B

# SETTING UP IMAGE FILES

cp sample.jpg ./A/image1.jpg
cp sample.jpeg ./A/image2.jpeg
cp sample.png ./A/image3.png

cp sample.jpg ./B/image1.jpg
cp sample.jpeg ./B/image2.jpeg
cp sample.png ./B/image3.png

# SETTING UP .md FILE CONTENT

echo "this line was written on file1 in folder A and contains image [[image1.jpg]]" > ./A/file1.md
echo "this line was written on file2 in folder A and contains image [[image2.jpeg]]" > ./A/file2.md
echo "this line was written on file3 in folder A and contains image [[image3.png]]" > ./A/file3.md

echo "this line was written on file1 in folder B and contains image [[image1.jpg]]" > ./B/file1.md
echo "this line was written on file2 in folder B and contains image [[image2.jpeg]]" > ./B/file2.md
echo "this line was written on file4 in folder B and contains image [[image3.png]]" > ./B/file4.md
