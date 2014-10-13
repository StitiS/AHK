;*******************************************************************************
; Sec-Table of Contents
;*******************************************************************************
; Sec-Initial Commands
; Sec-Variables
; Sec-Sandbox
; Sec-Clear Keys
; Sec-Posture Reminder
; Sec-Reload Script
; Sec-Show Crosshair
; Sec-Command Recall
; Sec-Suspend Hotkeys
; Sec-Record Macro Mode
; Sec-Allegro Specific Shortcut Mode
; Sec-Caps Lock Toggle
; Sec-F Key Combos
; Sec-F1 Override - Snips / My Documents
; Sec-F2 Override - Expendables / My Pictures
; Sec-F3 Override - Predator / My Music
; Sec-F4 Override - Datasheets
; Sec-F5 Override - SkyDrive
; Sec-F6 Override - RAMDisk
; Sec-F9 Override - Paint
; Sec-F10 Override - Calculator
; Sec-F11 Override - Playlist Play/Pause
; Sec-F12 Override - Playlist Next
; Sec-Tilde Override - ClearKeys
; Sec-Mouse Gestures
; Sec-Window Halfing + Extras
; Sec-Window Move
; Sec-Easy Window Move/Resize - Mouse Jumps to Borders
; Sec-Google Search
; Sec-New Email / New Task
; Sec-Open Inbox, Double Tap = Calendar
; Sec-Reply in Outlook
; Sec-Paste in Paint
; Sec-Mouse Speed Adjustment
; Sec-Mouse Scrolling
; Sec-Transparency
; Sec-Text Replacements
; Sec-Key Remaps
; Sec-Minimize
; Sec-Key Commands
; Sec-Functions

;*******************************************************************************
; Sec-Initial Commands
;*******************************************************************************
WinSet, Transparent, off, ahk_class Shell_TrayWnd
#UseHook Off
#SingleInstance force
#Persistent
#MaxHotkeysPerInterval 200
#WinActivateForce
SetKeyDelay, 0
clearKeys()
SetWinDelay,0
SetTitleMatchMode, 2
SetTitleMatchMode, Fast

Menu, Tray, Icon , %A_AhkPath%, 1, 1
WinSet, Transparent, 220, ahk_class Shell_TrayWnd
;Hotkey, % "Insert", Off

;*******************************************************************************
; Sec-Variables
;*******************************************************************************
ToolTip
allegroLayer      = 0       ; Tracks the current Allegro layer
delayTime         = .15     ; time to wait for double taps
doubleCaps        := false  ; if CapsLock has been pressed quickly twice
exitCond          =         ; condition an input command exited
focusWheelEn      := false  ; enables the mouse wheel sending to focussed control
isSuspend         = 0       ; hotkeys suspended
downPressed       = 0       ; captures key pressed
leftPressed       = 0       ; captures key press
rightPressed      = 0       ; captures key press
upPressed         = 0       ; captures key press
previouslyActive  = false   ; refers to whether [Outlook] was previously active
shiftAmt          = 3       ; amount to shift the cursor from the border for rs
TransP            = Off     ; transparency value1
pvParam           = 0       ; variable used in DllCalls
SPI_GETMOUSESPEED = 112     ; SystemParametersInfo
SPI_SETMOUSESPEED = 113     ; SystemParametersInfo
macroString       =         ; Records the macro string
appendString      =         ; Records the macro string
winCounter        = 3       ; cycle the window move
winRSMoveEn       := false  ; enables the Windows move/resize instead of jump
clipboardMain     =         ;
clipboardBack     =         ;
mouseX            =         ; storage of X position for relative measurements
mouseY            =         ; storage of Y position for relative measurements
deltaX            =         ; storage of X position for relative measurements
deltaY            =         ; storage of Y position for relative measurements
moveAmt           = 150     ; minimum distance mouse moves for window move
mouseGest         = 1       ; mouse gestures default on
cmdRcl            =         ; command read from commandList.txt
cmdItr            =         ; command read from commandList.txt
apndString        =         ; command read from commandList.txt
cmdAryCnt         = 0
rdLine            =         ; line to read from commandList.txt
i                 = 1       ; Loop counter

if(computername="Jumoe-W7") {
  ; Loop {
     ; if (A_Min == 0 || A_Min == 15 || A_Min == 30 || A_Min == 45) {
         ; TrayTip, Posture Up!, Feeling better?, 30
         ; SoundBeep, 250, 500
         SetTimer Reminder, 900000
         ; SoundBeep, 250, 500
         return
     ; }
     ; sleep 60000
  ; }
  ; return
}

;*******************************************************************************
; Sec-Sandbox
;*******************************************************************************
; Escape & F1::

; return

;*******************************************************************************
; Sec-Clear Keys
;*******************************************************************************
clearKeys(){
   SetCapsLockState,   AlwaysOff
   SetScrollLockState, AlwaysOff
   SendInput {LCtrl Up}
   SendInput {LWin Up}
   SendInput {LShift Up}
   SendInput {LAlt Up}
   SoundBeep, 800, 250
   return
}

;*******************************************************************************
; Sec-Posture Reminder
;*******************************************************************************
Reminder:
  TrayTip, Posture Up!, Feeling better?, 30
  SoundBeep, 250, 500
  SoundBeep, 250, 500
return

;*******************************************************************************
; Sec-Reload Script
;*******************************************************************************
CapsLock & RCtrl::
   Reload
return

;*******************************************************************************
; Sec-Show Crosshair
;*******************************************************************************
; CapsLock & LCtrl::
   ; CoordMode, Mouse, Screen
   ; MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   ; deltaX := KDE_X1 - 256
   ; deltaY := KDE_Y1 - 256
   ; Gui, Color, ffffff
   ; Gui, +LastFound +ToolWindow +AlwaysOnTop -Caption
   ; WinSet, TransColor, ffffff
   ; Gui, Add, Picture, h-1, %A_ScriptDir%\crosshair.png
   ; Gui, Show, NoActivate x%deltaX% y%deltaY% 
   ; sleep 50
   ; WinSet, TransColor, ffffff 200
   ; sleep 50
   ; WinSet, TransColor, ffffff 150
   ; sleep 50
   ; WinSet, TransColor, ffffff 100
   ; sleep 50
   ; WinSet, TransColor, ffffff 0
   ; Gui, Destroy
   ; CoordMode, Mouse, Window
; return


;*******************************************************************************
; Sec-Suspend Hotkeys
;*******************************************************************************
CapsLock & RSHIFT::
   Suspend
   if (isSuspend) {
      SoundBeep, 250, 100
      SoundBeep, 300, 100
      Menu, Tray, Icon , %A_AhkPath%, 1, 1
      isSuspend = 0
   }
   else{
      SoundBeep, 300, 100
      SoundBeep, 250, 100
      Menu, Tray, Icon , %A_AhkPath%, 1, 2
      isSuspend = 1
   }
return

;*******************************************************************************
; Sec-Test
;*******************************************************************************
CapsLock & F2::
   while (1) {
   SendInput, {LButton}
   sleep 500
   SendInput, {LButton}
   sleep 20000
   }
return


