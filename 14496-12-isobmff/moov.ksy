meta:
  id: moov
  endian: be
  imports:
    - ../fourcc
    - meta
    - mvhd
    - mvex
    - trak
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
            'fourcc::box_type::mvhd': mvhd(version)
            'fourcc::box_type::mvex': mvex
            'fourcc::box_type::trak': trak
            _: default

    instances:
      header_size:
        value: 8 + is_full_box.to_i * 4

      is_full_box:
        value: (type == fourcc::box_type::meta or
                type == fourcc::box_type::mvhd)
