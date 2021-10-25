#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

xx = 0
yy = 0

enter::

MouseGetPos, x, y

Mouseclick,, xx, yy,, 0
Sleep, 1000

Send {enter}
MouseMove, x, y, 0
Return

^+enter::
MouseGetPos, xx, yy
Return