;*******************************************************************************
; Sec-Command Recall - Types the associated command from commandList.txt
;*******************************************************************************
CapsLock & Enter::
   cmdRcl =
   (
   ++++++++++++++++++++++++++++++ Command List ++++++++++++++++++++++++++++++
   "Enter" - CANCEL
   "a" - Add Clipboard to list, can specify line number with a#
   "d" - Delete last item, can specify line number with d#
   "#Enter" - Send the respective line
   "#Shift" - Copy the respective line to the Clipboard
   )
   cmdItr    =
   cmdAryCnt = 0
   ; Read through the file and number the commands
   Loop, read, %A_ScriptDir%\commandList.txt
   {
      cmdItr := cmdItr . A_LoopReadLine . "`n"
      regMatch := RegExMatch(cmdItr, "<START>`n(.*)`n<END>", SubPat)
      if (regMatch > 0) {
         cmdAry%i% := SubPat1
         cmdAryCnt += 1
         i++
         cmdItr =
      }
   }

   ; Print the commands for the user to reference
   cmdTemp := Clipboard
   cmdRcl := cmdRcl . "`n`nClipboard`n" . SubStr(cmdTemp, 1, 50) . "`n`n"
   Loop %cmdAryCnt% {
      ; Determine whether to copy paragraphs to the clipboard or type them out
      ; Paragraphs are denoted with a *
      StringReplace, cmdItr, cmdAry%A_Index%, `n, " ", All
      if (!ErrorLevel)
         cmdRcl := cmdRcl . A_Index . "* - " . SubStr(cmdItr, 1, 75) . "`n"
      else
         cmdRcl := cmdRcl . A_Index . " - " . SubStr(cmdItr, 1, 75) . "`n"
   }
   ErrorLevel := 0
   ToolTip % cmdRcl

   ; Wait for the user to enter an option then type <Enter>
   while (ErrorLevel == "" or ErrorLevel == 0 or ErrorLevel == "Match") {
      Input, keyPress, T30,{Enter}cvy,0,1,2,3,4,5,6,7,8,9,a,d
      rdLine := rdLine . keyPress
      exitCond := ErrorLevel
   }
   ToolTip

   ; Perform the option the user specified
   ; Add line at end or at line number
   if (InStr(rdLine, "a")) {
      rdLine := SubStr(rdLine, 2)
      if (rdLine ==  "")
         FileAppend, <START>`n%cmdTemp%`n<END>`n, %A_ScriptDir%\commandList.txt
      else {
         FileDelete, %A_ScriptDir%\commandList.txt
         Loop %cmdAryCnt% {
            if (A_Index != rdLine) {
               apndString := cmdAry%A_Index%
               FileAppend, <START>`n%apndString%`n<END>`n, %A_ScriptDir%\commandList.txt
            }
            else {
               FileAppend, <START>`n%cmdTemp%`n<END>`n, %A_ScriptDir%\commandList.txt
               apndString := cmdAry%A_Index%
               FileAppend, <START>`n%apndString%`n<END>`n, %A_ScriptDir%\commandList.txt
            }
         }
      }
   }
   ; Delete line at end or at line number
   else if (InStr(rdLine, "d")) {
      FileDelete, %A_ScriptDir%\commandList.txt
      rdLine := SubStr(rdLine, 2)
      if (rdLine ==  "")
         rdLine := cmdAryCnt
      Loop %cmdAryCnt% {
         if (A_Index != rdLine) {
            apndString := cmdAry%A_Index%
            FileAppend, <START>`n%apndString%`n<END>`n, %A_ScriptDir%\commandList.txt
         }
      }
   }
   ; Send line number or copy it to the clipboard
   else if (rdLine <= i && rdLine != 0) {
      ; Determine what to do, type, copy to clipboard, or paste
      if (InStr(exitCond, "Enter") > 0)
         SendRaw % cmdAry%rdLine%
      else if (InStr(exitCond, "c"))
         Clipboard := cmdAry%rdLine%
      else if (InStr(exitCond, "v")) {
         Clipboard := cmdAry%rdLine%
         SendInput ^v
      }
      else if (InStr(exitCond, "y")) {
         Clipboard := cmdAry%rdLine%
         SendInput ^y
      }
   }
   i = 1
   rdLine =
return

;*******************************************************************************
; Sec-Record Macro Mode
;*******************************************************************************
; F7 x2 turns on the recording by generating a list of hotkeys in two areas,
;   one for keys that don't require brackets, and one the other for keys that
;   do
; F8 x2 launches process ClearKeys which clears the hotkey list, and enables
;   the Insert hotkey which will insert macros
;*******************************************************************************
$F7::
   KeyWait, F7
   KeyWait, F7, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F7}
   else
   {
      macroString =
      KeyWait, F7, U, T%delayTime%
      ToolTip Macro Record On
      Loop, 0x7f
         Hotkey, % "*~" . chr(A_Index), LogKey, T1 On
      Hotkey, % "*~Left",    LogKeyB,  T1 On
      Hotkey, % "*~Right",   LogKeyB,  T1 On
      Hotkey, % "*~Up",      LogKeyB,  T1 On
      Hotkey, % "*~Down",    LogKeyB,  T1 On
      Hotkey, % "*~SC027",   LogKeyB,  T1 On
      Hotkey, % "*~Delete",  LogKeyB,  T1 On
      Hotkey, % "*~Home",    LogKeyB,  T1 On
      Hotkey, % "*~End",     LogKeyB,  T1 On
      Hotkey, % "*~Space",   LogKeyB,  T1 On
      Hotkey, % "*~Tab",     LogKeyB,  T1 On
      Hotkey, % "*~PgUp",    LogKeyB,  T1 On
      Hotkey, % "*~PgDn",    LogKeyB,  T1 On
      Hotkey, % "*~LButton", LogMouse, T1 On
   }
return

F7 & F8::
   mcrRcl =
   (
   ++++++++++++++++++++++++++++++ Macro List ++++++++++++++++++++++++++++++
   "Enter" - CANCEL
   "a" - Add Clipboard to list, can specify line number with a#
   "d" - Delete last item, can specify line number with d#
   "#Enter" - Load the respective line
   )
   cmdItr    =
   cmdAryCnt = 0
   ; Read through the file and number the commands
   Loop, read, %A_ScriptDir%\macroList.txt
   {
      cmdItr := cmdItr . A_LoopReadLine . "`n"
      regMatch := RegExMatch(cmdItr, "<START>`n(.*)`n<END>", SubPat)
      if (regMatch > 0) {
         cmdAry%i% := SubPat1
         cmdAryCnt += 1
         i++
         cmdItr =
      }
   }

   ; Print the commands for the user to reference
   cmdTemp := macroString
   mcrRcl := mcrRcl . "`n`nMacro String`n" . SubStr(cmdTemp, 1, 50) . "`n`n"
   Loop %cmdAryCnt% {
         mcrRcl := mcrRcl . A_Index . " - " . SubStr(cmdAry%A_Index%, 1, 50) . "`n"
   }
   ErrorLevel := 0
   ToolTip % mcrRcl
   
   ; Wait for the user to enter an option then type <Enter>
   while (ErrorLevel == "" or ErrorLevel == 0 or ErrorLevel == "Match") {
      Input, keyPress, T30,{Enter},0,1,2,3,4,5,6,7,8,9,a,d
      rdLine := rdLine . keyPress
      exitCond := ErrorLevel
   }
   ToolTip
   
   ; Perform the option the user specified
   ; Add line at end or at line number
   if (InStr(rdLine, "a")) {
      rdLine := SubStr(rdLine, 2)
      if (rdLine ==  "")
         FileAppend, <START>`n%cmdTemp%`n<END>`n, %A_ScriptDir%\macroList.txt
      else {
         FileDelete, %A_ScriptDir%\macroList.txt
         Loop %cmdAryCnt% {
            if (A_Index != rdLine) {
               apndString := cmdAry%A_Index%
               FileAppend, <START>`n%apndString%`n<END>`n, %A_ScriptDir%\macroList.txt
            }
            else {
               FileAppend, <START>`n%cmdTemp%`n<END>`n, %A_ScriptDir%\macroList.txt
               apndString := cmdAry%A_Index%
               FileAppend, <START>`n%apndString%`n<END>`n, %A_ScriptDir%\macroList.txt
            }
         }
      }
   }
   ; Delete line at end or at line number
   else if (InStr(rdLine, "d")) {
      FileDelete, %A_ScriptDir%\macroList.txt
      rdLine := SubStr(rdLine, 2)
      if (rdLine ==  "")
         rdLine := cmdAryCnt
      Loop %cmdAryCnt% {
         if (A_Index != rdLine) {
            apndString := cmdAry%A_Index%
            FileAppend, <START>`n%apndString%`n<END>`n, %A_ScriptDir%\macroList.txt
         }
      }
   }
   ; Send line number or copy it to the clipboard
   else if (rdLine <= i && rdLine != 0) {
      macroString := cmdAry%rdLine%
   }
   i      = 1
   mcrRcl =
   rdLine =
return

$F8::
   KeyWait, F8
   KeyWait, F8, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F8}
   else {
      if !macroString
         return
      GoTo ClearKeys
   }
return

; Play macro string, look for #,#,#,# for sending mouse clicks
CapsLock & SC029::
   CoordMode, Mouse, Screen
   Loop, Parse, macroString, |,
   {
      if not(InStr(A_LoopField, ",", false, 1, 2)) {
         SendInput, %A_LoopField%
         sleep 20
      }
      else {
         sleep 50
         StringSplit, word_array, A_LoopField, `,
         Click down %word_array1%, %word_array2%
         sleep 50
         Click up %word_array3%, %word_array4%
      }
   }
   CoordMode, Mouse, Window
return

LogKey:
   StringTrimLeft, appendString, A_ThisHotkey, 2
   StringLower, appendString, appendString
   if GetKeyState("LControl", "D")
      macroString := macroString . "^"
   if GetKeyState("LShift", "D")
      macroString := macroString . "+"
   if GetKeyState("LAlt", "D")
      macroString := macroString . "!"
   macroString := macroString . appendString
   macroString := macroString . "|"
   ToolTip %macroString%
return

;Same as LogKey, but adds the brackets for special keys
LogKeyB:
   StringTrimLeft, appendString, A_ThisHotkey, 2
   StringLower, appendString, appendString
   appendString := "{" . appendString
   appendString := appendString . "}"
   if GetKeyState("LControl", "D")
      macroString := macroString . "^"
   if GetKeyState("LShift", "D")
      macroString := macroString . "+"
   if GetKeyState("LAlt", "D")
      macroString := macroString . "!"
   macroString := macroString . appendString
   macroString := macroString . "|"
   ToolTip %macroString%
return

LogMouse:
   CoordMode, Mouse, Screen
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   mouseX := KDE_X1
   mouseY := KDE_Y1
   KeyWait LButton
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   deltaX := KDE_X1 - mouseX
   deltaY :=  mouseY - KDE_Y1
   macroString := macroString . mouseX . "," . mouseY . "," . KDE_X1 . "," . KDE_Y1 . "|"
   ToolTip %macroString%
   CoordMode, Mouse, Window
return

ClearKeys:
   Loop, 0x7f
      Hotkey, % "*~" . chr(A_Index), Off
   Hotkey, % "*~Left",    Off
   Hotkey, % "*~Right",   Off
   Hotkey, % "*~Up",      Off
   Hotkey, % "*~Down",    Off
   Hotkey, % "*~SC027",   Off
   Hotkey, % "*~Delete",  Off
   Hotkey, % "*~Home",    Off
   Hotkey, % "*~End",     Off
   Hotkey, % "*~Space",   Off
   Hotkey, % "*~Tab",     Off
   Hotkey, % "*~PgUp",     Off
   Hotkey, % "*~PgDn",     Off
   Hotkey, % "*~LButton", Off
   ToolTip
return

;*******************************************************************************
; Sec-Caps Lock Toggle
;*******************************************************************************
CapsLock::
if (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < (delayTime * 1500))
{
   doubleCaps := true
   ToolTip DoubleCaps
   SetTimer resetDoubleCaps, 750
}
return

resetDoubleCaps:
   SetTimer, resetDoubleCaps, Off
   ToolTip
   doubleCaps := false
return

;*******************************************************************************
; Sec-F Key Combos
;*******************************************************************************
F1 & F2::
   run \\sjc20-emc06c\projects\ng3k-hw\NG3K_Home\Production\gladiator\boards\Schrodinger
return

F2 & F3::
   run \\sjc20-emc06c\projects\ng3k-hw\NG3K_Home\Production\gladiator\docs\datasheets
return

F5 & F6::
   run %skyDrive%\Documents\Work\Schematics
return

F5 & F7::
   run %skyDrive%\Documents\Work\Layouts
return

;*******************************************************************************
; Sec-F1 Override - Snips / My Documents
;*******************************************************************************
$F1::
   if(computername="jumoe-w7" || computername="jumoe-w7v2")
   {
      KeyWait, F1
      KeyWait, F1, D, T%delayTime%
      if ErrorLevel=1
         SendInput, {F1}
      else
         run \\Sjc5-emc04a\projects\gsg-hw4\system\stackables\predatorCR\
   }
   else if (computername="THESYS")
   {
      KeyWait, F1
      KeyWait, F1, D, T%delayTime%
      if ErrorLevel=1
         SendInput, {F1}
      else
         run F:\My Documents
   }
   else
      SendInput, {F1}
return

;*******************************************************************************
; Sec-F2 Override - Expendables, Gladiator / My Pictures
;*******************************************************************************
*F2::  ; has to be *F2 so that F2 is recognized with CTRL and ALT for N++
   if(computername="jumoe-w7" || computername="jumoe-w7v2") {
      KeyWait, F2
      KeyWait, F2, D, T%delayTime%
      if ErrorLevel=1
         SendInput, {Blind}{F2}
      else {
         KeyWait, F2
         KeyWait, F2, D, T%delayTime%
         if ErrorLevel=1
            run \\sjc20-emc06c\projects\ng3k-hw\NG3K_Home\Production\gladiator\boards\Fibonacci
         else
            run \\Sjc5-emc04a\projects\gsg-hw4\system\stackables\predatorCR\boards\module\expendables
      }
   }
   else if (computername="THESYS") {
      KeyWait, F2
      KeyWait, F2, D, T%delayTime%
      if ErrorLevel=1
         SendInput, {Blind}{F2}
      else
         run I:\Pictures
   }
   else
      SendInput, {Blind}{F2}
return

;*******************************************************************************
; F3 Override - Snips
;*******************************************************************************
$F3::
if(computername="jumoe-w7" || computername="jumoe-w7v2" || computername="THESYS")
{
   KeyWait, F3
   KeyWait, F3, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F3}
   else
      run \\sjc5-netapp22b\workspace\wslocal22\jumoe\snips
}
else
   SendInput, {F3}
