#!/bin/bash
unicLine=1
previousLine=`head -1 b.txt | cut -d" " -f 1`
IFS=$'\n'
for entry in $(tail -n +2 b.txt)
    do
    if IFS=' '; then
        for value in $entry
            do
            echo "$value"
            if [ $value != $previousLine ] ;then
                unicLine=$((unicLine+1))
                previousLine=$value
            fi
            break
            done
    fi
    done

echo ""
echo "$unicLine"
echo ""

strCount=`wc -l < files.log`
prevOccurrence = "NULL"
hashChangeFiles=0

for (( a = 1; a <= $strCount; a++ ))
    do
        echo ""
        curOccurence="`awk 'BEGIN{FS=" "} NR=='$a' {print $8;exit;}' files.log`"
        echo "$curOccurence"
        if [[ $curOccurence != $prevOccurrence ]]; then
            hashChangeFiles=$((hashChangeFiles+1))
            prevOccurrence=$curOccurence
        fi
        echo "$hashChangeFiles"
    done

