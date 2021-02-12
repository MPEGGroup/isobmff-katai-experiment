#!/usr/bin/env bash

echo 'Deleting previously genertated files if any.'
rm isobmff/*.py
echo 'Done.'

echo 'Generating python library.'
ksc -t python --python-package isobmff --outdir isobmff ../14496-12-isobmff/isobmff.ksy
echo 'Done.'

# Need to insert some missing import by ksc
# TODO: Check how to solve it in ksc, maybe open ticket
sed -i '1s/^/from isobmff.fourcc import Fourcc/' isobmff/isobmff.py
sed -i '1s/^/from isobmff.fourcc import Fourcc/' isobmff/moov.py
sed -i '1s/^/from isobmff.fourcc import Fourcc/' isobmff/general_type_box.py
sed -i '1s/^/from isobmff.fourcc import Fourcc/' isobmff/mvex.py
sed -i '1s/^/from isobmff.fourcc import Fourcc/' isobmff/trak.py
