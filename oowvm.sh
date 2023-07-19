#!/bin/bash

if [ ! $# == 2 ]; then
  echo "Usage: $0 folderA folderB"
  exit
fi

folderA=$1
folderB=$2


echo "PHASE I: Unique-renaming .png, .jpeg, .jpg files in" $folderA "and updating .md file occurrences"

timestamp=`date +%s`

for image in `ls ./$folderA/*.png ./$folderA/*.jpg ./$folderA/*.jpeg`; do
    image=`basename $image`

    imageNew=$timestamp"_"$image #>>>: pre-pend the timestamp
    
    mv ./$folderA/$image ./$folderB/$imageNew #>>>: rename and move to $folderB

    echo $image ": renamed to" $imageNew "and moved"

    #update occurrences in .md files
    for file in `ls ./$folderA/*.md`; do
	file=`basename $file`
	
	#count occurrences of $image in the file
	if [[ `grep -c ${image} ./$folderA/$file` -gt 0 ]]; then
	    #replace occurrences: note the usae of " rather than ' as, with ',
	    # the shell treats the string literally and literally tries to
	    # replace $image with $imageNew
	    sed -i "s/$image/$imageNew/g" $folderA/$file #>>>: -i for in place;
	    echo $image ": occurrences in" $file "updated"
	fi
    done

done

echo

echo "PHASE II: Merging and moving .md files from folder" $folderA "to folder" $folderB

for file in `ls ./$folderA/*.md`; do
    file=`basename $file`
    
    if test -f "./$folderB/$file"; then #>>>: check if file exists
	echo " " >> $folderB/$file #>>>: empty line
	echo "**merged-part init**" >> $folderB/$file
	echo " " >> $folderB/$file #>>>: empty line

	cat $folderA/$file >> $folderB/$file

	echo " " >> $folderB/$file #>>>: empty line
	echo "**merged-part end**" >> $folderB/$file
	echo " " >> $folderB/$file #>>>: empty line
	
	rm $folderA/$file

	echo $file ": merged with its version in folder" $folderB "and removed"
	
    else #>>>: file does not exist
	mv $folderA/$file ./$folderB
	echo $file ": moved to folder" $folderB
    fi
done
