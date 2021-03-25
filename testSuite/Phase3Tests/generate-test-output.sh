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

printf "\n---------------\n$GREEN PHASE 2 TESTS $NC\n---------------\n\n"

for i in ../Phase2Tests/*.pt
do
  echo $i
  printf "$BLUE  Generating output for $i$NC\n"
  ./test-single.sh -L ../../src/lib/pt -f $i -s yes -c no -o phase2_eOutput -q
done

printf "\n---------------\n$GREEN PHASE 3 TESTS $NC\n---------------\n\n"

for i in *.pt
do
  printf "$BLUE  Generating output for $i$NC\n"
  ./test-single.sh -L $pt_lib_path -f $i -s yes -c no -q
done

display_ssltrace_errors="yes"
read -p "Check for ssltrace errors? ([Y]/n) " user_response
case "$user_response" in
  n|N ) echo "  --> Won't check for errors."; echo ""; display_ssltrace_errors="no";;
  * ) echo "  --> Performing error check!"; echo "";;
esac

if [ $display_ssltrace_errors = "yes" ]; then
  printf "\n------------------------------\n$GREEN PHASE 2 SSLTRACE ERROR CHECK $NC\n------------------------------\n\n"
  for i in phase2_eOutput/*.pt.eOutput
  do
    printf "$BLUE$i$NC\n"
    num_errors=$(cat $i | grep -c -E '(.*)error(.*)\n')

    if [ $num_errors -ne 0 ]; then
      printf "$RED  $num_errors ERRORS$NC\n"
      echo "$(cat $i | grep -n error)"
    else
      printf "$GREEN  NO ERRORS$NC\n"
    fi
  done

  printf "\n------------------------------\n$GREEN PHASE 3 SSLTRACE ERROR CHECK $NC\n------------------------------\n\n"
  for i in *.pt.eOutput
  do
    printf "$BLUE$i$NC\n"
    num_errors=$(cat $i | grep -c -E '(.*)error(.*)\n')

    if [ $num_errors -ne 0 ]; then
      printf "$RED  $num_errors ERRORS$NC\n"
      echo "$(cat $i | grep -n error)"
    else
      printf "$GREEN  NO ERRORS$NC\n"
    fi
  done
fi