#SingleInstance, force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

HammerWindowTitle := "Hammer"

accumulatedX := 0
accumulatedY := 0
accumulatedZ := 0

Gui, +Resize +MinSize0x450
Gui, Add, Edit, vRotationValue w100 h30, 2
Gui, Add, Text, vCurrentValueText w200 h30, Current Rotation: 2 

buttonWidth := 75
buttonHeight := 30
xPos := 10
yPos := 70

Gui, Add, Button, gIncrement w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Increment
xPos += buttonWidth + 10 ; Move x position for next button
Gui, Add, Button, gDecrement w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Decrement

yPos += buttonHeight + 10 ; Move to the next row
xPos := 10 ; Reset x position for new row

Gui, Add, Button, gReset w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Reset
xPos += buttonWidth + 10 ; Move x position for next button
Gui, Add, Button, gToggleSign w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Toggle Sign

yPos += buttonHeight + 10 
xPos := 10 

Gui, Add, Button, gRotateX w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Rotate X
xPos += buttonWidth + 10 ; Move x position for next button
Gui, Add, Button, gRotateY w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Rotate Y

yPos += buttonHeight + 10 ; Move to the next row
xPos := 10 ; Reset x position for new row

Gui, Add, Button, gRotateZ w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Rotate Z

Gui, Add, Text, , Sleep Duration (ms): 
Gui, Add, Slider, vSleepDurationRange Range1-2000 gUpdateSleep h20, 100 
Gui, Add, Text, vSleepValueText w100 h30, 100 ; Display current sleep value

Gui, Add, Text, , Accumulated Angles: ; Label for accumulated angles
Gui, Add, Text, vAccumulatedXText w200 h30, X: 0 ; Display accumulated X angle
Gui, Add, Text, vAccumulatedYText w200 h30, Y: 0 ; Display accumulated Y angle
Gui, Add, Text, vAccumulatedZText w200 h30, Z: 0 ; Display accumulated Z angle

Gui, Add, Button, gResetAccumulated w%buttonWidth% h%buttonHeight%, Reset Accumulated ; Add button for Reset Accumulated

Gui, Show, w200 h500, Rotation Tool 
Gui +LastFound
MyGuiID := WinExist()
GuiControl, Focus, RotationValue
return

UpdateSleep:
    GuiControlGet, SleepDurationRange ; Get the current value of the sleep duration slider
    GuiControl,, SleepValueText, %SleepDurationRange% ; Update the displayed sleep value
return

Increment:
    GuiControlGet, RotationValue
    RotationValue++ ; Increment by 1
    GuiControl,, RotationValue, %RotationValue%
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue% 
return

Decrement:
    GuiControlGet, RotationValue
    RotationValue-- ; Decrement by 1
    GuiControl,, RotationValue, %RotationValue% 
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue% 
return

Reset:
    RotationValue := 2
    GuiControl,, RotationValue, %RotationValue%
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue% 
return

ToggleSign:
    GuiControlGet, RotationValue
    RotationValue := -RotationValue
    GuiControl,, RotationValue, %RotationValue%
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue%
return

RotateX:
    RotateAction(1)
return

RotateY:
    RotateAction(2)
return

RotateZ:
    RotateAction(3)
return

RotateAction(tabCount) {
    global HammerWindowTitle, MyGuiID, RotationValue, SleepDurationRange
    global accumulatedX, accumulatedY, accumulatedZ

    Gui, Submit, NoHide

    IfWinExist, %HammerWindowTitle%
    {
        WinActivate
        WinWaitActive, %HammerWindowTitle%, , 2 

        Sleep SleepDurationRange
        
        Send ^m     
        Sleep SleepDurationRange
        
        Loop, %tabCount%
        {
            SendInput {Tab}
            Sleep SleepDurationRange
        }

        SendInput %RotationValue%
        SendInput {Enter}   ; Press Enter
        Sleep 100
        
        ; Update accumulated angles
        if (tabCount == 1) {
            accumulatedX += RotationValue
        } else if (tabCount == 2) {
            accumulatedY += RotationValue
        } else if (tabCount == 3) {
            accumulatedZ += RotationValue
        }

        GuiControl,, AccumulatedXText, X: %accumulatedX%
        GuiControl,, AccumulatedYText, Y: %accumulatedY%
        GuiControl,, AccumulatedZText, Z: %accumulatedZ%
        WinActivate, ahk_id %MyGuiID%
    }
    else
    {
        MsgBox, Hammer window not found! Please make sure it's open.
    }
}

ResetAccumulated:
    accumulatedX := 0
    accumulatedY := 0
    accumulatedZ := 0
    GuiControl,, AccumulatedXText, X: 0 ; Reset accumulated X angle
    GuiControl,, AccumulatedYText, Y: 0 ; Reset accumulated Y angle
    GuiControl,, AccumulatedZText, Z: 0 ; Reset accumulated Z angle
return

GuiClose:
ExitApp
