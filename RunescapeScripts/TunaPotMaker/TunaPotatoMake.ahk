;
;New and improved tuna potato script w/ failsafe and task time estimator
;


#p::Pause
#0::

Gui, Add, Text,, Tuna:
Gui, Add, Text,, Corn:
Gui, Add, Text,, Potatoes:
Gui, Add, Text,, Limiting Factor:
Gui, Add, Text,, Intended Sale Price:
Gui, Add, Edit,w50 vTuna ym,45  ; The ym option starts a new column of controls.
Gui, Add, Edit,w50 vCorn,85
Gui, Add, Edit,w50 vPotato,225
Gui, Add, Edit,w50 vLimitingFactor
Gui, Add, Edit,w50 vSalePrice,1900
Gui, Add, Button, default, OK  ;
Gui, Show,, Enter Price Paid
return  ;
GuiClose:

ButtonOK:
Gui, Submit  ;
MsgBox Values Entered:`nTuna: %Tuna%gp`nCorn: %Corn%gp`nPotatos: %Potato%gp.`nLimiting Factor: %limitingFactor%`n`n MOVE CURSOR

sleep,3000

global tuna
global corn
global potato
global limitingfactor
global cycles:=0
global tpsMade:=0
global saleprice
global formattedTime
global profit

StartTime=A_NOW

coordmode,tooltip,screen
coordmode,mouse,screen

while (limitingfactor>14)
{	
	cycleStartTime:=A_NOW
/*
	MouseClick,right,242,204,,%randomspeed% ;rc tuna
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,236,286,,%randomspeed% ;wd 14
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,629,118,,%randomspeed% ;close bank
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	Mousemove,75,187,%randomspeed% ;mouse over bowl
	detectinvfault()
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,75,149,,%randomspeed% ;lc tuna
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,620,475,,%randomspeed% ;start mix
	Sleep,RandomTime+19000
	RandomizeSpeed()
	Randomizetime()
	
	
	
	Mousemove,644,342,%randomspeed% ;move cursor over bank
	detectFault()
	Sleep,RandomTime+1500
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,right,284,200,,%randomspeed% ;rc corn
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,,247,278,,%randomspeed% ;wd 14
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,,631,117,,%randomspeed% ;close bank
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,right,78,152,,%randomspeed% ;rc chopped tuna
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,,68,201,,%randomspeed% ;click use
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,,74,189,,%randomspeed% ;click corn
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,,620,474,,%randomspeed% ;start mix
	Sleep,RandomTime+19000
	RandomizeSpeed()
	Randomizetime()
	
	
	Mousemove,644,351,%randomspeed% ;moves mouse over bank
	detectFault()
	Sleep,(RandomTime+1500)
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,right,330,201,,%randomspeed% ;rc potato
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	
	MouseClick,,316,281,,%randomspeed% ;withdrawl 14
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,629,117,,%randomspeed% ;close bank
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	Mousemove,75,150,%randomspeed% ;move over rc tuna and corn
	detectinvfault2()
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,70,195,,%randomspeed% ;click use
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,78,185,,%randomspeed% ;click potato
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,615,476,,%randomspeed% ;start mix
	Sleep,RandomTime+19000
	RandomizeSpeed()
	Randomizetime()
	
	Mousemove,650,347,%randomspeed% ;move mouse over bank
	detectFault()
	Sleep,RandomTime+1500
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,right,682,207,,%randomspeed% ;rc potato
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	MouseClick,,670,313,,%randomspeed% ;deposit all
	*/
	Sleep,%RandomTime%
	RandomizeSpeed()
	Randomizetime()
	
	cycleEndTime:=A_NOW
	EnvSub,cycleEndTime,cyclestarttime,seconds
	cycles++
	tpsMade+=14
	limitingfactor-=14
	accumulatedTime+=cycleEndTime 
	formatAccumulatedTime(accumulatedTime)
	
	calcProfit()
	calcSaleTotal()
	calcgph(accumulatedTime)
	
	ToolTip,%formattedTime%`nProfit:%profit%k`nPot Made:%tpsmade%`nGP/H:%gph%k,348,1
	
}

detectFault()
{
	coordmode,pixel,screen
	imagesearch,fx,fy,582,263,826,454,usebank.bmp
	if !fx
	{
		msgbox, Position fault occured, Usebank not found. Run will terminate.
		exitapp
		
	}
		else
		{
			mouseclick
		}
}
detectinvfault()
{
	coordmode,pixel,screen
	imagesearch,fx,fy,76,185,208,310,usebowl.bmp
	if !fx
	{
		msgbox, Inventory fault occured, use bowl not found. Run will terminate.
		exitapp
		
	}
		else
		{
			mouseclick
		}
}
detectinvfault2()
{
	coordmode,pixel,screen
	imagesearch,fx,fy,76,149,291,268,usetunacorn.bmp
	if !fx
	{
		msgbox, Inventory fault occured, Tuna and corn not found. Run will terminate.
		exitapp
		
	}
		else
		{
			mouseclick,right
		}
}

Randomizetime()
{
	global RandomTime
	Random,RandomTime,700,1200
}

RandomizeSpeed()
{
	global RandomSpeed
	Random,RandomSpeed,10,40
}

formatAccumulatedTime(secs)
{
	if secs>60
	{
		minsAccumulated:=(secs/60)+0
		msgbox,%minsAccumulated%
		secsAccumulated:=(secs/minsAccumulated)+0
		msgbox,%secsAccumulated%
		hoursAccumulated:=minsAccumulated/60
		msgbox,%hoursAccumulated%
		formattedTime=%hoursAccumulated% hours %minsAccumulated% mins :%secsAccumulated% seconds
		msgbox,%formattedTime%
	}
	else formattedTime=0:0:%secs%

}

calcProfit()
{	
	setformat,float,0
	global profit:=(tpsMade*saleprice)-(tpsmade*(tuna+corn+potato))
	profit:=(profit/1000)+0
	
}

calcSaleTotal()
{
	global saleTotal:=tpsMade*saleprice
	saleTotal:=(saleTotal/1000)+0
}
calcgph(time)
{
	
	setformat,float,0.4
	hoursaccumulated:=(time/3600.0)
	global gph:=profit/hoursAccumulated
	gph:=ceil(gph/1000)

}

	
	

		
