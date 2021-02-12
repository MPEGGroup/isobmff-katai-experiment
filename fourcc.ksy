meta:
  id: fourcc
  title: 4CCs related to the ISO Base Media File Format
  endian: be

doc: |
  This files collects of the 4cc codes that are defines for box types,
  brands, sample entries, etc.

enums:
  box_type:
    0x66747970: ftyp
    0x66726565: free
    0x6d646174: mdat
    0x6d657461: meta
    0x6D6F6F66: moof
    0x6d6f6f76: moov
    0x6d766578: mvex
    0x6d766864: mvhd
    0x73696478: sidx
    0x73747970: styp
    0x7472616b: trak
    0x75647461: udta
