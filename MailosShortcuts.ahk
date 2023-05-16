!j::Left           ; Alt+J sends the Left arrow key.
!l::Right          ; Alt+L sends the Right arrow key.
!i::Up             ; Alt+I sends the Up arrow key.
!k::Down           ; Alt+K sends the Down arrow key.
!n::^Left          ; Alt+N sends the Ctrl+Left arrow key combination.
!m::^Right         ; Alt+M sends the Ctrl+Right arrow key combination.
!o::Delete         ; Alt+O sends the Delete key.
!u::Backspace      ; Alt+U sends the Backspace key.
!;::^Delete        ; Alt+; sends the Ctrl+Delete key combination.
!h::^Backspace     ; Alt+H sends the Ctrl+Backspace key combination.
!,::Home           ; Alt+, sends the Home key.
!.::End            ; Alt+. sends the End key.
!f::^f		 ; ALT+F sends search.
!z::^z             ; Alt+Z sends the Ctrl+Z key combination.
!y::^y             ; Alt+Y sends the Ctrl+Y key combination.
!a::^a             ; Alt+A sends the Ctrl+A key combination.
!s::^s             ; Alt+S sends the Ctrl+S key combination.
!c::^c             ; Alt+C sends the Ctrl+C key combination.
!v::^v             ; Alt+V sends the Ctrl+V key combination.
!b::#v
!x::^x             ; Alt+X sends the Ctrl+X key combination.
!e::Run "Explorer" ; Alt+E opens File Explorer.
!r::Run "Notepad"  ; Alt+R opens Notepad.
!t::Run "C:\WINDOWS\system32\cmd.exe" ; Alt+T opens a Command Prompt window in the C:\ directory.
!ESC::!f4          ; Alt+Esc sends the Alt+F4 key combination.
!/::^/		 ; Comments out line in normal IDEs, *Chough*, *Cough* VS
!q::Run "C:\Program Files\Mozilla Firefox\firefox.exe https://excalidraw.com/"
;#!i::{
;Loop 3
;	{
;	   Send "{Up}"
;	}
;}
;#!k::{
;Loop 3
;{
;Send "{Down}"
;}
;}

;These work, now try doing vim-like controls, with ![NUMBER][S/W]

;!w::{
;Send "{Up, 3}"
;!s::{
;	Loop 3
;	{
;	   Send "{Down}"
;	}
;}
