!j::Left ; Alt+J sends the Left arrow key.
!l::Right ; Alt+L sends the Right arrow key.
!i::Up ; Alt+I sends the Up arrow key.
!k::Down ; Alt+K sends the Down arrow key.
!n::^Left ; Alt+N sends the Ctrl+Left arrow key combination.
!m::^Right ; Alt+M sends the Ctrl+Right arrow key combination.
!o::Delete ; Alt+O sends the Delete key.
!u::Backspace ; Alt+U sends the Backspace key.
!;::^Delete ; Alt+; sends the Ctrl+Delete key combination.
!h::^Backspace ; Alt+H sends the Ctrl+Backspace key combination.
!,::Home ; Alt+, sends the Home key.
!.::End ; Alt+. sends the End key.
!f::^f		 ; ALT+F sends search.
!z::^z ; Alt+Z sends the Ctrl+Z key combination.
!y::^y ; Alt+Y sends the Ctrl+Y key combination.
!a::^a ; Alt+A sends the Ctrl+A key combination.
!s::^s ; Alt+S sends the Ctrl+S key combination.
!c::^c ; Alt+C sends the Ctrl+C key combination.
!v::^v ; Alt+V sends the Ctrl+V key combination.
!b::#v
!x::^x ; Alt+X sends the Ctrl+X key combination.
!e::Run "Explorer" ; Alt+E opens File Explorer.
!r::Run "Notepad" ; Alt+R opens Notepad.
!ESC::!f4 ; Alt+Esc sends the Alt+F4 key combination.
!/::^/		 ; Comments out line in normal IDEs, *Chough*, *Cough* VS
!q::Run "C:\Program Files\Mozilla Firefox\firefox.exe https://excalidraw.com/"


!^,::+Home
!^.::+End

!^n::{
    SendInput "^{Right}"
    SendInput "^+{Left}"
    SendInput "^{x}"
}
!^m::{
    SendInput "{End}"
    SendInput "+{Home}"
    SendInput "^{x}"
    SendInput "{Backspace}"
}

3::3
3 & i::MoveCursorUp(3)
3 & k::MoveCursorDown(3)

2::2
2 & i::MoveCursorUp(2)
2 & k::MoveCursorDown(2)

4::4
4 & i::MoveCursorUp(4)
4 & k::MoveCursorDown(4)

5::5
5 & i::MoveCursorUp(5)
5 & k::MoveCursorDown(5)

6::6
6 & i::MoveCursorUp(10)
6 & k::MoveCursorDown(10)

MoveCursorUp(Count) {
    Loop Count {
        SendInput "{Up}"
    }
}

MoveCursorDown(Count) {
    Loop Count {
        SendInput "{Down}"
    }
}

; ^g::{

;     MsgBox "The active window is '" WinGetID("A") "'."

;     MsgBox "Tittle is '" WinGetProcessName("A") "'."
; }

!t::{
    currWindow :=  WinGetProcessName("A")
    ;shift alt c
    if(currWindow = "explorer.exe"){
        res := ControlGetText("ToolbarWindow324", WinGetTitle("A"))
        finalStr := ""
            dist := StrSplit(res,' ')
            for w, s in dist{
                if(w != 1){
                    if(finalStr != "")
                        finalStr := finalStr . " " . s
                    else
                        finalStr := s
                }
            }
            ; MsgBox finalStr

            newPath := "`"" StrReplace(finalStr, "\", "/") "`""
            ; MsgBox newPath

            finalCmd := "C:\\WINDOWS\\system32\\cmd.exe /K cd " . newPath
            ; MsgBox finalCmd
            Run finalCmd
    }
    else{
        if(currWindow = "code.exe"){
            SendInput "^+{c}"
        }
        else{
            Run "C:\WINDOWS\system32\cmd.exe /K cd C://"
        }
    }
}