
#0::

Gui, Add, Text, vMyEdit w100, 1

Gui, Show

settimer, aa, 100

return

aa:
coordmode,mouse,screen
mousegetpos,mousex,mousey
GuiControl,, MyEdit, %mousex%`,%mousey%

return