#!/bin/bash
echo "Testing Single - PHASE 2"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -f|--file)
    src_path="$2"
    shift # past argument
    shift # past value
    ;;
    -L|--lib)
    pt_lib_path="$2"
    shift # past argument
    ;;
    -s|--save)
    save_output_in_dir="$2"
    shift # past argument
    shift # past value
    ;;
    -c|--compare)
    compare_output="$2"
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# Get the user's test file name
if [ -z ${src_path+x} ]; then
  read -p "Enter name of test program to run: " src_path
fi

# Determine path to lib/pt
if [ -z ${pt_lib_path+x} ]; then
	pt_lib_path="../../src/lib/pt"
fi

# Make sure the output directory exists
if [ ! -d "p2_out" ]; then
  mkdir p2_out
fi

ssltrace "ptc -o2 -t2 -L $pt_lib_path $src_path" $pt_lib_path/parser.def -e > p2_out/$src_path.eOutput

echo "Output:"
cat "p2_out/$src_path.eOutput"

# See if user wants to save the eOutput
if [ -z ${save_output_in_dir+x} ]; then
  save_output_in_dir="yes"
  read -p "Save output in $src_path.eOutput? ([Y]/n) " user_response
fi
case "$user_response" in
  n|N ) echo "  --> Won't save expected output"; echo ""; save_output_in_dir="no";;
  * ) echo "  --> Will save expected output";;
esac
if [ $save_output_in_dir = "yes" ]; then
  cp "p2_out/$src_path.eOutput" "$src_path.eOutput"
fi

# See if user wants to compare generated output to eOutput
if [ -z ${compare_output+x} ]; then
  compare_output="yes"
  read -p "Compare output to existing $src_path.eOutput? ([Y]/n) " user_response
fi
case "$user_response" in
  n|N ) echo "  --> Won't compare to expected output"; echo ""; compare_output="no";;
  * ) echo "  --> Comparing expected output:"; echo "";;
esac

if [ $compare_output = "yes" ]; then
  diff -b "$src_path.eOutput" "p2_out/$src_path.eOutput" > p2_out/$src_path.eOutputDiff
	echo $src_path
  cat "p2_out/$src_path.eOutputDiff"
fi
