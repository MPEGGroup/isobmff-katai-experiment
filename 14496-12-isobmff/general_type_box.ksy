meta:
  id: general_type_box
  endian: be
  imports:
    - ../fourcc

doc: General Type Box

doc-ref: ISO/IEC 14496-12:2020, section 4.3

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
