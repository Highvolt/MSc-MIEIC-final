#!/bin/bash

# Remove existent PDF file.
rm pdis-en.pdf 2> /dev/null

# Build report.
if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ s|S ]]; then
    make pdis-en._show
  else
    make pdis-en
  fi

else
  make pdis-en
fi

# Clean compilation files.
make clean
cp pdis-en.pdf techreport.pdf

if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ o|O ]]; then
    open techreport.pdf
  fi
fi

