#!/bin/bash
# Created by Jared McGrath for CMPE 458 Group N
echo "Testing Single - PHASE 4"

# Set default env val
quiet="no"
out_dir="p4_out"

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
    -o|--output)
    saved_out_dir="$2"
    shift # past argument
    shift # past value
    ;;
    -L|--lib)
    pt_lib_path="$2"
    shift # past argument
    shift # past value
    ;;
    -s|--save)
    save_output_in_dir="$2"
    shift # past argument
    shift # past value
    ;;
    -c|--compare)
    compare_output="$2"
    shift # past argument
    shift # past value
    ;;
    -q|--quiet)
    quiet="yes"
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# Get the user's test file name, if not supplied in args
if [ -z ${src_path+x} ]; then
  read -p "Enter name of test program to run: " src_path
fi

# Determine persistent eOutput directory, if not supplied in args
if [ -z ${saved_out_dir+x} ]; then
  saved_out_dir="."
fi
saved_out_dir=$(realpath $saved_out_dir)

# Determine path to lib/pt, if not supplied in args
if [ -z ${pt_lib_path+x} ]; then
	pt_lib_path="../../src/lib/pt"
fi
# either way, convert to absolute path
pt_lib_path=$(realpath $pt_lib_path)

# Make sure the output directory exists
if [ ! -d "$out_dir" ]; then
  mkdir $out_dir
fi

# Make sure the saved output directory exists
if [ ! -d "$saved_out_dir" ]; then
  mkdir $saved_out_dir
fi

# Output file path
base_src_path=$(basename $src_path)
prog_filename="${base_src_path%.*}"
eoutput_path=$(realpath "$out_dir/$base_src_path.eOutput")

# do the compiling in out_dir
# copy the source program
cp $src_path "$out_dir/$base_src_path"
cd $out_dir
# Generate executable
compile_msg=$(ptc -L $pt_lib_path $base_src_path)
executable_src_path=$(realpath $prog_filename.out)
# Check to see if compilation was successful
if [ -f $executable_src_path ]; then
  # Add compiler warnings/messages if there were any
  if [ ${#compile_msg} -ne 0 ]; then
    echo '### COMPILER WARNINGS ###' > $eoutput_path
    echo $compile_msg >> $eoutput_path
    # Run executable, send output to top of eOutput
    echo '### START OF PROGRAM OUTPUT ###' >> $eoutput_path
    $executable_src_path >> $eoutput_path
  else
    # Run executable, send output to top of eOutput
    echo '### START OF PROGRAM OUTPUT ###' > $eoutput_path
    $executable_src_path >> $eoutput_path
  fi
else
  echo '### START OF PROGRAM OUTPUT ###' > $eoutput_path
  echo "error: program failed to compile" >> $eoutput_path
fi
echo '### END OF PROGRAM OUTPUT ###' >> $eoutput_path

# Next, generate assembly source and append to eOuptut
ptc -S -L $pt_lib_path $base_src_path > /dev/null
assembly_src_path=$(realpath $prog_filename.s)
echo '### START OF ASSEMBLY SOURCE ###' >> $eoutput_path
# Check to see if compilation was successful
if [ -f $assembly_src_path ]; then
  cat $assembly_src_path >> $eoutput_path
else
  echo "error: program failed to compile" >> $eoutput_path
fi
echo '### END OF ASSEMBLY SOURCE ###' >> $eoutput_path

# Finally, append ssltrace
echo '### START OF SSLTRACE ###' >> $eoutput_path
ssltrace "ptc -o4 -t4 -L $pt_lib_path $base_src_path" $pt_lib_path/coder.def -t >> $eoutput_path
echo '### END OF SSLTRACE ###' >> $eoutput_path

# Move back out a directory
cd ..

if [ $quiet = "no" ]; then
  read -p "View generated output? (y/[N]) " user_response
  case "$user_response" in
    y|Y ) echo; cat $eoutput_path; echo;;
    * ) echo "  --> Won't show output"; echo;;
  esac
fi

# See if user wants to save the eOutput, if not supplied in args
if [ -z ${save_output_in_dir+x} ]; then
  save_output_in_dir="yes"
  read -p "Save expected output + executable? ([Y]/n) " user_response
  case "$user_response" in
    n|N ) echo "  --> Won't save expected output"; echo ""; save_output_in_dir="no";;
    * ) echo "  --> Will save expected output"; echo "";;
  esac
fi
if [ $save_output_in_dir = "yes" ]; then
  cp $eoutput_path "$saved_out_dir/"
  # Only copy executable if it exists
  if [ -f $executable_src_path ]; then
    cp $executable_src_path "$saved_out_dir/"
  fi
fi

# See if user wants to compare generated output to eOutput, if not supplied in args
output_diff_path=$(realpath "$out_dir/$base_src_path.eOutputDiff")
if [ -z ${compare_output+x} ]; then
  # Don't allow output comparison if no existing eOutput or we just made it
  if [ ! -f "$saved_out_dir/$base_src_path.eOutput" ] || [ $save_output_in_dir = "yes" ]; then
    compare_output="no"
  else
    read -p "Compare output to existing $base_src_path.eOutput? ([Y]/n) " user_response
    case "$user_response" in
      n|N ) echo "  --> Won't compare to expected output"; echo ""; compare_output="no";;
      * ) echo "  --> Comparing expected output:"; echo ""; compare_output="yes";;
    esac
  fi
fi

if [ $compare_output = "yes" ]; then
  diff -b "$saved_out_dir/$base_src_path.eOutput" $eoutput_path > $output_diff_path
	echo $src_path
  # If output diff has non-zero size, must be a diff
  if [ -s $output_diff_path ]; then
    echo "TEST FAILED - difference between expected and actual"
    echo "See $output_diff_path for diff"
    read -p "View diff now? ([Y]/n) " user_response
    case "$user_response" in
      n|N ) echo "  --> Won't show diff"; echo "";;
      * ) cat $output_diff_path;;
    esac
  else
    echo "TEST PASSED - no diff"
  fi
fi
