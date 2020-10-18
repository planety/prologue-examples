# Package

version       = "0.4.0"
author        = "Innokentiy Sokolov, Zeshen Xing"
description   = "Examples for Prologue web framework."
license       = "Apache-2.0"
srcDir        = "src"


# Dependencies
requires "prologue >= 0.4.0"
requires "nwt >= 0.1.7"

task texamples, "Test examples":
  exec "nim c -d:release .tests/compile_all.nim"
