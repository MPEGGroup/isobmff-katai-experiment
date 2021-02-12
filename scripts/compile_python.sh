#!/usr/bin/env bash

ksc -t python --python-package isobmff --outdir isobmff ../14496-12-isobmff/isobmff.ksy

# Need to insert some missing import by ksc
# TODO: Check how to solve it in ksc, maybe open ticket
sed -i '1s/^/from isobmff.fourcc import Fourcc/' isobmff/isobmff.py
sed -i '1s/^/from isobmff.fourcc import Fourcc/' isobmff/moov.py