return

;*******************************************************************************
; Sec-F4 Override - Datasheets
;*******************************************************************************
$F4::
if(computername="jumoe-w7" || computername="jumoe-w7v2")
{
   KeyWait, F4
   KeyWait, F4, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F4}
   else
      run \\Sjc5-emc04a\projects\gsg-hw4\system\stackables\predatorCR\docs\Datasheets
}
else if (computername="THESYS")
{
   KeyWait, F4
   KeyWait, F4, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F4}
   else
      run \\sjc5-netapp22b\workspace\wslocal22\jumoe\snips
}
else
   SendInput, {F4}
return

;*******************************************************************************
; Sec-F5 Override - SkyDrive
;*******************************************************************************
;User Variable SKYDRIVE F:\My Documents\SkyDrive
$F5::
   KeyWait, F5
   KeyWait, F5, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F5}
   else {
      KeyWait, F5
      KeyWait, F5, D, T%delayTime%
      if ErrorLevel=1
         Run %skyDrive%\Documents\Work
      else
         Run %skyDrive%\Documents\Work\Schematics
   }
return

;*******************************************************************************
; Sec-F6 Override - RAMDisk
;*******************************************************************************
;User Variable RAMDISK F:
$F6::
   KeyWait, F6
   KeyWait, F6, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F6}
   else
   {
      if (computername="jumoe-w7v2")
         Run C:\Users\jumoe\Documents
      else if (computername="jumoe-w7")
         Run F:\
      else if (computername="thesys")
         Run Q:\
      else
         return
   }
return

;*******************************************************************************
; Sec-F9 Override - Paint
;*******************************************************************************
$F9::
   KeyWait, F9
   KeyWait, F9, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F9}
   else
      Run %windir%\system32\mspaint.exe
return

;*******************************************************************************
; Sec-F10 Override - Calculator
;*******************************************************************************
$F10::
   KeyWait, F10
   KeyWait, F10, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F10}
   else
      Run %windir%\system32\calc.exe
return

;*******************************************************************************
; Sec-F11 Override - Playlist Play/Pause
;*******************************************************************************
$F11::
   KeyWait, F11
   KeyWait, F11, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F11}
   else
      SendInput, {Media_Play_Pause}
return

;*******************************************************************************
; Sec-F12 Override - Playlist Next
;*******************************************************************************
$F12::
   KeyWait, F12
   KeyWait, F12, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {F12}
   else
      SendInput, {Media_Next}
return

;*******************************************************************************
; Sec-Tilde Override - ClearKeys
;*******************************************************************************
; SC029::  ; tilde
   ; KeyWait, SC029
   ; KeyWait, SC029, D, T.08
   ; if ErrorLevel=1
      ; SendInput, {SC029}
   ; else{
      ; clearKeys()
   ; }
; return

;*******************************************************************************
; Sec-Mouse Gestures
;*******************************************************************************
CapsLock & MButton::
   CoordMode, Mouse, Screen
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   mouseX := KDE_X1
   mouseY := KDE_Y1
   KeyWait MButton
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   deltaX := KDE_X1 - mouseX
   deltaY :=  mouseY - KDE_Y1
   if (deltaX == 0)
      deltaX = 1
   if (deltaY == 0)
      deltaY = 1
   if (abs(deltaX) > 25 || abs(deltaY) > 25) {
      angle  := abs(deltaX / deltaY)
      if (angle > 2)
         if (deltaX > 1)                        ; Right
            SendInput, {Blind}{Right}
         else                                   ; Left
            SendInput, {Blind}{Left}
      else if (angle < .5)
         if (deltaY > 1)                        ; Up
            SendInput, {Blind}{Up}
         else                                   ; Down
            SendInput, {Blind}{Down}
      else
         if (deltaX > 0 && deltaY > 0)          ; Diagonal Up Right
            SendInput, #=
         else if (deltaX < 0 && deltaY > 0)     ; Diagonal Up Left
            SendInput, #-
         else if (deltaX > 0 && deltaY < 0)     ; Diagonal Down Right
            SendInput, {Blind}{MButton}
         else
            SendInput, {Blind}{MButton}         ; Diagonal Down Left

      ;ToolTip, %deltaX% %deltaY% %angle%
      CoordMode, Mouse, Window
   }
   else {
      CoordMode, Mouse, Window
      Goto mButtonWinMove
   }
