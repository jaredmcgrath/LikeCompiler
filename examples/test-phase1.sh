#!/bin/bash
echo "Testing Start - PHASE 1"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -L|--lib)
    pt_lib_path="$2"
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# Determine path to lib/pt
if [ -z ${pt_lib_path+x} ]; then
	pt_lib_path="../src/lib/pt"
fi

# Make sure the output directory exists
if [ ! -d "p1_out" ]; then
  mkdir p1_out
fi

for i in *.pt
do
	ssltrace "ptc -o1 -t1 -L $pt_lib_path $i" $pt_lib_path/scan.def -e > p1_out/$i.eOutput
	diff -b "$i.ssltrace-t1-e" "p1_out/$i.eOutput" > p1_out/$i.eOutputDiff
done
cd p1_out
for i in *.eOutputDiff
do
	echo $i
  cat $i
done
