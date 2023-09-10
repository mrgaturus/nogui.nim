from ../builder import widget
# Import Widget and Rendering
import ../gui/[widget, event, render, atlas, signal]
# Import Event and Callback Stuff
from ../gui/timer import pushTimer, stopTimer
# Import Global App State
from ../../nogui import getApp, width, index
# Import Atlas Icon ID
from ../data import CTXIconID

# -----------------------
# Standard Color Choosing
# -----------------------

proc opaqueColor*(self: GUIWidget): uint32 =
  let colors = addr getApp().colors
  if not self.any(wHoverGrab):
    0 # No Color
  elif self.test(wHoverGrab):
    colors.clicked
  else: colors.focus

proc optionColor*(self: GUIWidget): uint32 =
  let colors = addr getApp().colors
  if not self.any(wHoverGrab):
    colors.darker
  elif self.test(wHoverGrab):
    colors.clicked
  else: colors.focus

proc itemColor*(self: GUIWidget): uint32 =
  let colors = addr getApp().colors
  if not self.any(wHoverGrab):
    colors.item
  elif self.test(wHoverGrab):
    colors.clicked
  else: colors.focus

# -----------------
# Exporting Prelude
# -----------------

export builder.widget
export widget
export render except 
  newCTXRender,
  begin, 
  viewport, 
  clear, 
  render,
  finish
export atlas except
  newGUIAtlas,
  createTexture,
  checkTexture
# Export Event and Callback Stuff
export event except
  newGUIState,
  translateX11Event,
  utf8state
export signal except newGUIQueue
export pushTimer, stopTimer
# Export Relevant Global State
export getApp, width, index
# Export Constant Icon ID
export CTXIconID