return

*MButton::
   CoordMode, Mouse, Screen
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   mouseX := KDE_X1
   mouseY := KDE_Y1
   KeyWait MButton
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   deltaX := KDE_X1 - mouseX
   deltaY :=  mouseY - KDE_Y1
   if (deltaX == 0)
      deltaX = 1
   if (deltaY == 0)
      deltaY = 1
   if (abs(deltaX) > 25 || abs(deltaY) > 25) {
      angle  := abs(deltaX / deltaY)
      if (angle > 2)
         if (deltaX > 1)                        ; Right
            SendInput, {Blind}{Delete}
         else                                   ; Left
            SendInput, {Blind}{Backspace}
      else if (angle < .5)
         if (deltaY > 1)                        ; Up
            SendInput, {Blind}{PgUp}
         else                                   ; Down
            SendInput, {Blind}{PgDn}
      else
         if (deltaX > 0 && deltaY > 0)          ; Diagonal Up Right
            SendInput, {Blind}{End}
         else if (deltaX < 0 && deltaY > 0)     ; Diagonal Up Left
            SendInput, {Blind}{Home}
         else if (deltaX > 0 && deltaY < 0)     ; Diagonal Down Right
            SendInput, {LWin down}{=}{LWin up}
         else                                   ; Diagonal Down Left
            SendInput, {LWin down}{- down}{- up}{LWin up}

      ;ToolTip, %deltaX% %deltaY% %angle%
      CoordMode, Mouse, Window
   }
   else {
      CoordMode, Mouse, Window
      SendInput, {MButton}
   }
return

;*******************************************************************************
; Sec-Window Halfing + Extras
;*******************************************************************************
CapsLock & SC027::  ;CapsLock & Semicolon
   WinGet, WinTitle, ID, A
   Send {LShift down}
   WinMaximize ahk_id %WinTitle%
   Send {LShift up}
   while (ErrorLevel == "" or ErrorLevel == 0 or ErrorLevel == "Match") {
      WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, ahk_id %WinTitle%
      WinSet, Transparent, 200, ahk_id %WinTitle%
      Input, keyPress, L1 T5,,h,j,k,l,m,a
      if keyPress = h
      {
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, %KDE_WinX1%, %KDE_WinY1%, (KDE_WinW)/2, %KDE_WinH%
      }
      else if keyPress = j
      {
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, %KDE_WinX1%, KDE_WinY1+KDE_WinH/2, %KDE_WinW%, KDE_WinH/2
      }
      else if keyPress = k
      {
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, %KDE_WinX1%, %KDE_WinY1%, %KDE_WinW%, KDE_WinH/2
      }
      else if keyPress = l
      {
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, KDE_WinX1+KDE_WinW/2, %KDE_WinY1%, KDE_WinW/2, %KDE_WinH%
      }
      else if keyPress = m
      {
         SendInput {LSHIFT down}{LWin down}{Right down}
         sleep 50
         SendInput {LSHIFT up}{LWin up}{Right up}
      }
      else if keyPress = a
      {
         WinGet, ExStyle, ExStyle, ahk_id %WinTitle%
         if (ExStyle & 0x8)  ; 0x8 is WS_EX_TOPMOST.
         {
            Winset, AlwaysOnTop, off, ahk_id %WinTitle%
         }
         else
         {
            WinSet, AlwaysOnTop, on, ahk_id %WinTitle%
         }
      }
   }
   WinSet, Transparent, off, ahk_id %WinTitle%
return

;**********Middle Mouse**********
#MButton::
   CoordMode, Mouse, Screen
   CoordMode, ToolTip, Screen
   WinGet, WinTitle, ID, A
   Send {LShift down}
   WinMaximize ahk_id %WinTitle%
   Send {LShift up}

   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   mouseX := KDE_X1
   mouseY := KDE_Y1
   ;ToolTip, Move, mouseX, mouseY - moveAmt, 1
   ;ToolTip, Move, mouseX, mouseY + moveAmt, 2
   ;ToolTip, Move, mouseX - moveAmt, mouseY, 3
   ;ToolTip, Move, mouseX + moveAmt, mouseY, 4
   while GetKeyState("LWin") {
      MouseGetPos,KDE_X1,KDE_Y1,KDE_id
      if ((KDE_X1 - mouseX) > moveAmt) {
         mouseX := KDE_X1
         WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, ahk_id %WinTitle%
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, KDE_WinX1+KDE_WinW/2, %KDE_WinY1%, KDE_WinW/2, %KDE_WinH%
         ;ToolTip, Move, mouseX, mouseY - moveAmt, 1
         ;ToolTip, Move, mouseX, mouseY + moveAmt, 2
         ;ToolTip, Move, mouseX - moveAmt, mouseY, 3
         ;ToolTip, Move, mouseX + moveAmt, mouseY, 4
      }
      else if ((KDE_X1 - mouseX) < (-moveAmt)) {
         mouseX := KDE_X1
         WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, ahk_id %WinTitle%
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, %KDE_WinX1%, %KDE_WinY1%, (KDE_WinW)/2, %KDE_WinH%
         ;ToolTip, Move, mouseX, mouseY - moveAmt, 1
         ;ToolTip, Move, mouseX, mouseY + moveAmt, 2
         ;ToolTip, Move, mouseX - moveAmt, mouseY, 3
         ;ToolTip, Move, mouseX + moveAmt, mouseY, 4
      }
      if ((mouseY - KDE_Y1) > moveAmt) {
         mouseY := KDE_Y1
         WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, ahk_id %WinTitle%
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, %KDE_WinX1%, %KDE_WinY1%, %KDE_WinW%, KDE_WinH/2
         ;ToolTip, Move, mouseX, mouseY - moveAmt, 1
         ;ToolTip, Move, mouseX, mouseY + moveAmt, 2
         ;ToolTip, Move, mouseX - moveAmt, mouseY, 3
         ;ToolTip, Move, mouseX + moveAmt, mouseY, 4
      }
      else if ((mouseY - KDE_Y1) < (-moveAmt)) {
         mouseY := KDE_Y1
         WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, ahk_id %WinTitle%
         WinRestore ahk_id %WinTitle%
         WinMove, ahk_id %WinTitle%,, %KDE_WinX1%, KDE_WinY1+KDE_WinH/2, %KDE_WinW%, KDE_WinH/2
         ;ToolTip, Move, mouseX, mouseY - moveAmt, 1
         ;ToolTip, Move, mouseX, mouseY + moveAmt, 2
         ;ToolTip, Move, mouseX - moveAmt, mouseY, 3
         ;ToolTip, Move, mouseX + moveAmt, mouseY, 4
      }
   }
   ToolTip, , , , 1
   ToolTip, , , , 2
   ToolTip, , , , 3
   ToolTip, , , , 4
   CoordMode, Mouse, Window
   CoordMode, ToolTip, Window
return

;*******************************************************************************
; Sec-Window Move
;*******************************************************************************
; First move is always to primary, use arrows or numpad
; If 2nd monitor exists, repeating moves to 2nd monitor
; Options to use MMB, numpad, period, or arrows
;*******************************************************************************
;**********Move Monitor**********
CapsLock & m::
   SendInput {LSHIFT down}{LWin down}{Right down}
   sleep 50
   SendInput {LSHIFT up}{LWin up}{Right up}
return

;**********Numpad**********
CapsLock & Numpad1::
   winCounter = 8
   SetTimer, ClearWinCounter, 0
return

CapsLock & Numpad2::
   winCounter = 5
   SetTimer, ClearWinCounter, 0
return

CapsLock & Numpad3::
   winCounter = 0
   SetTimer, ClearWinCounter, 0
return

CapsLock & Numpad4::
   winCounter = 2
   SetTimer, ClearWinCounter, 0
return

CapsLock & Numpad5::
   winCounter = 1
   SetTimer, ClearWinCounter, 0
return

CapsLock & Numpad6::
   winCounter = 3
   SetTimer, ClearWinCounter, 0
return
CapsLock & Numpad7::
   winCounter = 6
   SetTimer, ClearWinCounter, 0
return

CapsLock & Numpad8::
   winCounter = 4
   SetTimer, ClearWinCounter, 0
return

CapsLock & Numpad9::
   winCounter = 7
   SetTimer, ClearWinCounter, 0
return

;**********Arrows**********
CapsLock & Left::
   upPressed     := GetKeyState("Up", "P")
   downPressed   := GetKeyState("Down", "P")
   rightPressed  := GetKeyState("Right", "P")
   if (upPressed)
      winCounter = 6
   else if (downPressed)
      winCounter = 8
   else if (rightPressed)
      winCounter = 1
   else
      winCounter = 2
   SetTimer, ClearWinCounter, 50
return

