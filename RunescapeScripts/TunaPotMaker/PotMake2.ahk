
coordmode,mouse,screen
#singleinstance force

gui,add,text,w100 h25 section,Programmed by Adam Muehlbauer
Gui, Add, Picture, w300 h-1, ingredients.bmp
gui,add,text,w100 h25 section,Specify Limiting Factor
Gui, Add, Edit,w100 h25 ys vLimitingFactor
gui,add,text,w100 h25 xs section ,Mouse over Bank
gui,add,text,w100 h25  ys  vCurrentPosition gGetPosition
gui,add,text,w100 h25 xs section,Currently Selected Coordinates:
gui,add,text,w100 h25 ys vCurrentCoords
Gui, Add, Button, x70 default section,Start Cooking  ;
Gui, Add, Button, gButtonExit ys,Cancel
Gui, Show , X157 Y272 W300, Tuna Potato Maker


SetTimer,getPosition,100

#0::
updateBankCoords()
return

updateBankCoords()
{
	global BankX
	global BankY
	
	coordmode,mouse,screen
	mousegetpos,BankX,BankY
	GuiControl,, CurrentCoords, %BankX%`,%BankY%
	return 
}

getPosition:
coordmode,mouse,screen
mousegetpos,Px,Py
GuiControl,, CurrentPosition, %PX%`,%PY%
return 

ButtonStartCooking:
Gui, Submit

Gui,2:+AlwaysOnTop
gui,2:Margin,5,5
Gui,2:Add,Text,X10 W40 Y5 center vTime 
Gui,2:Add,Text,Right X55 right y5 ,Mins Runtime
Gui,2:Add,Text,X10 W40 Y20 center vGpMade
Gui,2:Add,Text,Right X60 y20 ,GP Made


Gui,2:Add,Button,X50 gButtonExit,Cancel
Gui,2:Show,X700 Y2 W150 H65
GoSub,runroutine
return

ButtonExit:
ExitApp
return


RunRoutine:
WinActivate,RuneScape - MMORPG - The No.1 Free Online Multiplayer Game - Google Chrome

Randomize()
SetFormat,float,0.2
sleep,2000
;global CyclesPossible:=limitingfactor/14
;global Cycles:=0

while (limitingfactor>14)
{

	cycleStartTime:=A_NOW
	
	mousemove,240,209,%randomSpeed%  ;mouseover tuna in bank
	detectFault("tuna")
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,238,290,,%randomSpeed%    ;withdrawl 14 tuna
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,632,127,,%randomSpeed%        ;mousemove here to close bank
	Sleep,%RandomTime%
	Randomize()
	
	mousemove,75,188,%randomSpeed%          ;checks for usebowl
	detectFault("bowl")
	Sleep,%RandomTime%
	Randomize()
	
	
	mouseclick,,78,149,,%randomSpeed%   ;use bowl with tuna
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,615,474,,%randomspeed%    ;chop
	Sleep,RandomTime+19000
	Randomize()
	
	mousemove,BankX,BankY,%randomSpeed%  ;mousemove to defined coords and check for bank
	detectFault("bank")
	Sleep,%RandomTime%
	Randomize()
	

	mousemove,286,207,%randomspeed%        ;mouseover corn, right click if there
	detectFault("corn")
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,269,287,,%randomspeed%       ;wd 14 corn
	Sleep,%RandomTime%
	Randomize()
	
	
	mouseclick,,631,126,,%randomspeed%       ;close bank
	Sleep,%RandomTime%
	Randomize()
	
	mousemove,76,182,%randomSpeed%           ;mouseover cooked sweetcorn
	detectFault("invCorn")
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,73,225,,%randomspeed%      ;use
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,76,151,,%randomspeed%    ;use corn with chopped tuna
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,619,479,,%randomspeed%  ;start mix
	Sleep,RandomTime+19000
	Randomize()
	
	mousemove,BankX,BankY,%randomspeed%       ;mouseover defined bank
	detectfault("bank")
	Sleep,%RandomTime%
	Randomize()
	
	mousemove,331,207,%randomspeed%     ;mouseover potato, rc if there
	detectfault("potato")
	Sleep,%RandomTime%
	Randomize()

	mouseclick,,329,281,,%randomspeed%    ;wd 14 potatos
	Sleep,%RandomTime%
	Randomize()
	
	
	mouseclick,,634,125,,%randomspeed%    ;close bank
	Sleep,%RandomTime%
	Randomize()
	
	mousemove,79,187,%randomspeed%  ;right click potato
	detectfault("invPotato")
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,68,231,,%randomspeed%       ;click use
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,77,152,,%randomspeed%      ;lc use with tunacorn
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,614,477,,%randomspeed%    ;start mix
	Sleep,RandomTime+19000
	Randomize()
	
	mousemove,BankX,BankY,%randomspeed%      ;mouseoverbank and check
	detectfault("bank")
	Sleep,%RandomTime%
	Randomize()

	
	mousemove,683,216,%randomspeed%        ;mouseover inv space, expect tuna potato
	detectfault("tunaPotato")
	Sleep,%RandomTime%
	Randomize()
	
	mouseclick,,672,324,,%randomspeed%   ;deposit all tuna potato
	Sleep,%RandomTime%
	Randomize()
	
	cycles++
	cycleEndTime:=A_NOW
	
	
	EnvSub,cycleEndtime,cyclestarttime,seconds
	accumulatedseconds+=cycleEndTime
	accumulatedmins:=(accumulatedseconds/60)
	gpestimate:=((cycles*14)*1900)/1000
	
	SetFormat,float,0.2
	
	GuiControl,2:, time, %accumulatedmins%
	GuiControl,2:, gpmade, %GPestimate%k
	
}




detectFault(item)
{
	mousegetPos,MouseX,MouseY
	
	TlX:=MouseX+10
	TlY:=MouseY+10
	BrX:=MouseX+250
	BrY:=Mousey+100
	
	if item=tuna
	{
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,wdTuna.bmp
		
		if !fx
		{
			runResize()
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,wdTuna.bmp
			
			if !fx
			{
				msgbox, Something went wrong`,withdrawl tuna not found.
				exitapp
			}
			else
			{
				mouseclick,right
			}
		}
		else
		{
			mouseclick,right
		}
	}
	
	if item=corn
	{
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,wdCorn.bmp
		
		if !fx
		{
			runResize()
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,wdCorn.bmp
			
			if !fx
			{
				msgbox, Something went wrong`,withdrawl Corn not found.
				exitapp
			}
			else
			{
				mouseclick,right
			}
		}
		else
		{
			mouseclick,right
		}
	}
	
	if item=potato
	{
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,wdPotato.bmp
		
		if !fx
		{
			runResize()
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,wdPotato.bmp
			
			if !fx
			{
				msgbox, Something went wrong`,withdrawl Potato not found.
				exitapp
			}
			else
			{
				mouseclick,right
			}
		}
		else
		{
			mouseclick,right
		}
	}
	if item=bank
	{
	
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,useBank.bmp
		
		if !fx
		{
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,bankBanker.bmp
			
			if !fx
			{
				runResize()
				imagesearch,fx,fy,TlX,TlY,BrX,BrY,useBank.bmp
				if !fx
				{
					imagesearch,fx,fy,TlX,TlY,BrX,BrY,bankBanker.bmp
			
					if !fx
					{
						msgbox, Something went wrong`, Bank not found.
						exitapp
					}
					else
					{
						mouseclick,left
					}
				}
				else
				{
					mouseclick,left
				}
			}
			else
			{
				mouseclick,left
			}
		}
		else
		{
			mouseclick,left
		}
	}

	if item=bowl
	{
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,useBowl.bmp
		
		if !fx
		{
			runResize()
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,useBowl.bmp
			
			if !fx
			{
				msgbox, Something went wrong`,Bowl not found.
				exitapp
			}
			else
			{
				mouseclick,right
			}
		}
		else
		{
			mouseclick,left
		}
	}
	
	if item=tunaPotato
	{
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,depositTunaPot.bmp
		
		if !fx
		{
			runResize()
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,depositTunaPot.bmp
			
			if !fx
			{
				msgbox, Something went wrong`,Product not found.
				exitapp
			}
			else
			{
				mouseclick,right
			}
		}
		else
		{
			mouseclick,right
		}
	}
	if item=invCorn
	{
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,invCorn.bmp
		
		if !fx
		{
			runResize()
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,invCorn.bmp
			
			if !fx
			{
				msgbox, Something went wrong`,Corn not found.
				exitapp
			}
			else
			{
				mouseclick,right
			}
		}
		else
		{
			mouseclick,right
		}
	}
	if item=invPotato
	{
		imagesearch,fx,fy,TlX,TlY,BrX,BrY,invPotato.bmp
		
		if !fx
		{
			runResize()
			imagesearch,fx,fy,TlX,TlY,BrX,BrY,invPotato.bmp
			
			if !fx
			{
				msgbox, Something went wrong`,Potato not found.
				exitapp
			}
			else
			{
				mouseclick,right
			}
		}
		else
		{
			mouseclick,right
		}
	}
}







runResize()
{
	WinRestore,RuneScape - MMORPG - The No.1 Free Online Multiplayer Game - Google Chrome
	sleep,5000
	WinMaximize,RuneScape - MMORPG - The No.1 Free Online Multiplayer Game - Google Chrome
	sleep,5000
}




Randomize()
{
	global RandomTime
	Random,RandomTime,900,1800

	global RandomSpeed
	Random,RandomSpeed,10,40
}

#p::Pause



