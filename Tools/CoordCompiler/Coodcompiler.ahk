#1::
coordmode,mouse,relative

mousegetpos,px,py
inputbox,coorddescription,Describe Position, Enter something descriptive of this position,,200,150,0,0
fileappend,GetMousePos`,`,%px%`,%py%`,`,`%randomspeed`% `;%coorddescription%`n,coordlist.txt
fileappend,Sleep`,1000`n,coordlist.txt