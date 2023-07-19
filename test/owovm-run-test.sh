#!/bin/bash

# # DISPLAYING FILE CONTENT OF THE TWO FOLDERS

display_content() {
    echo "Content of folder A"
    ls ./A

    echo

    for file in `ls ./A/*.md`; do
	echo "Content of" $file
	cat $file
    done

    echo

    echo "Content of folder B"
    ls ./B

    echo

    for file in `ls ./B/*.md`; do
	echo "Content of" $file
	cat $file
    done

    echo
}


echo "Content before the merge"
display_content

../owovm.sh A B

echo "Content after the merge"
display_content
