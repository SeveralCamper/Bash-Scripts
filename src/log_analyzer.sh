#!/bin/bash

read -p "Введите абсолютный путь до файла: " first 

if [ "x$first" != x ];then
    if [[ -e $first && -s $first ]];then
        cd /
        strCount=`wc -l < $first` 

        unicFiles=1
        previousFile=`head -1 $first | cut -d" " -f 1`
        IFS=$'\n'
        for entry in $(tail -n +2 $first)
            do
            if IFS=' '; then
                for value in $entry
                    do
                    if [ $value != $previousFile ] ;then
                        unicFiles=$((unicFiles+1))
                        previousFile=$value
                    fi
                    break
                    done
            fi
            done

        prevOccurrence="NULL"
        hashChangeFiles=1

        for (( a = 1; a <= $strCount; a++ ))
            do
                curOccurence="`awk 'BEGIN{FS=" "} NR=='$a' {print $8;exit;}' $first`"
                if [[ $curOccurence != $prevOccurrence ]]; then
                    hashChangeFiles=$((hashChangeFiles+1))
                    prevOccurrence=$curOccurence
                fi
            done

        echo "$strCount $unicFiles $hashChangeFiles"

    else
        exit
    fi
else
    exit
fi
