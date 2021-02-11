#!/usr/bin/env bash

ksc -I ".." -t python ../14496-12-isobmff/isobmff.ksy

# Need to insert some missing import by ksc
# TODO: Check how to solve in ksc, open ticket
sed -i '1s/^/from fourcc import Fourcc/' isobmff.py

for isobmff_file in $(find ./vectors -type f -name "*.mp4")
do 
	python3 dump.py "$isobmff_file"
done
