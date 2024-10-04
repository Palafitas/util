#!/bin/bash

diretorio=$1
arquivo_final=$(basename $1)
extensao_final=''
cd $diretorio

for f in *; do
	if [ -z $extensao_final ]; then
		extensao_final="${f##*.}"
	fi

	echo "file '$f'" >> temp.txt
done

ffmpeg -f concat -safe 0 -i temp.txt -c copy $arquivo_final.$extensao_final

rm temp.txt
