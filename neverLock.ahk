#SingleInstance Force

#MaxThreads, 100

#Persistent
SetTimer, NeverLock, 280000
return

NeverLock:
    ;MouseMove,0,-1,0,R 
	;MouseMove,0,1,0,R
	;Send a	
	Send {ScrollLock}
	Sleep, 100
	Send {ScrollLock}
return

