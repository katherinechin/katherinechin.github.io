#!/bin/bash
for f in $(ls *.jpg)
do
    filename=$(basename $f | sed 's/@2x././g')
    echo $filename

    H=$(sips -g pixelHeight "$f" | grep 'pixelHeight' | cut -d: -f2)
    W=$(sips -g pixelWidth "$f" | grep 'pixelWidth' | cut -d: -f2)

    H50=$(($H / 4))
    W50=$(($W / 4))

    sips --resampleHeight "$H50" "$f" >/dev/null
done
