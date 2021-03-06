#!/bin/bash
# Created by Jared McGrath for CMPE 458 Group N
echo "Testing Start - ALL PHASES"

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
	pt_lib_path="../../src/lib/pt"
fi

this_dir=$(realpath .)

cd Phase1Tests
./test-phase.sh -L $pt_lib_path
cd $this_dir

cd Phase2Tests
./test-phase.sh -L $pt_lib_path
cd $this_dir

cd Phase3Tests
./test-phase.sh -L $pt_lib_path
cd $this_dir

cd Phase4Tests
./test-phase.sh -L $pt_lib_path
cd $this_dir
