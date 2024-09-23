#singleinstance force
coordmode, mouse, relative
coordmode, pixel, relative
global test

esc::exitapp
^1::suspend,toggle


^2::Reload
^3::blockinput,mousemoveoff

1::
blockinput,mousemove
x=30

while(x!=0)
{

	imagesearch,fx,fy,430,29,916,701,pizzabasebank.bmp
	if !fx
	{
		msgbox, pizzabase not found
		pause
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%
		sleep,1000
		click right
		sleep,1250
	}
	
	imagesearch,fx,fy,230,29,916,701,withdrawl14.bmp
	
	if !fx
	{
		msgbox, withdrawl14 not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 1000
	}
	
		
	imagesearch,fx,fy,430,29,916,701,tomatobank.bmp
	
	if !fx
	{
		msgbox, tomato not found
		pause
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%                  ;withdrawls 14 tomatos
		sleep,1000
		click right
		sleep, 1000
	}
		
	imagesearch,fx,fy,230,29,916,701,withdrawl14.bmp
	
	if !fx
	{
		msgbox, withdrawl14 not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 1000
	}
	
	
	imagesearch,fx,fy,434,33,918,704,exitbank.bmp
	
	if !fx
	{
		msgbox, exitbank not found
		pause
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%
		sleep,1000
		click
		sleep, 1000
	}
	
	
	click 1455,710, ;click pizzabase
	sleep,650
	click 1502,710, ;click tomato
	sleep,1000
	click right 257,786, ;rightclick here
	sleep,1550
	
	imagesearch,fx,fy,162,770,326,875,makeall.bmp
	
	if !fx
	{
		msgbox, makeall not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	sleep,18000    ; this is to be determined

	
	PixelSearch, Px, Py,620, 480, 738, 581, 0xDCD7DC, 25, fast
	if !Px
	{
		PixelSearch, Px, Py,679, 503, 750, 569, 0xDCD7DC, 25, fast
	}
	mousemove,Px,Py,%RandomSpeed%
	sleep,75									;clicks banker
	click right
	sleep,750
	
	imagesearch,fx,fy,400,420,900,900,bankbanker.bmp
	if !fx
	{
		msgbox, banker not found
		pause
	}
	
	if fx>0
	{
		mouseclick,left,fx,fy						;clicks bank banker
	}
	
		
	sleep,1500

	
	imagesearch,fx,fy,434,33,918,704,cheesebank.bmp
	
	if !fx
	{
		msgbox, cheese not found
		pause
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%                  ;withdrawls 14 cheese
		sleep,1000
		click right
		sleep, 500
	}

			
	imagesearch,fx,fy,250,33,918,704,withdrawl14.bmp
	
	if !fx
	{
		msgbox, withdrawl14 not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	
	imagesearch,fx,fy,434,33,918,704,exitbank.bmp
	
	if !fx
	{
		msgbox, exitbank not found
		pause
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%
		sleep,1000
		click
		sleep, 1000
	}
	
	
		
	click 1455,710, ;click pizzabase with sauce
	sleep,1200
	click 1502,710, ;click cheese
	sleep,1500
	click right 257,786, ;rightclick here
	sleep,1500
	
	imagesearch,fx,fy,162,770,326,875,makeall.bmp
	
	if !fx
	{
		msgbox, makeall not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}

	sleep,18000    ; this is to be determined
	
	
	click 1455,710, ;click uncooked pizza
	sleep,650

	
	PixelSearch, Px, Py, 748, 8, 1000, 250, 0xD52312, 10,fast|RGB
	if !px
	{
		mousemove,877,51,%RandomSpeed%
		sleep,750									;clicks the wall
		click right
		sleep,750
	}
	
	else
	{
		mousemove,Px,Py,%RandomSpeed%
		sleep,750									;clicks red spot
		click right
		sleep,1500
		
	}
	
	imagesearch,fx,fy,675,8,1100,300,usepizza.bmp
	
	if !fx
	{
		msgbox, range not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+5,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	
	sleep, 17500
	
	click right 257,786, ;rightclick here
	sleep,750
	
	imagesearch,fx,fy,162,770,326,875,cookall.bmp
	
	if !fx
	{
		msgbox, cookall not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	sleep,31000    ; this is to be determined
	
	imagesearch,fx,fy,7,712,509,823,advancedlevel.bmp
	if fx>0
	{	
		
		imagesearch,fx,fy,1000,500,1600,800,uncookedpizza.bmp
		if !fx
		{
			msgbox, wtf couldnt find uncooked pizza
			pause
		}
		else
		{	
			mousemove,fx,fy+10,%RandomSpeed%
			sleep,750
			click 
			sleep,500
			PixelSearch, Px, Py, 665, 372, 778, 487, 0xD52312, 10,fast|RGB
			if !px
			{
				msgbox,wtf couldnt find range
				pause
			}
			else
			{	
				mousemove,px,py
				sleep, 500
				click
				sleep,1750
				
				click right 257,786, ;rightclick here
				sleep,750
	
				imagesearch,fx,fy,162,770,326,875,cookall.bmp
	
				if !fx
				{
					msgbox, cookall not found
					pause
				}
	
				else
				{
					mousemove,fx,fy+10,%RandomSpeed%
					sleep,1000
					click
					sleep, 500
				}
				sleep,31000    
				
			}
			
			
		
			
			
		}
	
	}
	
	
	mousemove 1456,703
	sleep, 750
	click right
	sleep, 750
	
	imagesearch,fx,fy,1376,677,1553,816,use.bmp
	if !fx
	{
		msgbox, plain pizza not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 850
	}
	
	mousemove 892,736
	sleep,250
	click right
	sleep,650
	
	
	imagesearch,fx,fy,694,682,1003,889,rockslide.bmp
	if !fx
	{
		msgbox, rockslide not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	sleep,7000
	

	mousemove 1456,695
	sleep, 750
	click right
	sleep, 750
	
	imagesearch,fx,fy,1376,677,1553,816,use.bmp
	if !fx
	{
		msgbox, plain pizza not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 850
	}
	
	mousemove 560,595
	sleep, 750
	click right
	sleep, 1250
	

	
	imagesearch,fx,fy,387,509,693,692,chair.bmp
	if !fx
	{	
		click
		mousemove 576,642
		sleep, 750
		click right
		sleep, 1250
	
		imagesearch,fx,fy,387,509,693,692,chair.bmp
		if !fx
		{
			click
			mousemove 584,587
			sleep, 750
			click right
			sleep, 1250
		
			imagesearch,fx,fy,387,509,693,692,chair.bmp
			if !fx
			{	
				click
				mousemove 586,619
				sleep, 750
				click right
				sleep, 1250
				imagesearch,fx,fy,300,450,900,800,chair.bmp
				
				if !fx
				{
					click
					mousemove 552,598
					sleep, 750
					click right
					sleep, 1250
					imagesearch,fx,fy,300,450,900,800,chair.bmp
					
					if !fx
					{
						msgbox, chair not found
						pause
					}
					else
					{
						mousemove,fx,fy,%RandomSpeed%
						sleep,1000
						click
						sleep, 500
					}		
				
				}
				else
				{
					mousemove,fx,fy,%RandomSpeed%
					sleep,1000
					click
					sleep, 500
				}	
			
			}
			else
			{
				mousemove,fx,fy,%RandomSpeed%
				sleep,1000
				click
				sleep, 500
			}	
		}
		else
		{
			mousemove,fx,fy,%RandomSpeed%
			sleep,1000
			click
			sleep, 500
		}
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	
	sleep,12000
	
	PixelSearch, Px, Py, 609, 608, 723, 701, 0xDCD7DC, 25, fast
		
	mousemove,Px,Py,%RandomSpeed%
	sleep,750									;clicks banker
	click right
	sleep,750
		

	imagesearch,fx,fy,400,420,900,900,bankbanker.bmp
	if !fx
	{
		click 
		sleep,500
		PixelSearch, Px, Py, 624, 631, 712, 695, 0xDCD7DC, 25, fast
		if px>0
		{
			mousemove,Px,Py,%RandomSpeed%
			sleep,750									;clicks banker
			click right
			sleep,750	
			imagesearch,fx,fy,400,420,900,900,bankbanker.bmp
			sleep,500
				if fx>0
				{
					mouseclick,left,fx,fy+5						;clicks bank banker
				}
				else
				{
					msgbox, Cant find banker
				}
		}
		else
		{
		msgbox, banker not found
		pause
		}
	}
	
	if fx>0
	{
		mouseclick,left,fx,fy+5						;clicks bank banker
	}
	
		
	sleep,3000
	
	
	
	imagesearch,fx,fy,434,107,881,336,anchoviesbank.bmp
	if !fx
	{
		msgbox, anchovies not found
		pause
	}
	
	else
	{
		mousemove,fx+7,fy,%RandomSpeed%
		sleep,1000
		click right
		sleep,500
	}
	
	imagesearch,fx,fy,250,33,918,704,withdrawl14.bmp
	
	if !fx
	{
		msgbox, withdrawl14 not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	
	imagesearch,fx,fy,434,33,918,704,exitbank.bmp
	if !fx
	{
		msgbox, exitbank not found
		pause
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	
	
	imagesearch,fx,fy,1388,577,1564,725,cookedpizza.bmp
	if !fx
	{
		msgbox, cookedpizza not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click right
		sleep, 500
	}
	
	sleep,1000
	
	imagesearch,fx,fy,1188,577,1564,725,use.bmp
	if !fx
	{
		msgbox, plain pizza not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	
	
	click 1502,710, ;click cheese
	sleep,1500
	click right 257,786, ;rightclick here
	sleep,1500
	
	imagesearch,fx,fy,162,770,326,875,makeall.bmp
	
	if !fx
	{
		msgbox, makeall not found
		pause
	}
	
	else
	{
		mousemove,fx,fy+10,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	sleep,18000    ; this is to be determine
	
	
	PixelSearch, Px, Py,620, 480, 738, 581, 0xDCD7DC, 25, fast
	if !px
	{
		PixelSearch, Px, Py,649, 561, 704, 612, 0xDCD7DC, 25, fast
	}
	mousemove,Px,Py,%RandomSpeed%
	sleep,750									;clicks banker
	click right
	sleep,750
	

	imagesearch,fx,fy,400,420,900,900,bankbanker.bmp
	if !fx
	{
		msgbox, banker not found
		pause
	}
	
	if fx>0
	{
		mouseclick,left,fx,fy+5						;clicks bank banker
	}
	
		
	sleep,2000
	
	
	imagesearch,fx,fy,434,33,918,704,emptybag.bmp
	
	if !fx
	{
		msgbox, emptybag not found
		pause
	}
	
	else
	{
		mousemove,fx,fy,%RandomSpeed%
		sleep,1000
		click
		sleep, 500
	}
	x-=1
}






















