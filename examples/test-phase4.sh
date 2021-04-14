#!/bin/bash
echo "Testing Start - PHASE 4"

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
pt_lib_path=$(realpath $pt_lib_path)

# Make sure the output directory exists
if [ ! -d "p4_out" ]; then
  mkdir p4_out
fi

for i in *.pt
do
  i_basename=$(basename $i)
  cp $i p4_out/
  cd p4_out
  ssltrace "ptc -o4 -t4 -L $pt_lib_path $i_basename" $pt_lib_path/coder.def -t > "$i_basename.ssltrace"
  ptc -L $pt_lib_path -S $i_basename
  cd ..
  i_src="${i_basename%.*}.s"
	diff -b "$i_src" "p4_out/$i_src" > p4_out/$i.eOutputDiff
done
cd p4_out
for i in *.eOutputDiff
do
	echo $i
  cat $i
done
