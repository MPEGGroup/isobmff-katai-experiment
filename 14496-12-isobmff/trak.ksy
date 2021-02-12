meta:
  id: trak
  endian: be
  imports:
    - ../fourcc
    - meta
    - mdia
    - tkhd
    - tref
    - ttyp
    - default

doc: Track Box

doc-ref: ISO/IEC 14496-12:2015, section 8.3.1

seq:
  - id: boxes
    type: box
    repeat: eos

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
            'fourcc::box_type::meta': meta(version)
            'fourcc::box_type::mdia': mdia
            'fourcc::box_type::tkhd': tkhd(version, flags.to_s)
            'fourcc::box_type::tref': tref
            'fourcc::box_type::ttyp': ttyp
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == fourcc::box_type::meta or
                type == fourcc::box_type::tkhd)
