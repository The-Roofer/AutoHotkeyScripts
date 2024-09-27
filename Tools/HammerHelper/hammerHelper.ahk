#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Update with your specific Hammer window title
HammerWindowTitle := "Hammer" ; Change this to the exact title of the Hammer window if necessary

; Initialize accumulated angles
accumulatedX := 0
accumulatedY := 0
accumulatedZ := 0

; Create a larger, draggable GUI window
Gui, +Resize +MinSize0x450 ; Allow resizing and set minimum size
Gui, Add, Edit, vRotationValue w100 h30, 2 ; Add an edit box for rotation value with default value of 2
Gui, Add, Text, vCurrentValueText w200 h30, Current Rotation: 2 ; Display current rotation value

; Define button width and height
buttonWidth := 75
buttonHeight := 30

; Starting position for buttons
xPos := 10 ; Starting x position for buttons
yPos := 70 ; Starting y position for buttons

; Create buttons in two rows
Gui, Add, Button, gIncrement w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Increment
xPos += buttonWidth + 10 ; Move x position for next button
Gui, Add, Button, gDecrement w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Decrement

yPos += buttonHeight + 10 ; Move to the next row
xPos := 10 ; Reset x position for new row

Gui, Add, Button, gReset w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Reset
xPos += buttonWidth + 10 ; Move x position for next button
Gui, Add, Button, gToggleSign w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Toggle Sign

yPos += buttonHeight + 10 ; Move to the next row
xPos := 10 ; Reset x position for new row

Gui, Add, Button, gRotateX w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Rotate X
xPos += buttonWidth + 10 ; Move x position for next button
Gui, Add, Button, gRotateY w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Rotate Y

yPos += buttonHeight + 10 ; Move to the next row
xPos := 10 ; Reset x position for new row

Gui, Add, Button, gRotateZ w%buttonWidth% h%buttonHeight% x%xPos% y%yPos%, Rotate Z

; Add a slider for sleep duration
Gui, Add, Text, , Sleep Duration (ms): ; Label for the slider
Gui, Add, Slider, vSleepDurationRange Range1-2000 gUpdateSleep h20, 100 ; Slider from 1 to 2000ms with default value of 100
Gui, Add, Text, vSleepValueText w100 h30, 100 ; Display current sleep value

; Add labels to display accumulated angles
Gui, Add, Text, , Accumulated Angles: ; Label for accumulated angles
Gui, Add, Text, vAccumulatedXText w200 h30, X: 0 ; Display accumulated X angle
Gui, Add, Text, vAccumulatedYText w200 h30, Y: 0 ; Display accumulated Y angle
Gui, Add, Text, vAccumulatedZText w200 h30, Z: 0 ; Display accumulated Z angle

; Add Reset button for accumulated angles
Gui, Add, Button, gResetAccumulated w%buttonWidth% h%buttonHeight%, Reset Accumulated ; Add button for Reset Accumulated

Gui, Show, w200 h500, Rotation Tool ; Set the initial window size to 600x400 and show it with the title "Rotation Tool"
Gui +LastFound
MyGuiID := WinExist() ; Store the ID of the GUI window
GuiControl, Focus, RotationValue ; Set focus to the input box
return

; Update sleep value display when slider is adjusted
UpdateSleep:
    GuiControlGet, SleepDurationRange ; Get the current value of the sleep duration slider
    GuiControl,, SleepValueText, %SleepDurationRange% ; Update the displayed sleep value
return

; Increment the rotation value
Increment:
    GuiControlGet, RotationValue
    RotationValue++ ; Increment by 1
    GuiControl,, RotationValue, %RotationValue% ; Update the input box
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue% ; Update displayed current rotation value
return

; Decrement the rotation value
Decrement:
    GuiControlGet, RotationValue
    RotationValue-- ; Decrement by 1
    GuiControl,, RotationValue, %RotationValue% ; Update the input box
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue% ; Update displayed current rotation value
return

; Reset the rotation value to default (2)
Reset:
    RotationValue := 2
    GuiControl,, RotationValue, %RotationValue% ; Reset input box
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue% ; Update displayed current rotation value
return

; Toggle the sign of the rotation value
ToggleSign:
    GuiControlGet, RotationValue
    RotationValue := -RotationValue ; Change the sign
    GuiControl,, RotationValue, %RotationValue% ; Update the input box
    GuiControl,, CurrentValueText, Current Rotation: %RotationValue% ; Update displayed current rotation value
return

; Define what happens when the buttons are clicked
RotateX:
    RotateAction(1) ; Call the rotation action for X with 1 Tab
return

RotateY:
    RotateAction(2) ; Call the rotation action for Y with 2 Tabs
return

RotateZ:
    RotateAction(3) ; Call the rotation action for Z with 3 Tabs
return

; Function to handle the rotation action
RotateAction(tabCount) {
    global HammerWindowTitle, MyGuiID, RotationValue, SleepDurationRange ; Use global variables
    global accumulatedX, accumulatedY, accumulatedZ ; Include accumulated angles

    Gui, Submit, NoHide ; Get the value from the input box without closing the GUI

    ; Activate the Hammer window
    IfWinExist, %HammerWindowTitle%
    {
        WinActivate ; Activate the Hammer window
        WinWaitActive, %HammerWindowTitle%, , 2 ; Wait for the window to become active for up to 2 seconds

        Sleep SleepDurationRange ; Wait for the specified sleep duration
        
        ; Send the key sequence
        Send ^m        ; Press Ctrl + M
        Sleep SleepDurationRange ; Wait for the specified sleep duration
        
        ; Send Tab key multiple times based on the tabCount
        Loop, %tabCount%
        {
            SendInput {Tab} ; Press Tab
            Sleep SleepDurationRange ; Wait for the specified sleep duration
        }

        SendInput %RotationValue% ; Type in the rotation value
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

        ; Update the accumulated angles display
        GuiControl,, AccumulatedXText, X: %accumulatedX% ; Update accumulated X angle
        GuiControl,, AccumulatedYText, Y: %accumulatedY% ; Update accumulated Y angle
        GuiControl,, AccumulatedZText, Z: %accumulatedZ% ; Update accumulated Z angle

        ; Switch back to the GUI window
        WinActivate, ahk_id %MyGuiID%
    }
    else
    {
        MsgBox, Hammer window not found! Please make sure it's open.
    }
}

; Reset accumulated angles to zero
ResetAccumulated:
    accumulatedX := 0
    accumulatedY := 0
    accumulatedZ := 0
    GuiControl,, AccumulatedXText, X: 0 ; Reset accumulated X angle
    GuiControl,, AccumulatedYText, Y: 0 ; Reset accumulated Y angle
    GuiControl,, AccumulatedZText, Z: 0 ; Reset accumulated Z angle
return

; Close the GUI when the window is closed
GuiClose:
ExitApp
