#Persistent
CoordMode Pixel, Screen
CoordMode Mouse, Screen
return

^1::
SetTimer, WatchCursor, 100
Hotkey, ESC, Quit, On
Hotkey, Enter, Done, On
return

Done:
ClipBoard := Color
Quit:
SetTimer, WatchCursor, Off
Hotkey, ESC, Off
Hotkey, Enter, Off
ToolTip
return

WatchCursor:
MouseGetPos X, Y
PixelGetColor Color, %X%, %Y%, RGB
ToolTip, %Color%
