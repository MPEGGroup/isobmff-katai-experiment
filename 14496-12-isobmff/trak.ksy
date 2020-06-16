meta:
  id: trak
  endian: be
  imports:
    - mdia
    - tkhd
    - default

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
        enum: box_type
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
            'box_type::mdia': mdia
            'box_type::tkhd': tkhd(version, flags.to_s)
            _: default
    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4
      is_full_box:
        value: type == box_type::tkhd

enums:
  box_type:
    0x65647473: edts
    0x6D646961: mdia
    0x746B6864: tkhd