#!/usr/bin/env bash

ksc -t python ../14496-12-isobmff/isobmff.ksy

# Need to insert some missing import by ksc
# TODO: Check how to solve it in ksc, maybe open ticket
sed -i '1s/^/from fourcc import Fourcc/' isobmff.py
sed -i '1s/^/from fourcc import Fourcc/' moov.py
