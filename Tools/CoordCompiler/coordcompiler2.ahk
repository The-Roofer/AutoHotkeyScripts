#1::
coordmode,mouse,screen

mousegetpos,px,py
inputbox,coorddescription,Describe Position, Enter something descriptive of this position,,200,150,0,0
fileappend,%px%`,%py%`,` `;%coorddescription%`n,coordlist.txt
fileappend,,coordlist.txt