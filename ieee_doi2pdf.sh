#!/bin/bash

function usagexit ()
{
  printf "usage: %s [#] [pdf_output_name]\n" ${0##*/}
  exit 2
} >&2

URL="http://ieeexplore.ieee.org/stampPDF/getPDF.jsp?tp=&arnumber="
TMP_HTML="tmp.html"
DOI_REF_SERVER="https://doi.org/"

if (( $# == 0 )) || (( $# > 2)); then
  usagexit
fi  

DOI=${1##https:\/\/doi.org/}
wget -q "${DOI_REF_SERVER}${DOI}" -O $TMP_HTML 
if [ ! -f "$TMP_HTML" ]; then
  print "html file download has failed for %s" $DOI 
  exit 2
fi

IEEE_ID=$(sed -n 's/.*arnumber=\([0-9]\+\)".*/\1/p' $TMP_HTML)
if (( $# ==1 )); then
  OUTPUT_PDF="${IEEE_ID}.pdf"
else
  OUTPUT_PDF=$2
fi

wget -q --show-progress "${URL}${IEEE_ID}" -O $OUTPUT_PDF 
rm $TMP_HTML # remove temporary file

