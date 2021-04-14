#!/bin/bash
# Created by Jared McGrath for CMPE 458 Group N
echo "Generating expected test output - PHASE 4"

# Colors!
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
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
  ./test-single.sh -L $pt_lib_path -f $i -s yes -c no -o phase2_eOutput -q
done

printf "\n---------------\n$GREEN PHASE 3 TESTS $NC\n---------------\n\n"

for i in ../Phase3Tests/*.pt
do
  printf "$BLUE  Generating output for $i$NC\n"
  ./test-single.sh -L $pt_lib_path -f $i -s yes -c no -o phase3_eOutput -q
done

printf "\n---------------\n$GREEN PHASE 4 TESTS $NC\n---------------\n\n"

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
    num_errors=$(cat $i | grep -c -E '(.*)?error(.*)\n')
    compiler_warn=$(cat $i | grep -c '### COMPILER WARNINGS ###')
    if [ $num_errors -ne 0 ]; then
      printf "$RED  $num_errors ERRORS$NC\n"
      echo "$(cat $i | grep -n error)"
    fi
    if [ $compiler_warn -ne 0 ]; then
      printf "$YELLOW  COMPILE WARNINGS PRESENT$NC\n"
      sed -n '/### COMPILER WARNINGS ###/,/### START OF PROGRAM OUTPUT ###/{/### COMPILER WARNINGS ###/b;/### START OF PROGRAM OUTPUT ###/b;p}' $i
    fi
    if [ $num_errors -eq 0 ] && [ $compiler_warn -eq 0 ]; then
      printf "$GREEN  NO ERRORS$NC\n"
    fi
  done

  printf "\n------------------------------\n$GREEN PHASE 3 SSLTRACE ERROR CHECK $NC\n------------------------------\n\n"
  for i in phase3_eOutput/*.pt.eOutput
  do
    printf "$BLUE$i$NC\n"
    num_errors=$(cat $i | grep -c -E '(.*)?error(.*)\n')
    compiler_warn=$(cat $i | grep -c '### COMPILER WARNINGS ###')
    if [ $num_errors -ne 0 ]; then
      printf "$RED  $num_errors ERRORS$NC\n"
      echo "$(cat $i | grep -n error)"
    fi
    if [ $compiler_warn -ne 0 ]; then
      printf "$YELLOW  COMPILE WARNINGS PRESENT$NC\n"
      sed -n '/### COMPILER WARNINGS ###/,/### START OF PROGRAM OUTPUT ###/{/### COMPILER WARNINGS ###/b;/### START OF PROGRAM OUTPUT ###/b;p}' $i
    fi
    if [ $num_errors -eq 0 ] && [ $compiler_warn -eq 0 ]; then
      printf "$GREEN  NO ERRORS$NC\n"
    fi
  done

  printf "\n------------------------------\n$GREEN PHASE 4 SSLTRACE ERROR CHECK $NC\n------------------------------\n\n"
  for i in *.pt.eOutput
  do
    printf "$BLUE$i$NC\n"
    num_errors=$(cat $i | grep -c -E '(.*)?error(.*)\n')
    compiler_warn=$(cat $i | grep -c '### COMPILER WARNINGS ###')
    if [ $num_errors -ne 0 ]; then
      printf "$RED  $num_errors ERRORS$NC\n"
      echo "$(cat $i | grep -n error)"
    fi
    if [ $compiler_warn -ne 0 ]; then
      printf "$YELLOW  COMPILE WARNINGS PRESENT$NC\n"
      sed -n '/### COMPILER WARNINGS ###/,/### START OF PROGRAM OUTPUT ###/{/### COMPILER WARNINGS ###/b;/### START OF PROGRAM OUTPUT ###/b;p}' $i
    fi
    if [ $num_errors -eq 0 ] && [ $compiler_warn -eq 0 ]; then
      printf "$GREEN  NO ERRORS$NC\n"
    fi
  done
fi