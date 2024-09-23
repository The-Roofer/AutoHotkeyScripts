l::
loop
	{
		MouseClick
		keywait, (stop key), D T0.01 ;Exit out of loop
		if errorlevel = 0
		break
	}
return

LButton::
Loop
{
Sleep 5 ; This is the delay between clicks, in milliseconds.
GetKeyState, LButtonState, LButton, P
if LButtonState = U ; User has physically released the button, so end the loop.
break
MouseClick, Left
}
return
















