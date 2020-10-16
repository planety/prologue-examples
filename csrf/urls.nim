import prologue

import ./views


let urlPatterns* = @[
  # strip latter
  pattern("/", hello)
]