CapsLock & Right::
   upPressed   := GetKeyState("Up", "P")
   downPressed := GetKeyState("Down", "P")
   leftPressed := GetKeyState("Left", "P")
   if (upPressed)
      winCounter = 7
   else if (downPressed)
      winCounter = 0
   else if (leftPressed)
      winCounter = 1
   else
      winCounter = 3
   SetTimer, ClearWinCounter, 50
return

CapsLock & Up::
   leftPressed   := GetKeyState("Left", "P")
   rightPressed  := GetKeyState("Right", "P")
   if (leftPressed)
      winCounter = 6
   else if (rightPressed)
      winCounter = 7
   else
      winCounter = 4
   SetTimer, ClearWinCounter, 50
return

CapsLock & Down::
   leftPressed   := GetKeyState("Left", "P")
   rightPressed  := GetKeyState("Right", "P")
   if (leftPressed)
      winCounter = 8
   else if (rightPressed)
      winCounter = 0
   else
      winCounter = 5
   SetTimer, ClearWinCounter, 50
return

;**********Middle Mouse Button**********
mButtonWinMove:
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%

   ; Get horizontal position
   if (KDE_X1 < KDE_WinW / 3)
      KDE_WinLeft := 1
   else if (KDE_X1 > 2 * KDE_WinW / 3)
      KDE_WinLeft := -1
   else
      KDE_WinLeft := 0

   ; Get vertical position
   if (KDE_Y1 < KDE_WinH / 3)
      KDE_WinUp := 1
   else if (KDE_Y1 > 2 * KDE_WinH / 3)
      KDE_WinUp := -1
   else
      KDE_WinUp := 0

   ; Position actions
   if (KDE_WinLeft == 1 && KDE_WinUp == 1)
      winCounter = 6
   else if (KDE_WinLeft == 1 && KDE_WinUp == -1)
      winCounter = 8
   else if (KDE_WinLeft == -1 && KDE_WinUp == 1)
      winCounter = 7
   else if (KDE_WinLeft == -1 && KDE_WinUp == -1)
      winCounter = 0
   else if (KDE_WinLeft == 0 && KDE_WinUp == -1)
      winCounter = 5
   else if (KDE_WinLeft == 0 && KDE_WinUp == 1)
      winCounter = 4
   else if (KDE_WinLeft == -1 && KDE_WinUp == 0)
      winCounter = 3
   else if (KDE_WinLeft == 1 && KDE_WinUp == 0)
      winCounter = 2
   else if (KDE_WinLeft == 0 && KDE_WinUp == 0)
      winCounter = 1
   SetTimer, ClearWinCounter, 0
return

;**********Move window around**********
ClearWinCounter:
   SetTimer, ClearWinCounter, Off
   WinGetActiveTitle, WinTitle
   SysGet, MonitorCount, MonitorCount
   WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, %WinTitle%
   currentMonitor := whichMon(KDE_WinX1 + KDE_WinW / 2, KDE_WinY1 + KDE_WinH / 2)
   if (WinCounterPrev == WinCounter)
      nextMonitor := mod(currentMonitor, MonitorCount) + 1
   else
      nextMonitor := currentMonitor
   SysGet, MonP, MonitorWorkArea, %nextMonitor%

   if (winCounter == 1){ ;toggle between Maximized and restored
      if (WinCounterPrev != 1){
         Send {LShift down}
         WinMaximize %WinTitle%
         Send {LShift up}
      }
      else{
         SendInput {LSHIFT down}{LWin down}{Right down}
         sleep 50
         SendInput {LSHIFT up}{LWin up}{Right up}
      }
;         WinGet, isMax, MinMax, %WinTitle%
;         if (isMax)
;            WinRestore %WinTitle%
;         else{
;            Send {LShift down}
;            WinMaximize %WinTitle%
;            Send {LShift up}
;         }
;      }
   }
   else
      WinRestore %WinTitle%  ;restore before moving

   if (winCounter == 2) ;left side
      WinMove, %WinTitle%,, %MonPLeft%, %MonPTop%, (MonPRight-MonPLeft)/2, (MonPBottom-MonPTop)
   else if (winCounter == 3) ;right side
      WinMove, %WinTitle%,, MonPLeft+(MonPRight-MonPLeft)/2, %MonPTop%, (MonPRight-MonPLeft)/2, (MonPBottom-MonPTop)
   else if (winCounter == 4) ;top side
      WinMove, %WinTitle%,, %MonPLeft%, %MonPTop%, (MonPRight-MonPLeft), (MonPBottom-MonPTop)/2
   else if (winCounter == 5) ;bottom side
      WinMove, %WinTitle%,, %MonPLeft%, (MonPBottom-MonPTop)/2+MonPTop, (MonPRight-MonPLeft), (MonPBottom-MonPTop)/2
   else if (winCounter == 6) ;top left
      WinMove, %WinTitle%,, %MonPLeft%, %MonPTop%, (MonPRight-MonPLeft)/2, (MonPBottom-MonPTop)/2
   else if (winCounter == 7) ;top right
      WinMove, %WinTitle%,, MonPLeft+(MonPRight-MonPLeft)/2, %MonPTop%, (MonPRight-MonPLeft)/2, (MonPBottom-MonPTop)/2
   else if (winCounter == 8) ;bottom left
      WinMove, %WinTitle%,, %MonPLeft%, (MonPBottom-MonPTop)/2+MonPTop, (MonPRight-MonPLeft)/2, (MonPBottom-MonPTop)/2
   else if (winCounter == 0) ;bottom right
      WinMove, %WinTitle%,, MonPLeft+(MonPRight-MonPLeft)/2, (MonPBottom-MonPTop)/2+MonPTop, (MonPRight-MonPLeft)/2, (MonPBottom-MonPTop)/2
   WinCounterPrev = %WinCounter%
   SetTimer ClearWinCounterPrev, 1000
   ToolTip
   WinCounter = 3 ;default state so next state is maximize
return

ClearWinCounterPrev:
   SetTimer, ClearWinCounterPrev, Off
   WinCounterPrev = ""
return

;*******************************************************************************
; Sec-Easy Window Move/Resize - Mouse Jumps to Borders
;*******************************************************************************
#InputLevel 1 ;prevents this from being triggered by other hotkeys
CapsLock & RButton::
   if (A_PriorHotKey == "CapsLock" and A_TimeSincePriorHotkey < (delayTime * 2000)) {
      if (winRSMoveEn)
         winRSMoveEn := false
      else
         winRSMoveEn := true
      ToolTip Windows Resize Enable %winRSMoveEn%
      return
   }
   MouseGetPos,KDE_X1,KDE_Y1,KDE_id
   WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
   If KDE_Win
       return
   WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%

   ; Get horizontal position
   if (KDE_X1 < KDE_WinW / 3)
      KDE_WinLeft := 1
   else if (KDE_X1 > 2 * KDE_WinW / 3)
      KDE_WinLeft := -1
   else
      KDE_WinLeft := 0

   ; Get vertical position
   if (KDE_Y1 < KDE_WinH / 3)
      KDE_WinUp := 1
   else if (KDE_Y1 > 2 * KDE_WinH / 3)
      KDE_WinUp := -1
   else
      KDE_WinUp := 0

   if (!winRSMoveEn) {
      ; Position actions
      if (KDE_WinLeft == 1 && KDE_WinUp == 1)
         MouseMove 5, 5, 0
      else if (KDE_WinLeft == 1 && KDE_WinUp == -1)
         MouseMove %shiftAmt%, KDE_WinH - shiftAmt, 0
      else if (KDE_WinLeft == -1 && KDE_WinUp == 1)
         MouseMove KDE_WinW - shiftAmt, %shiftAmt%, 0
      else if (KDE_WinLeft == -1 && KDE_WinUp == -1)
         MouseMove KDE_WinW - shiftAmt, KDE_WinH - 5, 0
      else if (KDE_WinLeft == 0 && KDE_WinUp == -1)
         MouseMove KDE_WinW / 2, KDE_WinH - shiftAmt, 0
      else if (KDE_WinLeft == 0 && KDE_WinUp == 1)
        MouseMove KDE_WinW / 2, %shiftAmt%, 0
      else if (KDE_WinLeft == -1 && KDE_WinUp == 0)
         MouseMove KDE_WinW - shiftAmt, KDE_WinH / 2, 0
      else if (KDE_WinLeft == 1 && KDE_WinUp == 0)
         MouseMove 5, KDE_WinH / 2, 0
      else if (KDE_WinLeft == 0 && KDE_WinUp == 0)
         MouseMove KDE_WinW / 2, 15, 0

      SendInput, {LButton Down}
      KeyWait, RButton, U, T5
      SendInput, {LButton Up}
   }
   else {
      if (KDE_WinLeft == 1 && KDE_WinUp == 1)
         SendInput, {LALT down}{Space}{LALT up}s{Left}{Up}
      else if (KDE_WinLeft == 1 && KDE_WinUp == -1)
         SendInput, {LALT down}{Space}{LALT up}s{Left}{Down}
      else if (KDE_WinLeft == -1 && KDE_WinUp == 1)
         SendInput, {LALT down}{Space}{LALT up}s{Right}{Up}
      else if (KDE_WinLeft == -1 && KDE_WinUp == -1)
         SendInput, {LALT down}{Space}{LALT up}s{Right}{Down}
      else if (KDE_WinLeft == 0 && KDE_WinUp == -1)
         SendInput, {LALT down}{Space}{LALT up}s{Down}
      else if (KDE_WinLeft == 0 && KDE_WinUp == 1)
        SendInput, {LALT down}{Space}{LALT up}s{Up}
      else if (KDE_WinLeft == -1 && KDE_WinUp == 0)
         SendInput, {LALT down}{Space}{LALT up}s{Right}
      else if (KDE_WinLeft == 1 && KDE_WinUp == 0)
         SendInput, {LALT down}{Space}{LALT up}s{Left}
      else if (KDE_WinLeft == 0 && KDE_WinUp == 0)
         SendInput, {LALT down}{Space}{LALT up}m{Left}
   }
