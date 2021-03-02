#!/bin/bash
echo "Testing all phases!"

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

./test-phase1.sh -L $pt_lib_path

./test-phase2.sh -L $pt_lib_path
