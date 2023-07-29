#!/bin/bash

# quick and easy convert pdf files to epub

mkdir temp

for i in *pdf ; do

    pdftk "$i" cat 2-end output "temp/$i"
    # Use pdftk to concatenate the pages 2 to the end of the PDF file ('$i') and save the output in the 'temp' directory.

    pdfimages -l 1 -j "$i" "temp/${i%.pdf}"
    # Extract images from the first page (specified by '-l 1') of the PDF file and save them in the 'temp' directory using the same base filename as the original PDF.

done

cd temp

for f in *.jpg; do

    mv "$f" "$(echo "$f" | sed s/-000//)"
    # Rename the file by removing the '-000' suffix from its filename.

done

find ./ -iname "*pdf" -type f | while read f; do

    ebook-convert "$f" "${f%.pdf}.epub" --enable-heuristics --cover "${f%.pdf}.jpg"
    # Use 'ebook-convert' command to convert the PDF file to EPUB format. 
    # The option '--enable-heuristics' enables heuristic processing, 
    # and '--cover' specifies the cover image for the EPUB file.

done

mv *.epub ../
cd .. 
rm -r temp