return
#InputLevel 0

;*******************************************************************************
; Sec-Google Search
; If double-tap, send CTRL+e
;*******************************************************************************
CapsLock & e::
   KeyWait, e
   KeyWait, e, D, T%delayTime%
   if ErrorLevel=1
      IfWinExist Google Chrome
      {
         WinActivate
            SendInput, ^t
            SendInput, ^l
      }
      else {
         Run Chrome
         loop {
            IfWinExist Google Chrome
            {
               WinActivate
               SendInput, ^t
               SendInput, ^l
               return
            }
         }
      }
   else {
      SendInput ^e
   }
return

;*******************************************************************************
; Sec-New Email / New Task
;*******************************************************************************
CapsLock & q::
KeyWait, q
KeyWait, q, D, T%delayTime%
IfWinExist Outlook
{
   if WinActive("Outlook")
      previouslyActive = true
   else {
      previouslyActive = false
      WinActivate
   }
   if ErrorLevel=1
   {
      SendInput, {LCtrl down}{LShift down}m{LShift up}{LCtrl up}
      if !previouslyActive
         WinMinimize Outlook
   }
   else
   {
      SendInput, {LCtrl down}{LShift down}k{LShift up}{LCtrl up}
      SendInput, {LAlt down}d{LAlt up}Today{LShift down}{Tab}{Tab}{LShift up}
      if !previouslyActive
         WinMinimize Outlook
   }
}
else
   Run Outlook
return

;*******************************************************************************
; Sec-Open Inbox, Double Tap = Calendar
;*******************************************************************************
CapsLock & Tab::
   KeyWait, Tab
   KeyWait, Tab, D, T%delayTime%
   IfWinExist Outlook
   {
      WinActivate
      WinSet Top, , Outlook
      if (ErrorLevel=1) {
         SendInput, {LCTRL down}{LShift down}{i down}
         sleep 50
         SendInput, {i up}{LCTRL up}{LSHIFT up}
         sleep 50
         ControlFocus, SUPERGRID2, Outlook
         ControlFocus, OutlookGrid2, Outlook
      }
      else
         SendInput, ^2
   clearKeys()
   }
   else
      Run Outlook
return

CapsLock & F1::
   IfWinExist Outlook
   {
      WinActivate
      WinSet Top, , Outlook

      SendInput, {LCTRL down}{LShift down}{i down}
      sleep 50
      SendInput, {i up}{LCTRL up}{LSHIFT up}
      sleep 50
      ControlFocus, SUPERGRID2, Outlook
      ControlFocus, OutlookGrid2, Outlook
      clearKeys()
      SendInput, +{Tab}
      sleep 50
      SendInput sent{Space}
   }
   else
      Run Outlook
return

;*******************************************************************************
; Sec-Reply in Outlook
;*******************************************************************************
; If double tap, reply all
;*******************************************************************************
CapsLock & r::
   KeyWait, r
   KeyWait, r, D, T%delayTime%
   if ErrorLevel=1
      SendInput, {Blind}^r
   else
      SendInput, {Blind}^+r
return

;*******************************************************************************
; Sec-Paste in Paint
;*******************************************************************************
; If double tap, then select pencil, otherwise select selection box
;*******************************************************************************
CapsLock & \::
   KeyWait, \
   KeyWait, \, D, T%delayTime%
   if (ErrorLevel=1) {
      SendInput, {Blind}{PrintScreen}
      Run %windir%\system32\mspaint.exe
      sleep 500
      IfWinExist, Paint
      {
         WinActivate Paint
         WinMaximize
         SendInput, ^v
         SendInput, !hser
      }
   }
   else {
      SendInput, {Blind}{PrintScreen}
      Run %windir%\system32\mspaint.exe
      sleep 500
      IfWinExist, Paint
      {
         WinActivate Paint
         WinMaximize
         SendInput, ^v
         SendInput, !hp
         SendInput, !hsz{Down}{Down}{Enter}
      }
   }
return

;*******************************************************************************
; Sec-Copy Path
;*******************************************************************************
CapsLock & F4::
   SendInput, {F4}
   Sleep 100
   SendInput, +^{Left 20}
   SendInput, ^C
return

;*******************************************************************************
; Sec-Mouse Speed Adjustment
;*******************************************************************************
; AHK - Ratio
; 1   - 32:1
; 2   - 16:1
; 4   - 4:1
; 6   - 2:1
; 8   - 4:3
; 10  - 1:1
; 12  - 2:3
; 14  - 1:2
; 16  - 2:5
; 18  - 1:3
; 20  - 2:7
;*******************************************************************************
CapsLock & -::
   DllCall("SystemParametersInfo"
      ,"uint", SPI_GETMOUSESPEED     ; __in    UINT uiAction
      ,"uint", 0                     ; __in    UINT uiParam
      ,"UInt*", pvParam              ; __inout PVOID pvParam
      ,"uint", 0 )                   ; __in    UINT fWinIni
   DllCall("SystemParametersInfo", Int,SPI_SETMOUSESPEED, Int,0, UInt,pvParam-1, Int,2)
   DllCall("SystemParametersInfo"
      ,"uint", SPI_GETMOUSESPEED     ; __in    UINT uiAction
      ,"uint", 0                     ; __in    UINT uiParam
      ,"UInt*", pvParam              ; __inout PVOID pvParam
      ,"uint", 0 )                   ; __in    UINT fWinIni
   ToolTip %pvParam%
   sleep 200
   ToolTip
return

CapsLock & +::
   DllCall("SystemParametersInfo"
      ,"uint", SPI_GETMOUSESPEED     ; __in    UINT uiAction
      ,"uint", 0                     ; __in    UINT uiParam
      ,"UInt*", pvParam              ; __inout PVOID pvParam
      ,"uint", 0 )                   ; __in    UINT fWinIni
   DllCall("SystemParametersInfo", Int,SPI_SETMOUSESPEED, Int,0, UInt,pvParam+1, Int,2)
   DllCall("SystemParametersInfo"
      ,"uint", SPI_GETMOUSESPEED     ; __in    UINT uiAction
      ,"uint", 0                     ; __in    UINT uiParam
      ,"UInt*", pvParam              ; __inout PVOID pvParam
      ,"uint", 0 )                   ; __in    UINT fWinIni
   ToolTip %pvParam%
   sleep 200
   ToolTip
return

#LALT::
   ; Retrieve the current speed so that it can be restored later:
   DllCall("SystemParametersInfo", UInt, SPI_GETMOUSESPEED, UInt, 0, UIntP, pvParam, UInt, 0)
   ; Now set the mouse to the slower speed specified in the next-to-last parameter (the range is 1-20, 10 is default):
   DllCall("SystemParametersInfo", UInt, SPI_SETMOUSESPEED, UInt, 0, Ptr, pvParam/2, UInt, 0)
   KeyWait LALT  ; This prevents keyboard auto-repeat from doing the DllCall repeatedly.
   DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, Ptr, pvParam, UInt, 0)  ; Restore the original speed.
return

^LWin::
   SendInput, {LButton down}
   KeyWait, LWin
   SendInput, {LButton up}
return
;   ; Retrieve the current speed so that it can be restored later:
;   DllCall("SystemParametersInfo", UInt, SPI_GETMOUSESPEED, UInt, 0, UIntP, pvParam, UInt, 0)
;   ; Now set the mouse to the slower speed specified in the next-to-last parameter (the range is 1-20, 10 is default):
;   DllCall("SystemParametersInfo", UInt, SPI_SETMOUSESPEED, UInt, 0, Ptr, pvParam*2, UInt, 0)
;   KeyWait LCTRL  ; This prevents keyboard auto-repeat from doing the DllCall repeatedly.
;   DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, Ptr, pvParam, UInt, 0)  ; Restore the original speed.
return

