#!/bin/bash

diretorio=$1
contador=1

cd $diretorio

mkdir tmp

for f in *.*; do 
	extensao="${f##*.}"
	extensao="${extensao,,}"
	mv -v "$f" tmp/"$(printf "$(basename "$diretorio")_%02i%s" "$contador" ".$extensao")"
	
	((contador++))
done

mv tmp/* .
rm -r tmp
