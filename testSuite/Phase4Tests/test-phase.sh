#!/bin/bash
# Created by Jared McGrath for CMPE 458 Group N
echo "Testing Start - PHASE 4"

# Colors!
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Set default env val
out_dir="p4_out"

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -L|--lib)
    pt_lib_path="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# Determine path to lib/pt, if not supplied in args
if [ -z ${pt_lib_path+x} ]; then
	pt_lib_path="../../src/lib/pt"
fi

# Make sure the output directory exists
if [ ! -d "$out_dir" ]; then
  mkdir $out_dir
fi

for i in ../Phase2Tests/*.pt
do
  echo $i
  printf "$BLUE  Generating output for $i$NC\n"
  ./test-single.sh -L $pt_lib_path -f $i -s no -c yes -o phase2_eOutput -q
done

for i in ../Phase3Tests/*.pt
do
  echo $i
  printf "$BLUE  Generating output for $i$NC\n"
  ./test-single.sh -L $pt_lib_path -f $i -s no -c yes -o phase3_eOutput -q
done

for i in *.pt
do
  echo $i
  printf "$BLUE  Generating output for $i$NC\n"
  ./test-single.sh -L $pt_lib_path -f $i -s no -c yes -o . -q
done

cd $out_dir
all_passed="true"
for i in *.eOutputDiff
do
  # List output diff file name
	printf "$BLUE$i$NC\n"
  # If output diff has non-zero size, must be a diff
  if [ -s $i ]; then
    all_passed="false"
    printf "$RED TEST FAILED$NC - difference between expected and actual\n"
    cat $i
  else
    printf "$GREEN TEST PASSED$NC - no diff\n"
  fi
  echo ""
done

if [ $all_passed = "true" ]; then
  printf "$GREEN ALL TESTS PASSED$NC\n"
else
  printf "$RED SOME TESTS FAILED$NC\n"
fi
