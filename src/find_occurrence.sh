#!/bin/bash

user=`whoami`
filesLogPath=(/home/severalcamper/T02D02-0-master/src/files.log)
curData=`date +"%Y-%m-%d"`
curTime=`date +"%H:%M"`

read -p "Введите путь до файла: " filePath 
read -p "Введите строку для замены: " replacmentString 
read -p "Введите строку, на которую нужно заменить: " stringToReplace

shaSum=`sha256sum < $filePath`

if [[  -n $filePath && -n $replacmentString && -n $stringToReplace ]];then

    if [[ -e $filePath && -s $filePath ]];then

        if grep -q $replacmentString $filePath;then

            cd /
            echo "Вы ввели следующие данные:"
            echo "Путь до файла: $filePath"
            echo "Строка к замене: "$replacmentString""
            echo "Строка, на которую заменить: "$stringToReplace""

            sed -i 's/'$replacmentString'/'$stringToReplace'/g' .$filePath
            fileSize=`stat -c %s ''$filePath''`

            echo "$filePath - $fileSize - $curData $curTime - "$shaSum" sha256" >> $filesLogPath
        else
            echo "В этом файле нет такой строки! Пожалуйста, вееди строку из файла"
        fi

    else
        echo "У меня проблема! Похоже, файл недостпуен для записи или пустой. А, возможно, его вовсе нет! Проверь, пожалуйста"
        echo "Также, проверь, правильно ли ты ввел путь до файла. Начать стоит так $HOME"
    fi
    
else
    echo "У меня проблема! Похоже, что ты не ввел какие-то данные. Пожалуйста, введи данные по следующей схеме: <путь до файла (относительно корневой директории)>,<строку для замены>,<саму замену (в виде строки)>"
fi