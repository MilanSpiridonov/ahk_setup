edit_mode := False
MyGui := Gui()
vertical_buffer := 0
guiShown := True

MakeGui()

MakeGui(){
    currWindow := WinGetTitle("A")
    MyGui.Destroy()
    global MyGui := Gui()
    MyGui.Opt("+ToolWindow +LastFound +AlwaysOnTop -Caption")

    if(edit_mode){
        MyGui.Add("Text",, "Edit Mode")
        MyGui.BackColor := "EEAA99"
        MyGui.Title := "Edit Mode"
        MyGui.Add("Text",, "V_Buffer: " . vertical_buffer)
    }
    else{
        MyGui.Add("Text",, "Text Mode")
        MyGui.Title := "Text Mode"
        MyGui.BackColor := "0048ba"
    }
    MyGui.Show()
    MyGui.Move(10, 20, 100, 50)
    if WinExist(currWindow)
    {
        WinActivate
    }
    global guiShown := True
}

^Enter::{
    if(guiShown)
    {
        MyGui.Destroy()
        global guiShown := False
    }
    else{
        MakeGui()
    }
}

Alt::
    {
        if(edit_mode = False){
            global edit_mode := True
        }
        else{
            global edit_mode := False
            global vertical_buffer := 0
        }
        MakeGui()

        ScreenWidth := A_ScreenWidth
        ScreenHeight := A_ScreenHeight
    }
    $+j::{
        if (edit_mode){
            SendInput "+{Left}"
        }
        else{
            SendInput "+{j}"
        }
    }
    $j::{
        if (edit_mode){
            SendInput "{Left}"
        }
        else{
            SendInput "{j}"
        }
    }

    $+l::{
        if (edit_mode){
            SendInput "+{Right}"
        }
        else{
            SendInput "+{l}"
        }
    }
    $l::{
        if (edit_mode){
            if GetKeyState("Shift"){
                SendInput "+{Right}"
            }
            else{
                SendInput "{Right}"
            }

        }
        else{
            SendInput "{l}"
        }
    }
    $+i::{
        if (edit_mode){
            if(vertical_buffer = 0 || vertical_buffer = 1){
                SendInput "+{Up}"
                global vertical_buffer := 0
            }
            else{
                Loop vertical_buffer{
                    Send "+{Up}"
                    Sleep 1
                }
                global vertical_buffer := 0
                MakeGui()
            }
        }
        else{
            SendInput "+{i}"
        }
    }
    $i::{
        if (edit_mode){
            if(vertical_buffer = 0 || vertical_buffer = 1){
                SendInput "{Up}"
                global vertical_buffer := 0
            }
            else{
                Loop vertical_buffer{
                    Send "{Up}"
                    Sleep 1
                }
                global vertical_buffer := 0
                MakeGui()
            }

        }
        else{
            SendInput "{i}"
        }

    }
    $+k::{
        if (edit_mode){
            if(vertical_buffer = 0 || vertical_buffer = 1){
                SendInput "+{Down}"
                global vertical_buffer := 0
            }
            else{
                Loop vertical_buffer{
                    Send "+{Down}"
                    Sleep 1
                }
                global vertical_buffer := 0
                MakeGui()
            }
        }
        else{
            SendInput "+{K}"
        }
    }
    $k::{
        if (edit_mode){
            if(vertical_buffer = 0 || vertical_buffer = 1){
                SendInput "{Down}"
                global vertical_buffer := 0
            }
            else{
                SendInput "{Down}"
                Loop vertical_buffer{
                    Send "{Down}"
                    Sleep 1
                }
                global vertical_buffer := 0
                MakeGui()
            }
        }
        else{
            SendInput "{k}"
        }
    }

    $+n::{
        if (edit_mode){
            SendInput "^+{Left}"
        }
        else{
            SendInput "+{n}"
        }
    }
    $n::{
        if (edit_mode){
            SendInput "^{Left}"
        }
        else{
            SendInput "{n}"
        }
    }
    $+m::{
        if (edit_mode){
            SendInput "^+{Right}"
        }
        else{
            SendInput "+{m}"
        }
    }
    $m::{
        if (edit_mode){
            SendInput "^{Right}"
        }
        else{
            SendInput "{m}"
        }
    }

    $o::{
        if (edit_mode){
            SendInput "{Delete}"
        }
        else{
            SendInput "{o}"
        }
    }

    $u::{
        if (edit_mode){
            SendInput "{Backspace}"
        }
        else{
            SendInput "{u}"
        }
    }
    $`;::{
        if (edit_mode){
            SendInput "^{Delete}"
        }
        else{
            SendInput "{;}"
        }
    }
    $h::{
        if (edit_mode){
            SendInput "^{Backspace}"
        }
        else{
            SendInput "{h}"
        }
    }
    $,::{
        if (edit_mode){
            SendInput "{Home}"
        }
        else{
            SendInput "{,}"
        }
    }
    $.::{
        if (edit_mode){
            SendInput "{End}"
        }
        else{
            SendInput "{.}"
        }
    }
    $f::{
        if (edit_mode){
            SendInput "^{f}"
            global edit_mode := False
            MakeGui()
        }
        else{
            SendInput "{f}"
        }
    }

    $z::{
        if (edit_mode){
            SendInput "^{z}"
        }
        else{
            SendInput "{z}"
        }
    }

    $y::{
        if (edit_mode){
            SendInput "^y"
        }
        else{
            SendInput "{y}"
        }
    }

    $a::{
        if (edit_mode){
            SendInput "^a"
        }
        else{
            SendInput "{a}"
        }
    }

    $s::{
        if (edit_mode){
            SendInput "^s"
        }
        else{
            SendInput "{s}"
        }
    }

    $c::{
        if (edit_mode){
            SendInput "^c"
        }
        else{
            SendInput "{c}"
        }
    }

    $v::{
        if (edit_mode){
            SendInput "^v"
        }
        else{
            SendInput "{v}"
        }
    }

    $b::{
        if (edit_mode){
            SendInput "#v"
        }
        else{
            SendInput "{b}"
        }
    }

    $x::{
        if (edit_mode){
            SendInput "^x"
        }
        else{
            SendInput "{x}"
        }
    }

    !e::Run "Explorer" ; Alt+E opens File Explorer.
    !r::Run "Notepad" ; Alt+R opens Notepad.
    !ESC::!f4 ; Alt+Esc sends the Alt+F4 key combination.
    !/::^/		 ; Comments out line in normal IDEs, *Chough*, *Cough* VS
    !q::Run "C:\Program Files\Mozilla Firefox\firefox.exe https://excalidraw.com/"

    ^,::+Home
    ^.::+End

    Control::{
    if(guiShown) {
        if(edit_mode){
            global vertical_buffer := 0
            MakeGui()
        }
    }
}

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

$1::{
    if (edit_mode){
        AddToVBuffer(1)
    }
    else{
        SendInput "{1}"
    }
}
$2::{
    if (edit_mode){
        AddToVBuffer(2)
    }
    else{
        SendInput "{2}"
    }
}
$3::{
    if (edit_mode){
        AddToVBuffer(3)
    }
    else{
        SendInput "{3}"
    }
}
$4::{
    if (edit_mode){
        AddToVBuffer(4)
    }
    else{
        SendInput "{4}"
    }
}
$5::{
    if (edit_mode){
        AddToVBuffer(5)
    }
    else{
        SendInput "{5}"
    }
}
$6::{
    if (edit_mode){
        AddToVBuffer(10)
    }
    else{
        SendInput "{6}"
    }
}
$7::{
    if (edit_mode){
        AddToVBuffer(15)
    }
    else{
        SendInput "{7}"
    }
}
$8::{
    if (edit_mode){
        SendInput "{PgDn}"
    }
    else{
        SendInput "{8}"
    }
}
$9::{
    if (edit_mode){
        SendInput "{PgUp}"
    }
    else{
        SendInput "{9}"
    }
}
AddToVBuffer(Count){
    global vertical_buffer := vertical_buffer + Count

    MakeGui()
}

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

        newPath := "`"" StrReplace(finalStr, "\", "/") "`""

        finalCmd := "C:\\WINDOWS\\system32\\cmd.exe /K cd " . newPath

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

