#!/bin/bash
echo "Testing Start - ALL PHASES"

cd Phase1Tests
sh test-phase1.sh

cd ../Phase2Tests
sh test-phase2.sh
