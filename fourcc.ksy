meta:
  id: fourcc
  title: 4CCs related to the ISO Base Media File Format
  endian: be

doc: |
  This files collects the 4ccs that are defined for box types,
  brands, sample entries, etc.

enums:
  box_type:
    # ISO/IEC 14496-12
    0x66747970: ftyp
    0x66726565: free
    0x6d646174: mdat
    0x6d656864: mehd
    0x6d657461: meta
    0x6D6F6F66: moof
    0x6d6f6f76: moov
    0x6d766578: mvex
    0x6d766864: mvhd
    0x73696478: sidx
    0x73747970: styp
    0x7472616b: trak
    0x74726578: trex
    0x75647461: udta

  brand:
    # ISO/IEC 14496-12
    0x69736F32: iso2
    0x69736F35: iso5
    0x69736F36: iso6
    0x69736F6D: isom
    0x6D703431: mp41

    # ISO/IEC 14496-15
    0x61766331: avc1

    # ISO/IEC 23009-1
    0x64617368: dash

    # ISO/IEC 23090-2
    0x61647469: adti
