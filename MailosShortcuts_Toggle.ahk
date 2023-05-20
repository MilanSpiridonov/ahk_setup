; Define the initial state of the toggle variable
edit_mode := False
MyGui := Gui()
; Create a hotkey that listens for the Alt key press
Alt::
{
        currWindow := WinGetTitle("A")

        MyGui.Destroy()
        global MyGui := Gui()
        MyGui.Opt("+AlwaysOnTop -Caption")

        if(edit_mode = False){
            global edit_mode := True
            MyGui.Add("Text",, "Edit Mode")
            MyGui.BackColor := "EEAA99"
            MyGui.Title := "Edit Mode"
        }
        else{
            global edit_mode := False
            MyGui.Add("Text",, "Text Mode")
            MyGui.Title := "Text Mode"
            MyGui.BackColor := "0048ba"
        }

        ScreenWidth := A_ScreenWidth
        ScreenHeight := A_ScreenHeight
       
      
        MyGui.Show
        MyGui.Move(10, 20, 100, 50)
        if WinExist(currWindow)
        {
            WinActivate
        }
        SendInput "{Esc}"
    }
    j::{
        if (edit_mode){
            SendInput "{Left}"
        }
        else{
            SendText "j"
        }
    }

    l::{
        if (edit_mode){
            SendInput "{Right}"
        }
        else{
            SendText "l"
        }
    }

    i::{
        if (edit_mode){
            SendInput "{Up}"
        }
        else{
            SendText "i"
        }
    }

    k::{
        if (edit_mode){
            SendInput "{Down}"
        }
        else{
            SendText "k"
        }
    }

    n::{
        if (edit_mode){
            SendInput "^{Left}"
        }
        else{
            SendText "n"
        }
    }

    $m::{
        if (edit_mode){
            SendInput "^{Righ}"
        }
        else{
            SendText "m"
        }
    }

    o::{
        if (edit_mode){
            SendInput "{Delete}"
        }
        else{
            SendText "o"
        }
    }

    u::{
        if (edit_mode){
            SendInput "{Backspace}"
        }
        else{
            SendText "u"
        }
    }
    `;::{
        if (edit_mode){
            SendInput "^{Delete}"
        }
        else{
            SendText ";"
        }
    }
    h::{
        if (edit_mode){
            SendInput "^{Backspace}"
        }
        else{
            SendText "h"
        }
    }
    ,::{
        if (edit_mode){
            SendInput "{Home}"
        }
        else{
            SendText ","
        }
    }
    .::{
        if (edit_mode){
            SendInput "{End}"
        }
        else{
            SendText "."
        }
    }
    $f::{
        if (edit_mode){
            SendInput "^f"
        }
        else{
	      SendInput "f"
        }
    }

    z::{
        if (edit_mode){
            SendInput "^z"
        }
        else{
            SendText "z"
        }
    }

    y::{
        if (edit_mode){
            SendInput "^y"
        }
        else{
            SendText "y"
        }
    }

    a::{
        if (edit_mode){
            SendInput "^a"
        }
        else{
            SendText "a"
        }
    }

    s::{
        if (edit_mode){
            SendInput "^s"
        }
        else{
            SendText "s"
        }
    }

    c::{
        if (edit_mode){
            SendInput "^c"
        }
        else{
            SendText "c"
        }
    }

    v::{
        if (edit_mode){
            SendInput "^v"
        }
        else{
            SendText "v"
        }
    }

    b::{
        if (edit_mode){
            SendInput "#v"
        }
        else{
            SendText "b"
        }
    }

    x::{
        if (edit_mode){
            SendInput "^x"
        }
        else{
            SendText "x"
        }
    }

    !e::Run "Explorer" ; Alt+E opens File Explorer.
    !r::Run "Notepad" ; Alt+R opens Notepad.
    !ESC::!f4 ; Alt+Esc sends the Alt+F4 key combination.
    !/::^/		 ; Comments out line in normal IDEs, *Chough*, *Cough* VS
    !q::Run "C:\Program Files\Mozilla Firefox\firefox.exe https://excalidraw.com/"

    ^,::+Home
    ^.::+End

    ^n::{
        SendInput "^{Right}"
        SendInput "^+{Left}"
        SendInput "^{x}"
    }
    ^m::{
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
        currWindow := WinGetProcessName("A")
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