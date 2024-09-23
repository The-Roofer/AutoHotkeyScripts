coordmode,mouse,Relative
CoordMode Pixel, Relative

;0xD37937 = orange
;0x0ee103 old

#Persistent
#singleinstance force
x:=1
while x=1
{
	PixelSearch, Px, Py, 0, 0, 250, 150, 0x0ee103, 25, fast|RGB
	
	if px>1
	{
		click
		sleep,100
		mousemove,1,1,5
		px:=0
		sleep,5000
		mousemove, 503,389
		;featherscan()
	}
	;featherscan()
	movemouse()
	sleep,100
	DisconnectScan()
}
movemouse()
{
	xcoord:=0
	
	PixelSearch, xcoord, ycoord, 150,150, 792, 570, 0x7B1A0D, 15, fast|RGB
	
	;PixelSearch, xcoord, ycoord, 10,45, 860, 735, 0x7B1A0D, 15, fast|RGB
	if xcoord>0
	{
		mousemove, xcoord,ycoord,0
	}
}

FeatherScan()
{
	x=2

	ImageSearch, FoundX1, FoundY1, 150,150, 850,850,*5 %A_WorkingDir%\feather.bmp
	if FoundX1>0
	{
		mousemove,FoundX1,FoundY1,10
		mouseclick,right
		sleep,750
	}
	ImageSearch, FoundX2, FoundY2, 150,150, 850, 650,%A_WorkingDir%\takefeather.bmp
	if FoundX2>0
	{
		mouseclick,left,FoundX2,FoundY2
		sleep,3000
	}
	return
}

DisconnectScan()
{
	ImageSearch, FoundX2, FoundY2, 150,150, 850, 650,%A_WorkingDir%\Clickheretoplay.bmp
	if FoundX2>0
	{
		mouseclick,left,FoundX2,FoundY2
		sleep,3000
	}
	
	ImageSearch, FoundX2, FoundY2, 150,150, 850, 650,%A_WorkingDir%\Existinguser.bmp
	if FoundX2>0
	{
		mouseclick,left,FoundX2,FoundY2
		send wormg3ar@gmail.com
		send {tab}
		send lol good try
		send {enter}
		
		sleep,3000
	}
	
	
	
	
	
	return


}

^1::Pause
