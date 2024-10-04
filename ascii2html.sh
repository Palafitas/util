#!/bin/bash
texto_final='<a>'

while read linha; do
  texto_final="$texto_final<br>$linha"
done <$1
texto_final="$texto_final</a>"
echo $texto_final
