;
;   A Script to mine copper rocks south of varrock
;
;   copper color:  0x81532E
;   Empty rock color: 0x403B3B
;   "Mine Rocks":  0x00D9D9
;   Road Color: 0x626059 0x6D6B62
;   crossroad color: 0x68633E
;	bankgold color: 0xE8D04A
;   bankers yellow: 0xFCFC02
;   bankers shirt color: 0x271F35
;   inventory copper orange : 0xD46422
;   pickaxe handle color : 0x946640
;   south terminating :0x453C11


#singleinstance force
coordmode, mouse, relative
coordmode, pixel, relative


^2::Pause
^1::
loop,5
{

PixelSearch, xcoord, ycoord, 992,66,1007,91, 0x626059, 20, fast|RGB
if xcoord>0
	{
		mousemove, xcoord,ycoord,0
		sleep,200
		click
		click
		click
		sleep,11000
	}
	else
	{
		msgbox, step 1 not found
		return
	}

PixelSearch, xcoord, ycoord, 997,106,1017,131, 0x626059, 20, fast|RGB
if xcoord>0
	{
		mousemove, xcoord,ycoord,0
		click
		sleep,9500
	}
		else
	{
		msgbox, step 2 not found
		return
	}
	
PixelSearch, xcoord, ycoord, 975,152,998,164, 0x626059, 20, fast|RGB
if xcoord>0
	{
		mousemove, xcoord,ycoord,0
		click
	}
		else
	{
		msgbox, step 3 not found
		return
	}
sleep,10000

PixelSearch, xlimit, crossroady, 994,83, 1013, 107, 0x453C11, 5, fast|RGB
6::
while(!xlimit)
{
PixelSearch, xcoord, ycoord, 945,152, 971, 182, 0x626059, 20, fast|RGB
if xcoord>0
	{
		mousemove, xcoord,ycoord,0
		click
	}
		
	PixelSearch, xlimit, crossroady, 995,83, 1020, 107, 0x453C11, 15, fast|RGB
}

sleep,3250

PixelSearch, fx, fy, 884,103, 950, 165, 0x946640, 12, fast|RGB
mousemove,fx,fy
sleep,200
click

sleep,5000

PixelSearch, xcopper, ycopper, 956,672, 985, 698, 0xD46422, 12, fast|RGB
while !xcopper
{


	PixelSearch, xcoord, ycoord, 503,418, 530, 450, 0x81532E, 12, fast|RGB
	
	PixelSearch, Px, Py, 10, 40, 200, 50, 0x00D9D9, 25, fast|RGB
	
	if px>1
	{
		click
		sleep,100
		mousemove,1,1,5
		px:=0
		sleep,5000
		mousemove, 503,389
	}

	movemouse()
	sleep,100
	PixelSearch, xcopper, ycopper, 956,672, 985, 698, 0xD46422, 12, fast|RGB
}
movemouse()
{
	xcoord:=0
	PixelSearch, xcoord, ycoord, 503,418, 530, 450, 0x81532E, 12, fast|RGB
	if xcoord>0
	{
		mousemove, xcoord,ycoord,0
	}
}

7::
while(!crossroadx)
{
PixelSearch, xcoord, ycoord, 956,42, 998, 65, 0x75716A, 20, fast|RGB
if xcoord>0
	{
		mousemove, xcoord,ycoord,0
		click
	}
if !xcoord
	{
		PixelSearch, xcoord, ycoord, 911,47, 941, 68, 0x75716A, 20, fast|RGB
		if xcoord>0
		{
			mousemove, xcoord,ycoord,0
			click
		
		}
	
	}
	
	PixelSearch, crossroadx, crossroady, 970,42, 998, 65, 0x68633E, 10, fast|RGB
}


while(!bankgoldx)
{
PixelSearch, xcoord, ycoord, 877,81, 896, 122, 0x626059, 12, fast|RGB
if xcoord>0
	{
		mousemove, xcoord,ycoord,0
		click
	}
	
	PixelSearch, bankgoldx, crossroady, 890,117, 922,171, 0xE8D04A, 12, fast|RGB
}
sleep,5000

while(!xbankers)
{
imagesearch, xbankers, ybankers, 872,122, 1023, 205, *50 *TransBlack bankers.bmp 
if xbankers>0
	{	
		
		mousemove, xbankers,ybankers,0
		click
	
	}
}
sleep,9500


while(!bankbankerx)
{
PixelSearch, xcoord, ycoord, 434,384, 578, 544, 0x271F35, 12, fast|RGB
if xcoord>0
	{
		mousemove, xcoord,ycoord,0
		sleep,200
		click, right
	}
	
	imagesearch, bankbankerx, bankbankery, 300,200, 800,650,bankbanker.bmp
	if Bankbankerx > 0
	{
		mousemove,bankbankerx,bankbankery
		sleep,200
		click
	}
}
sleep,4000

PixelSearch, xcoord, ycoord, 814,449, 994, 699, 0xD46422, 12, fast|RGB
sleep,500
mousemove,xcoord,ycoord
sleep,500
click, right
sleep,250
imagesearch,fx,fy,700,400,1028,750,depositall.bmp
if !fx
{
	msgbox, not found
	
}
sleep,250
mousemove,fx,fy
click
sleep,200
click,614,49
}

















