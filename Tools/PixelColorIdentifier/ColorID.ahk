;
;
;
;   a program that returns the hex color of the pixel under the mouse pointer
;
;    output var is returned as BGR
;
;

#singleinstance force

^r::  ; Control+r
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position is %color%.
clipboard = %color%
return



