import ../../prelude
import ../../../values

const # Not Alpha Colors
  CARET* = uint32 0x88FFFFFF
  BLACK* = uint32 0xFF000000
  WHITE* = high uint32
let hueSix* = # Hue Six Breakpoints
  [0xFF0000FF'u32, 0xFF00FFFF'u32, 
   0xFF00FF00'u32, 0xFFFFFF00'u32,
   0xFFFF0000'u32, 0xFFFF00FF'u32]

# ------------------
# GUI Color Utilites
# ------------------

proc luminance(color: RGBColor): float32 =
  # Calculate Luminance, thanks gtkhsv.c
  color.r * 0.30 + color.g * 0.59 + color.b * 0.11

proc contrast*(a, b: RGBColor): RGBColor =
  let
    l0 = a.luminance > 0.5
    l1 = b.luminance > 0.5
  result = a
  # Invert Color
  if l0 == l1:
    result.r = 1.0 - a.r
    result.g = 1.0 - a.g
    result.b = 1.0 - a.b

# ---------------
# GUI Color Slave
# ---------------

widget GUIColor0Base:
  attributes: @public:
    slave: bool
    hsv: ptr HSVColor

# Export Relevant Modules
export prelude, values, GUIColor0Base