;*******************************************************************************
; Sec-Mouse Scrolling
;*******************************************************************************
CapsLock & WheelUp::
   if WinActive("Allegro") {
      if (allegroLayer != 1)
         allegroLayer := allegroLayer - 1
      SendInput, s%allegroLayer%{Enter}
      SetCapsLockState,   AlwaysOff
   }
   else {
      MouseGetPos,,,hovwin, hovcontrol
      SendMessage, 0x114, 0, 0, %hovcontrol%, ahk_id %hovwin%
      SendMessage, 0x114, 0, 0, %hovcontrol%, ahk_id %hovwin%
      SendInput, {WheelLeft}
      SendInput, {WheelLeft}
   }
return

CapsLock & WheelDown::
   if WinActive("Allegro") {
         allegroLayer := allegroLayer + 1
         SendInput, s%allegroLayer%{Enter}
         SetCapsLockState,   AlwaysOff
   }
   else {
      MouseGetPos,,,hovwin, hovcontrol
      SendMessage, 0x114, 1, 0, %hovcontrol%, ahk_id %hovwin%
      SendMessage, 0x114, 1, 0, %hovcontrol%, ahk_id %hovwin%
      SendInput, {WheelRight}
      SendInput, {WheelRight}
   }
return

WheelUp::
   if (DoubleCaps) {
      focusWheelEn := true
      TrayTip, AutoHotkey, MouseWheel Focussing On, , 16
   }
   else if (focusWheelEn) {
      MouseGetPos,,,hovwin, hovcontrol
      ;WinActivate ahk_id %hovwin%
      ControlFocus %hovcontrol%, ahk_id %hovwin%
      ;SendMessage, 0x115, 0, 0, %hovcontrol%, ahk_id %hovwin%
      ;SendMessage, 0x20a, 120 << 16, , %hovcontrol%, ahk_id %hovwin%
      SendInput, {WheelUp}
   }
   else {
      SendInput, {WheelUp}
   }
return

WheelDown::
   if (DoubleCaps) {
      focusWheelEn := false
      TrayTip, AutoHotkey, MouseWheel Focussing Off, , 16
   }
   else if (focusWheelEn) {
      MouseGetPos,,,hovwin, hovcontrol
      WinActivate ahk_id %hovwin%
      ControlFocus %hovcontrol%, ahk_id %hovwin%
      ;SendMessage, 0x115, 1, 0, %hovcontrol%, ahk_id %hovwin%
      ;SendMessage, 0x20a, 120 >> 4, , %hovcontrol%, ahk_id %hovwin%
      SendInput, {WheelDown}
   }
   else {
      SendInput, {WheelDown}
   }
return

;*******************************************************************************
; Sec-Transparency
;*******************************************************************************
#WheelUp::
   if (TransP != "Off")
      TransP += 50
   if (TransP >= 250)
      TransP = Off
   WinGetActiveTitle, WinTitle
   WinSet, Transparent, %TransP%, %WinTitle%
return

#WheelDown::
   if (TransP == "Off")
      TransP = 200
   else
      TransP -= 50
   if (TransP < 50)
      TransP = 50
   WinGetActiveTitle, WinTitle
   WinSet, Transparent, %TransP%, %WinTitle%
return

CapsLock & i::
CapsLock & LWin::
   WinGetActiveTitle, WinTitle
   while (GetKeyState("i", "P") || GetKeyState("LWin", "P"))
   {
      WinGet, TransP, Transparent, %WinTitle%
      if (TransP == "")
         TransP = 255
      else if (TransP <= 0)
         TransP = 0
      else
         TransP -= 20
      WinSet, Transparent, %TransP%, %WinTitle%
      sleep 25
   }
   while (TransP <= 255)
   {
      TransP += 20
      WinSet, Transparent, %TransP%, %WinTitle%
      sleep 25
   }
   WinSet, Transparent, Off, %WinTitle%
return

;*******************************************************************************
; Sec-Text Replacements
;*******************************************************************************
::tyj::
   SendInput, Thanks,{Enter}Justin!s
return

::lbu::labuser
::gdk::Grand2004key
::pzl::puzzle-lnx
::tlt2::telnet ts1 2002
::tlt3::telnet ts1 2003
::tli::telnet ips1
::tlmin::telnet 172.28.107.27 2016
::wbx::allWbXPWSuck2
::moej::moe.justin@gmail.com
::fibo::Fibonacci
::schro::Schrodinger
::showv::show_version
::clre::clear_errors
::clrs::clear_stats
::cds1::cd /mortis1/snips0
::cds2::cd /mortis2/snips0
::cds3::cd /mortis3/snips0
::cds4::cd /mortis4/snips0
::cds5::cd /mortis5/snips0
::cds6::cd /mortis6/snips0
::cdm1::cd /mortis1
::cdm2::cd /mortis2
::cdm3::cd /mortis3
::cdm4::cd /mortis4
::cdm5::cd /mortis5
::cdm6::cd /mortis6
::cdq1::cd /mortis1/qxs0
::cdq2::cd /mortis2/qxs0
::cdq3::cd /mortis3/qxs0
::cdq4::cd /mortis4/qxs0
::cdq5::cd /mortis5/qxs0
::cdq6::cd /mortis6/qxs0
::cdq11::cd /mortis1/qxs1
::cdq21::cd /mortis2/qxs1
::cdq31::cd /mortis3/qxs1
::cdq41::cd /mortis4/qxs1
::cdq51::cd /mortis5/qxs1
::cdq61::cd /mortis6/qxs1

::snp::
    clipboard = \\sjc5-netapp22b\workspace\wslocal22\jumoe\snips
    SendInput, ^v
return

::ahkprbsc::
   clipboard =
   (
   xpp
   hws
   foreach (@slotList) {
      print "\n+++ Slot $_\n";
      $cli->eval("/mortis$_/qxs0/slice0/prbs_sl_rx -pattern 31");
      $cli->eval("/mortis$_/qxs0/slice1/prbs_sl_rx -pattern 31");
      $cli->eval("/mortis$_/qxs0/slice2/prbs_sl_rx -pattern 31");
      $cli->eval("/mortis$_/qxs0/slice3/prbs_sl_rx -pattern 31");
      $cli->eval("/mortis$_/qxs1/slice0/prbs_sl_rx -pattern 31");
      $cli->eval("/mortis$_/qxs1/slice1/prbs_sl_rx -pattern 31");
      $cli->eval("/mortis$_/qxs1/slice2/prbs_sl_rx -pattern 31");
   }
   xpp
   hws
   )
   SendInput ^y
return

::ahkprbsp::
   clipboard =
   (
   foreach (@slotList) {
      print "\n+++ Slot $_\n";
      print "PRBS Tx/Rx Control TxPol RxPol TxPrbsSel gtxRxPrbsSel gtxForcePrbsErr gtxPrbsCntRst gtxClrCntr\n";
      for ( $k = 0 ; $k < 3; $k++) { for ( $j = 0 ; $j < 2; $j++) { for ( $i = 0 ; $i < 2; $i++) {
         print "PRBS Tx/Rx Control [$k][$j][$i] "
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->gtxCtrlReg()->gtxTxPolarity()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->gtxCtrlReg()->gtxRxPolarity()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsCtrlReg()->gtxTxPrbsSel()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsCtrlReg()->gtxRxPrbsSel()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsCtrlReg()->gtxForcePrbsErr()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsCtrlReg()->gtxPrbsCntRst()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsCtrlReg()->gtxClrCntr()."\n";
      }}}
   }
   )
   SendInput ^y
return

::ahkprbss::
   clipboard =
   (
   foreach (@slotList) {
      print "\n+++ Slot $_\n";
      $cli->eval("cd /mortis$_/snips0");
      for ( $k = 0 ; $k < 3; $k++) { for ( $j = 0 ; $j < 2; $j++) { for ( $i = 0 ; $i < 2; $i++) {
         print "PRBS GTX0/1 Err/Cnt[$k][$j][$i] "
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsStatReg()->gtx0PrbsErr()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsStatReg()->gtx1PrbsErr()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsStatReg()->gtx1PrbsErrCnt()."\t"
            .$_hal->snipsQuadSliceAddrReg($k)->snipsXQuadAddrReg($j)->snipsSliceAddrReg($i)->snipsPhyAddrReg()->snipsGTXReg()->prbsStatReg()->gtx0PrbsErrCnt()."\n";
      }}}
   }
   )
   SendInput ^y
return

