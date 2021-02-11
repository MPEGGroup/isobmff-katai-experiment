meta:
  id: isobmff
  title: ISO Base Media File Format (ISOBMFF)
  endian: be
  imports:
    - ../fourcc
    - ftyp
    - meta
    - moov
    - default

doc: |
  This part of ISO/IEC 14496 specifies the ISO base media file format, which is
  a general format forming the basis for a number of other more specific file
  formats. This format contains the timing, structure, and media information for
  timed sequences of media data, such as audio-visual presentations.This part
  of ISO/IEC 14496 is applicable to MPEG-4, but its technical content is
  identical to that of ISO/IEC 15444-12, which is applicable to JPEG 2000.

doc-ref: ISO/IEC 14496-12:2015

seq:
  - id: boxes
    type: box
    repeat: until
    repeat-until: _io.eof

types:
  box:
    seq:
      - id: size
        type: u4

      - id: type
        type: u4
        enum: fourcc::box_type
      
      - id: version
        type: u1
        if: is_full_box

      - id: flags
        type: b24
        if: is_full_box

      - id: data
        size: size - header_size
        type:
          switch-on: type
          cases:
            'fourcc::box_type::ftyp': ftyp
            'fourcc::box_type::meta': meta(version)
            'fourcc::box_type::moov': moov
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == fourcc::box_type::meta)

