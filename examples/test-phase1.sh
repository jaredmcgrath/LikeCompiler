#!/bin/bash
echo "Testing Start - PHASE 1"

# Make sure the output directory exists
if [ ! -d "p1_out" ]; then
  mkdir p1_out
fi

for i in *.pt
do
	ssltrace "ptc -o1 -t1 -L ../src/lib/pt $i" ../src/lib/pt/scan.def -e > p1_out/$i.eOutput
	diff -b "$i.ssltrace-t1-e" "p1_out/$i.eOutput" > p1_out/$i.eOutputDiff
done
cd p1_out
for i in *.eOutputDiff
do
	echo $i
  cat $i
done