;*******************************************************************************
; Sec-Key Remaps
;*******************************************************************************
*XButton1::
   if(computername="jumoe-w7v2")
   ;if(computername="jumoe-w7")
         SendInput, {Blind}{PgDn}
      else
         SendInput, {Blind}{PgUp}
   SetTimer, DoXButton1, -500
return

*XButton2::
   if(computername="jumoe-w7v2")
   ;if(computername="jumoe-w7")
      SendInput, {Blind}{PgUp}
   else
      SendInput, {Blind}{PgDn}
   SetTimer, DoXButton2, -500
return

DoXButton1:
   while GetKeyState("XButton1", "P") {
      if(computername="jumoe-w7v2")
      ;if(computername="jumoe-w7")
         SendInput, {Blind}{PgDn}
      else
         SendInput, {Blind}{PgUp}
      i += 1
      if (i < 3)
         sleep 300
      else
         sleep 50
   }
   i = 1
return

DoXButton2:
   while GetKeyState("XButton2", "P") {
      if(computername="jumoe-w7v2")
      ;if(computername="jumoe-w7")
         SendInput, {Blind}{PgUp}
      else
         SendInput, {Blind}{PgDn}
      i += 1
      if (i < 3)
         sleep 300
      else
         sleep 50
   }
   i = 1
return

CapsLock & XButton1::
   if(computername="jumoe-w7v2")
   ;if(computername="jumoe-w7")
      SendInput, ^{End}
   else
      SendInput, ^{Home}
return

CapsLock & XButton2::
   if(computername="jumoe-w7v2")
   ;if(computername="jumoe-w7")
      SendInput, ^{Home}
   else
      SendInput, ^{End}
return

LAlt & SC029::ShiftAltTab ;tilde

CapsLock & LButton::
   Send, {MButton Down}
   KeyWait, LButton
   Send, {MButton Up}
return

Browser_Back::Enter

CapsLock & '::
   WinGetActiveTitle, WinTitle
   WinMinimize %WinTitle%
return

;*******************************************************************************
; Sec-Key Commands
;*******************************************************************************
;***Direction Overrides
CapsLock & h::SendInput, {Blind}{left}
CapsLock & j::SendInput, {Blind}{down}
;   sleep delayTime*1000
;   while GetKeyState("j", "P")
;      SendInput, {Blind}{down}
;return
CapsLock & k::SendInput, {Blind}{up}
CapsLock & l::SendInput, {Blind}{right}
CapsLock & d::
if (A_PriorHotKey == "CapsLock" and A_TimeSincePriorHotkey < (delayTime * 1500))
   {
      SendInput, {Home}+{End}^c{End}{Enter}^v
   }
   else
      SendInput, {Blind}{PgDn}
return

CapsLock & u::SendInput, {Blind}{PgUp}
CapsLock & BackSpace::SendInput, {Blind}{Delete}
CapsLock & b::SendInput, {Blind}{Home}
CapsLock & n::SendInput, {Blind}{End}
;***Windows Commands, these cycle through the windows every .5secs
CapsLock & 1::SendInput, #1
CapsLock & 2::
   SendInput, {Blind}{LWin Down}
   SendInput, {Blind}2
   KeyWait, CapsLock, T .25
   While (ErrorLevel == 1) {
      SendInput, {Blind}2
      KeyWait, CapsLock, T .5
   }
   SendInput, {Blind}{LWin Up}
return
CapsLock & 3::SendInput, #3
CapsLock & 4::SendInput, #4
CapsLock & 5::SendInput, #5
~CapsLock & 6::
   SendInput, {Blind}{LWin Down}
   SendInput, {Blind}6
   KeyWait, CapsLock, T 5
   SendInput, {Blind}{LWin Up}
return
CapsLock & 7::
   SendInput, {Blind}{LWin Down}
   SendInput, {Blind}7
   KeyWait, CapsLock, T .25
   While (ErrorLevel == 1) {
      SendInput, {Blind}7
      KeyWait, CapsLock, T .5
   }
   SendInput, {Blind}{LWin Up}
return
CapsLock & 8::SendInput, #8
CapsLock & 9::SendInput, #9

;***File/Text Operations
CapsLock & a::SendInput, {Blind}^a
CapsLock & s::SendInput, {Blind}^s
CapsLock & c::  ; Two clipboards, backup and main
   if (A_PriorHotKey == "CapsLock" and A_TimeSincePriorHotkey < (delayTime * 2000))
   {
      ClipboardMain := ClipboardAll
      Clipboard     :=
      SendInput, {Blind}^c
      ClipWait
      ClipboardBack := ClipboardAll
      Clipboard     := ClipboardMain
   }
   else {
      if (GetKeyState("LShift"))
         SendInput, {Home}+{End}^c
      else
         SendInput, {Blind}^c
   }
   ;MsgBox Control-C copied the following contents to the clipboard:`n`n%clipboard%
   ;MsgBox Control-C copied the following contents to the clipboardMain:`n`n%ClipboardMain%
   ;MsgBox Control-C copied the following contents to the clipboardBack:`n`n%ClipboardBack%
return

CapsLock & f::SendInput, {Blind}^f
CapsLock & v::
   if (A_PriorHotKey == "CapsLock" and A_TimeSincePriorHotkey < (delayTime * 2000))
   {
      ClipboardMain := ClipboardAll
      Clipboard     := ClipboardBack
      sleep 50
      SendInput, {Blind}^v
      sleep 50
      Clipboard     := ClipboardMain
   }
   else
      SendInput, {Blind}^v
return

CapsLock & x::  ; Two clipboards, backup and main
   if (A_PriorHotKey == "CapsLock" and A_TimeSincePriorHotkey < (delayTime * 2000))
   {
      ClipboardMain := ClipboardAll
      Clipboard     :=
      SendInput, {Blind}^x
      ClipWait
      ClipboardBack := ClipboardAll
      Clipboard     := ClipboardMain
   }
   else {
      if (GetKeyState("LShift"))
         SendInput, {Home}+{End}^x
      else
         SendInput, {Blind}^x
   }
return

CapsLock & y::SendInput, {Blind}^y
CapsLock & z::SendInput, {Blind}^z
;***Switch Tabs in Excel, Linux, Chrome, Notepad+++
CapsLock & [::SendInput, ^{PgUp}
CapsLock & ]::SendInput, ^{PgDn}
;***Misc
CapsLock & o::SendInput, Username
CapsLock & p::SendInput, Password
CapsLock & g::SendInput, {Blind}!{F4}
CapsLock & t::
   if (A_PriorHotKey == "CapsLock" and A_TimeSincePriorHotkey < (delayTime * 2000)) {
      sysTime := A_YYYY . A_MM . A_DD . "_" . A_Hour . A_Min . A_Sec
      SendInput, %sysTime%
   }
   else {
      SendInput, {Blind}^t
   }
   return
CapsLock & w::SendInput, {Blind}^w
CapsLock & Space::SendInput, {Blind}{Escape}
CapsLock & PgUp::SendInput, ^{Home}
CapsLock & PgDn::SendInput, ^{End}
CapsLock & Delete::SendInput, {Home}+{End}{Delete}
CapsLock & ,::SendInput, {Blind}{LButton}
CapsLock & /::
   KeyWait, CapsLock
   SendInput, {RButton}
return
CapsLock & RALT::SendInput, {Blind}{AppsKey}
CapsLock & .::SendInput, {Blind}{MButton}

;RALT::
;   SendInput, {LButton down}
;   KeyWait, RALT
;   SendInput, {LButton up}
;return

;RCTRL::
;SendInput, {RButton down}
;   KeyWait, RCTRL
;   SendInput, {RButton up}
;return

;*******************************************************************************
; Sec-Functions
;*******************************************************************************
whichMon(x, y){
   i = 1
   SysGet, MonitorCount, MonitorCount
   while (i <= MonitorCount+0){
      SysGet, Mon2, Monitor, %i%
      if (x <= Mon2Right && x >= Mon2Left && y <= Mon2Bottom && y >= Mon2Top)
         return i
      i++
   }
   return -1
}

GetEnv( VarName )
{
   VarSetCapacity( buffer, 0xFFFF )
   DllCall( "GetEnvironmentVariable", "str", VarName, "str", buffer, "uint", 0xFFFF )
   Return buffer
}

MonInfo(){
   ; Example #2: This is a working script that displays info about each monitor:
   SysGet, MonitorCount, MonitorCount
   SysGet, MonitorPrimary, MonitorPrimary
   MsgBox, Monitor Count:`t%MonitorCount%`nPrimary Monitor:`t%MonitorPrimary%
   Loop, %MonitorCount%
   {
       SysGet, MonitorName, MonitorName, %A_Index%
       SysGet, Monitor, Monitor, %A_Index%
       SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
       MsgBox, Monitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% (%MonitorWorkAreaBottom% work)
   }
}