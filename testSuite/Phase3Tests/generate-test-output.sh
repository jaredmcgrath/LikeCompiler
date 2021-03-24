#!/bin/bash
# Created by Jared McGrath for CMPE 458 Group N
echo "Generating expected test output - PHASE 3"

# Colors!
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

for i in *.pt
do
  printf "$BLUE  Generating output for $i$NC\n"
  ./test-single.sh -L $pt_lib_path -f $i -s yes -c no -q
done

echo "Checking for ssltrace errors - PHASE 3"

for i in *.pt.eOutput
do
  printf "$BLUE$i$NC\n"
  num_errors=$(cat $i | grep -c -E '(.*)error(.*)\n')

  if [ $num_errors -ne 0 ]; then
    printf "$RED  $num_errors ERRORS$NC\n"
    echo "$(cat $i | grep -n error)"
    # grep_errors="yes"
    # read -p "Grep output errors in $i? ([Y]/n) " user_response
    # case "$user_response" in
    #   n|N ) echo "  --> Won't grep errors"; echo ""; grep_errors="no";;
    #   * ) echo "  --> Errors:"; echo "";;
    # esac
    # if [ $grep_errors = "yes" ]; then
    #   echo "$(cat $i | grep -n error)"
    #   echo ""
    # fi
  else
    printf "$GREEN  NO ERRORS$NC\n"
  fi
done
