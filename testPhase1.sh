#!/bin/bash
echo "Testing Start"
for i in *.pt
do
	ssltrace "ptc -o1 -t1 -L ../CMPE458/src/lib/pt $i" ../CMPE458/src/lib/pt/scan.def -e > scriptOutputs/$i.eOutput
	diff "$i.ssltrace-t1-e" "scriptOutputs/$i.eOutput" > scriptOutputs/$i.eOutputDiff
done
cd scriptOutputs
for i in *.eOutputDiff
do
	echo $i
       	cat $i
done


