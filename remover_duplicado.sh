#!/bin/bash

cd $1

echo 'Antes:'
ls

md5sum * | sort | awk 'BEGIN{lasthash = ""} $1 == lasthash {print $2} {lasthash = $1}' | xargs rm

echo 'Depois:'
ls
