#!/usr/bin/env bash

../scripts/compile_python.sh

for isobmff_file in $(find ./vectors -type f -name "*.mp4")
do 
	python3 dump.py "$isobmff_file"
done
