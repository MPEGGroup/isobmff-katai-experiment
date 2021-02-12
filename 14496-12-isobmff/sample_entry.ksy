meta:
  id: sample_entry
  endian: be
  imports:
    - ../fourcc
    - ../14496-15-nal/avc1
    - default

seq:
  - id: size
    type: u4
  - id: type
    type: u4
    enum: fourcc::format
  - id: reserved
    contents: [0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
  - id: data_reference_index
    type: u2
  - id: data
    size: size - 16
    type:
      switch-on: type
      cases:
        'fourcc::format::avc1': avc1
        _: default
