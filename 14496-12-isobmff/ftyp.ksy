meta:
  id: ftyp
  endian: be
  imports:
    - ../fourcc

doc: File Type Box

doc-ref: ISO/IEC 14496-12:2015, section 4.3

seq:
  - id: major_brand
    type: u4
    enum: fourcc::brand
    doc: is a brand identifier

  - id: minor_version
    type: u4
    doc: is an informative integer for the minor version of the major brand

  - id: compatible_brands
    type: u4
    enum: fourcc::brand
    repeat: eos
    doc: is a list, to the end of the box, of brands
