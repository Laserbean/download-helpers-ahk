#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force




+F2::
num := 1

InputBox, goal, "File Renamer", "Enter Number of files"
if goal is not Number
	goto end

Start:
Send, {F2}
Send, {home}
Sleep, 10
Send %num%
Send, :
Send, {space}
Sleep, 10
Send, {enter}
Sleep, 20
Send, {down}
Sleep, 20
num := num + 1
OutputDebug, %num%

IfLessOrEqual, num, %goal%
{
OutputDebug, 'test'
goto Start
}
end:
goal := 0
return


