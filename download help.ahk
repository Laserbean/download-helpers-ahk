#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

tog = 1;
Gui, Add, Text, BackgroundTrans vTest, ONN ;3 lettered word

xx = 0
yy = 0

clstab = 1
initialdelay = 1

menu()

end::
menu()
return

menu()
{
	MsgBox, 1, Download Helper, A tool to automatically click download at a point on a webpage and close the tab (if needed)`n`nSHIFT-ENTER to toggle on or off`nPGDOWN to save the location of the download button`nENTER to execute downloading`nEND to see this menu again`n`nOkay: Continue`nCancel: Quit
	IfMsgbox Ok
		setts1()
	IfMsgBox Cancel
		ExitApp
return
}

setts1()
{
Msgbox, 3, Download Helper Settings, Turn on automatic web page clossing? 
IfMsgBox Yes
{
	clstab = 1
	setts2()
}
IfMsgBox No
{
	clstab = 0
	setts2()
}
IfMsgBox Cancel
	menu()
return
}

setts2()
{
	Msgbox, 3, Download Helper Settings, Turn on initial delay? `n(For when the download button takes time to appear)
IfMsgBox Yes
	initialdelay = 1
IfMsgBox No
	initialdelay = 0
IfMsgBox Cancel
	menu()
return	
}



enter::
if tog= 0
{
MouseGetPos, x, y
MouseMove, xx, yy, 0
if initialdelay = 1
	sleep, 500
MouseClick, left 

WinWait, Save As, , 3
if ErrorLevel
{
	MsgBox, ,Error1, Couldn't find "Save as" window, 3
}
else
{
Send {enter}
Sleep, 1000
MouseMove, x, y, 0
if clstab = 1
	Send, ^w
}
}
else
{
Send {enter}
}
return

pgdn::
MouseGetPos, xx, yy
return

+enter::
if tog = 0
{
tog = 1
display(0,"Download help is:")
}
else
{
tog =0
display(1,"Download help is:")
}
return


display(x,text)
{
if x = 1
{
toggle = ON
}
else
{
toggle = OFF
}
	Gui, Foish: New
	Gui, Color, 990099
	Gui, Font, S50, Trebuchet MS
	Gui, Add, Text,, %text%
	Gui, Add, Text, BackgroundTrans vTest, ONN ;3 lettered word
	Gui +LastFound +AlwaysOnTop +ToolWindow
	WinSet, TransColor, 990099
	Gui -Caption
	GuiControl,, Test, %toggle%
	Gui, Show
	Sleep, 500
	Gui, Hide
}
