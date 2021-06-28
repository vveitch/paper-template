#!/usr/bin/env bash

# script for submitting to arxiv

PAPER='your-paper'
DOC='arxiv-temp'
rm -rf $DOC 
mkdir $DOC 

cp preamble.tex $DOC/.
cp $PAPER.bbl $DOC/.
# cp nocommenting.tex $DOC/commenting.tex
# cp novruler.tex $DOC/myvruler.tex
# cp 0-definitions.tex $DOC/0-definitions.tex
cp -R figures $DOC/.
cp -R preamble $DOC/.

perl -pe 's/(^|[^\\])%.*/\1%/' < $PAPER.tex | \
perl -pe 's/(^|[^\\])\\fTBD.*/\1/' | \
perl -pe 's/(^|[^\\])\\fPROBLEM.*/\1/' > $DOC/$PAPER.tex

perl -pe 's/(^|[^\\])%.*/\1%/' < defs.tex > $DOC/defs.tex 
perl -pe 's/(^|[^\\])%.*/\1%/' < headers.tex > $DOC/headers.tex 

rm arxiv.zip
zip -r arxiv.zip $DOC 
