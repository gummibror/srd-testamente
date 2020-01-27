#!/bin/bash
# Find gives too much whitespace
count=$(find . -type f -name '*.pdf' -maxdepth 1 | wc -l | sed -e 's/[\t ]//g;/^$/d')
num=$((count + 1))
cd ./latexfiler
./kallelse.sh $num ../nextmeet
mv "./texput.pdf" "../kallelse-$num.pdf"
