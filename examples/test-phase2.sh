#!/bin/bash
echo "Testing Start - PHASE 2"

# Make sure the output directory exists
if [ ! -d "p2_out" ]; then
  mkdir p2_out
fi

for i in *.pt
do
	ssltrace "ptc -o2 -t2 -L ../src/lib/pt $i" ../src/lib/pt/parser.def -e > p2_out/$i.eOutput
	diff -b "$i.ssltrace-t2-e" "p2_out/$i.eOutput" > p2_out/$i.eOutputDiff
done
cd p2_out
for i in *.eOutputDiff
do
	echo $i
  cat $i
done
