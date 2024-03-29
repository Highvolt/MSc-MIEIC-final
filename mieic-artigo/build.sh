#!/bin/bash

unset LANG
unset LC_CTYPE
unset LC_ALL
# Remove existent PDF file.
rm sumary-en.pdf 2> /dev/null
rm resumo.pt.pdf 2> /dev/null

# Build report.
if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ s|S ]]; then
    make sumary-en._show
  else
    make sumary-en
    make resumo-pt
  fi

else
  make sumary-en
fi

# Clean compilation files.
make clean
cp sumary-en.pdf finalSumary-en.pdf
cp resumo-pt.pdf resumoFinal-pt.pdf

if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ o|O ]]; then
    open finalSumary-en.pdf
    open resumoFinal-pt.pdf
  fi
fi

