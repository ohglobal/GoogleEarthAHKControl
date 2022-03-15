;Google Earth Control
;Created by Andy Carluccio

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;usage 
;-location : enters the location into google earth search box
;-up : pans up the specified amount
;-down : pans down the specified amount
;-left : pans left the specified amount
;-right : pans right the specified amount
;-in : zooms in the specified amount
;-out : zooms out the specified amount

loc := ""
up_amnt := 0
down_amnt := 0
left_amnt := 0
right_amnt := 0
in_amnt := 0
out_amnt := 0

for n, param in A_Args  
{
    if(param == "-location"){
		loc := A_Args[n+1]
	}
	
	else if(param == "-up"){
		up_amnt := A_Args[n+1]
	}
	
	else if(param == "-down"){
		down_amnt := A_Args[n+1]
	}
	
	else if(param == "-left"){
		left_amnt := A_Args[n+1]
	}
	
	else if(param == "-right"){
		right_amnt := A_Args[n+1]
	}
	
	else if(param == "-in"){
		in_amnt := A_Args[n+1]
	}
	
	else if(param == "-out"){
		out_amnt := A_Args[n+1]
	}
	
	
	
	
}

WinActivate, Google Earth Pro

if(loc != ""){
	MouseClick, left, 28, 93
	;Send {Text}University of Virginia
	Send ^a
	Send %loc%
	Send {Enter}
	;MsgBox %loc%
}

if(up_amnt != 0){
	MouseClick, left, 512, 112
	Send {Up down}  
	Sleep up_amnt 
	Send {Up up}
}

if(down_amnt != 0){
	MouseClick, left, 512, 112
	Send {Down down} 
	Sleep down_amnt
	Send {Down up} 
}

if(left_amnt != 0){
	MouseClick, left, 512, 112
	Send {Left down}  
	Sleep left_amnt  
	Send {Left up} 
}

if(right_amnt != 0){
	MouseClick, left, 512, 112
	Send {Right down} 
	Sleep right_amnt  
	Send {Right up} 
}

if(in_amnt != 0){

	MouseClick, left, 1500, 800
	while(A_Index<(in_amnt//100)){
		Send {Wheelup}
		Sleep 100
	}
	Return
}

if(out_amnt != 0){
	MouseClick, left, 1500, 800
	while(A_Index<(out_amnt//100)){
		Send {WheelDown}
		Sleep 100
	}
	Return
}



