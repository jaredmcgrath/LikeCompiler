#!/bin/bash
echo "Testing Start - PHASE 3"

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
if [ ! -d "p3_out" ]; then
  mkdir p3_out
fi

for i in *.pt
do
	ssltrace "ptc -o3 -t3 -L $pt_lib_path $i" $pt_lib_path/semantic.def -e > p3_out/$i.eOutput
	diff -b "$i.ssltrace-t3-e" "p3_out/$i.eOutput" > p3_out/$i.eOutputDiff
done
cd p3_out
for i in *.eOutputDiff
do
	echo $i
  cat $i
done
