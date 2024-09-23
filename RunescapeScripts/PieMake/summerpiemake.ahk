
coordmode,mouse,screen
#singleinstance force

Gui, Add, Picture, w300 h-1, ingredients.bmp
gui,add,text,w100 h25 section,Specify Limiting Factor
Gui, Add, Edit,w100 h25 ys vLimitingFactor
gui,add,text,w100 h25 xs section ,Mouse over Bank
gui,add,text,w100 h25  ys  vCurrentPosition gGetPosition
gui,add,text,w100 h25 xs section,Currently Selected Coordinates:
gui,add,text,w100 h25 ys vCurrentCoords
Gui, Add, Button, x70 default section,StartThisShit  ;
Gui, Add, Button, gButtonExit ys,Cancel
Gui, Show , X157 Y272 W300, Summer Pie Maker


SetTimer,getPosition,100

#0::
updateCoords()
return

updateCoords()
{
	global mousex
	global mousey
	coordmode,mouse,screen
	mousegetpos,mousex,mousey
	GuiControl,, CurrentCoords, %MouseX%`,%MouseY%
	return 
}

getPosition:
coordmode,mouse,screen
mousegetpos,Px,Py
GuiControl,, CurrentPosition, %PX%`,%PY%
return  ;p

ButtonStartThisShit:
Gui, Submit

Gui,2:+AlwaysOnTop
Gui,2:Add,Text,Section,Estimated Time Remaining:

Gui,2:Add,Button,X50 gButtonExit,Cancel
Gui,2:Show,X500 Y2 W150 H50
GoSub,runroutine
return

ButtonExit:
ExitApp
return


RunRoutine:
sleep,2000
CyclesPossible:=limitingfactor/14
Cycles:=0

while (limitingfactor>14)
{

	cycleStartTime:=A_NOW
	RandomizeSpeed()
	Randomizetime()
	Sleep,%RandomTime%

	
	MouseClick,right,421,209,,%RandomSpeed%		 				 ;right click pie shell
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	MouseClick,left,411,287,,%RandomSpeed%       		 			 ;left click withdrawl 14
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()

	
	MouseClick,right, 465,209,,%RandomSpeed%       				    ;right click strawberry
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	RandomizeSpeed()

	
	MouseClick,left,449,287,,%RandomSpeed%     	   				    ;left click withdrawl 14
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,636,122,,%RandomSpeed%                                 ;left click close bank
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,77,149,,%RandomSpeed%                                    ;left click pie shell(inv)
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,76,187,,%RandomSpeed%                                ;left click strawberry to use w pie shell
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,624,477,,%RandomSpeed%                                    ;left click mix
	Sleep,19000
	
	
	Mousemove,%mousex%,%mousey%,%randomspeed% ;move cursor over bank
	detectFault(MouseX,MouseY)
	Sleep,RandomTime+1500
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,right,510,209,,%RandomSpeed%                                  ;right click watermellon in bank
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,505,290,,%RandomSpeed%                                      ;left click w/ 14 watermelon
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,636,124,,%RandomSpeed%                                       ;close bank
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,77,152,,%RandomSpeed%                                          ;left click summer pie part 1
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,76,186,,%RandomSpeed%                                             ;left click watermelon
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,622,471,,%RandomSpeed%                                            ;left click again to start mix
	Sleep,19000
	
	Mousemove,%mousex%,%mousey%,%randomspeed% ;moves mouse over bank
	detectFault(MouseX,MouseY)
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,right,555,210,,%RandomSpeed%                                      ;right click cooking apple(bank)
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,547,286,,%RandomSpeed%                                        ;left click withdrawl 14
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,634,124,,%RandomSpeed%                                         ;close bank
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,76,149,,%RandomSpeed%                                        ;left click pie pt 2 in inventory
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,77,189,,%RandomSpeed%                                              ;left click cooking apple
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,621,474,,%RandomSpeed%                                          ;start mix click
	Sleep,19000
	
	Mousemove,%mousex%,%mousey%,%randomspeed% ;move cursor over bank
	detectFault(MouseX,MouseY)
	Sleep,RandomTimE
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,right,683,211,,%RandomSpeed%                                       ;right click raw summer pie in backpack
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	
	MouseClick,left,668,319,,%RandomSpeed%                                           ;click deposit all
	Sleep,%RandomTime%
	Randomizetime()
	RandomizeSpeed()
	
	sleep, 1500
	cycles++
	
	cycleEndTime:=A_NOW
	temptime:=cycleEndTime
	
	EnvSub,temptime,cyclestarttime,seconds
	
	accumulatedTime+=temptime 
	
	averagecycleTime:=accumulatedTime/cycles
	EstimatedDuration:=AverageCycleTime*CyclesPossible
	limitingfactor-=14
	
	SetFormat,float,10.2
	estimatedTimeRemaining:=(estimatedDuration-(averageCycleTime*cycles)/60)
	GuiControl,2:,TimeRemaining,%EstimatedTimeRemaining%
	
}

detectFault(MouseX,MouseY)
{
	TryResize:=0
	coordmode,pixel,screen
	
	TlX:=MouseX+30
	TlY:=MouseY+30
	BrX:=MouseX+146
	BrY:=Mousey+70
	
	imagesearch,fx,fy,TlX,TlY,BrX,BrY,usebank.bmp
	if !fx
	{
	imagesearch,fx,fy,TlX,TlY,BrX,BrY,BankBanker.bmp
	}
	if !fx
	{
			WinRestore,RuneScape - MMORPG - The No.1 Free Online Multiplayer Game - Google Chrome
			sleep,5000
			WinMaximize,RuneScape - MMORPG - The No.1 Free Online Multiplayer Game - Google Chrome
			sleep,5000
			
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,usebank.bmp
			if !fx
			{
				WinRestore,RuneScape - MMORPG - The No.1 Free Online Multiplayer Game - Google Chrome
				sleep,5000
				WinMaximize,RuneScape - MMORPG - The No.1 Free Online Multiplayer Game - Google Chrome
				sleep,5000
				
				imagesearch,fx,fy,TlX,TlY,BrX,BrY,BankBanker.bmp
			}
			if !fx
			{
				msgbox, Position fault occured, Usebank not found. Run will terminate.
				exitapp
			}
			else
			{
				mouseclick
				return
			}
	
	}
	
		else
		{
			mouseclick
		}
}
Randomizetime()
{
	global RandomTime
	Random,RandomTime,900,1800
}


RandomizeSpeed()
{
	global RandomSpeed
	Random,RandomSpeed,10,40
}



