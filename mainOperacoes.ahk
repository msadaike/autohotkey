#SingleInstance Force

#MaxThreads, 100
Run, neverLock.ahk

destravar()
{
hotkey, !Tab, toggle
hotkey, #Tab, toggle
hotkey, LWin, toggle
hotkey, RWin, toggle
hotkey, !F4, toggle	
hotkey, ^#Right, toggle	
hotkey, ^#Left, toggle	
hotkey, ^Esc, toggle			
}

Gui, Color, black
Gui +AlwaysOnTop
Gui -Caption
Gui, Show, x-3000 y0 w6000 h3000
destravar()
return

; Travamento quando liga o Programa
!Tab::Return 		; Disable Alt+Tab
#Tab::Return 		; Disable Windows Key + Tab
LWin:: return 		; disable left Windows key
RWin:: return 		; disable right Windows key
!F4:: return		; disable ALT+F4
^#Right::return		; disable CONTROL + WINDOWS KEY + RIGHT ARROW
^#Left::return		; disable CONTROL + WINDOWS KEY + LEFT ARROW
^Esc::return		; disable CTRL+ESC

; Wait for page to load by checking pixel color at specified x,y coordinates
WaitForPageLoadByColor(x, y, color, seconds:=-1)
{
   start := A_TickCount
   while ( (seconds = -1) || (A_TickCount-start <= seconds*1000) )
   {
      PixelGetColor, Loaded, %x%, %y%, RGB
      if Loaded = %color%
         return
   }
   ErrorLevel := 1 ; Page failed to load
}

^F12::
Run,%ComSpec% /c Taskkill -f -im autohotkey.exe,%A_ScriptDir%,Hide
return

#MaxThreadsPerHotkey 3
^+!l::  ; Ctrl+Shift+L hotkey (change this hotkey to suit your preferences).
destravar()
#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    WinClose, mainOperacoes.ahk
	return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true

Loop
{
    if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
	{
		Gui, Show, x-3000 y0 w6000 h3000
	}
	; The next four lines are the action you want to repeat (update them to suit your preferences):
    Click
	Sleep 100
    ; But leave the rest below unchanged.
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return

^+=::
Send {Volume_Up}
return

^+-::
Send {Volume_Down}
return

^+s::
Send ^c
Sleep, 300
Run, https://scholar.google.com/
WaitForPageLoadByColor(399, 265, "0xBBCFE3", 10)
Send ^v
Sleep, 500
Send {Enter}
return

^+g::
Send ^c
Sleep, 300
Run, https://www.google.com/
WaitForPageLoadByColor(399, 265, "0xBBCFE3", 10)
Send ^v
Sleep, 500
Send {Enter}
return

^+y::
Run, https://www.youtube.com/
return

^+1::
Sleep, 500
Send ^1
Sleep, 300
MouseMove, A_ScreenWidth/2, A_ScreenHeight/2
Click
Sleep, 50
Send {LCtrl down}{Tab}{LCtrl up}
return

^+i::
Send ^c
Sleep, 300
Run, https://translate.google.com/m/translate?hl=pt-BR
WaitForPageLoadByColor(399, 265, "0xBBCFE3", 10)
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send, {TAB}
Sleep, 10
Send ^v
Sleep, 500
Send {Enter}
return

^+z::
SetTitleMatchMode, 2
ifwinactive, ahk_class CabinetWClass
  ControlGetText, address , edit1, ahk_class CabinetWClass
else
  address =

; Exclude specific windows

ifwinactive, My Computer
  address =
ifwinactive, My Documents
  address =

if (address <> "") 
  Run, cmd.exe, %address%
else 
  Run, cmd.exe, C:\

Sleep, 2000
Send cd Users\msadaikes\Desktop\Android Conector
Sleep, 1000
Send {Enter}
Sleep, 2000
Send gnirehtet run
Sleep, 1000
Send {Enter}
return

^+v::
Run, C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe
Sleep, 3000
Send {Enter}
Sleep, 7000
Send a
Sleep, 200
Send {Enter}
Sleep, 800
Send c&lina06
Sleep, 200
Send {Enter}
Sleep, 2000
Send {Enter}
return
