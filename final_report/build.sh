#!/bin/bash

unset LANG
unset LC_CTYPE
unset LC_ALL
# Remove existent PDF file.
rm mieic-en.pdf 2> /dev/null

# Build report.
if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ s|S ]]; then
    make mieic-en._show
  else
    make mieic-en
  fi

else
  make mieic-en
fi

# Clean compilation files.
make clean
cp mieic-en.pdf finalReport.pdf

if [[ "$#" -eq 1 ]]; then

  if [[ "$1" =~ o|O ]]; then
    open finalReport.pdf
  fi
fi

