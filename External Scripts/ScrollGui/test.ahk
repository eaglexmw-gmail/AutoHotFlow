﻿#NoEnv
#Include Class_ScrollGUI.ahk
SetBatchLines, -1
; ----------------------------------------------------------------------------------------------------------------------
; ChildGUI
Gui, New, +hwndHGUI
Gui, Margin, 20, 20
I := 0
Gui, Add, Text, w370 h20 0x200, % "Edit " . ++I
Gui, Add, Edit, xp y+0 wp r6 vEdit10, 1`n2`n3`n4`n5`n6`n7`n8`n9
Loop, 4 {
   Gui, Add, Text, xp y+0 wp h20 0x200, % "Edit " . ++I
   Gui, Add, Edit, xp y+0 wp r6 vEdit1%A_Index%, 1`n2`n3`n4`n5`n6`n7`n8`n9
}
; Create ScrollGUI1 with vertical scrollbar and scrolling by mouse wheel
Global SG1 := New ScrollGUI(HGUI, 0, 400, "", 2, 4)
; Create the main window (parent)
Gui, Main:New
Gui, Margin, 0, 20
Gui, % SG1.HWND . ": -Caption +ParentMAIN +LastFound"
Gui, % SG1.HWND . ":Show", Hide
WinGetPos, , , W, H,% "ahk_id " SG1.HWND
;~ W := Round(W * (96 / A_ScreenDPI))
;~ H := Round(H * (96 / A_ScreenDPI))
Y := H + 20
WinGetPos, , , Wsettings, Hsettings,% "ahk_id " SG1.HGUI
HParent:=Hsettings+60
;Make resizeable
gui,+resize
gui,+minsize%w%x100 ;Ensure contant width.
gui,+maxsize%w%x%HParent%
Gui, Main:Add, Button, vButtonSave x20 y%Y% w100, Save
Gui, Main:Add, Button, vButtonCancel x+20 yp wp, Cancel
Gui, Main:Show, w%W%, Settings
Gui, Main:Show, w%W%, Settings ;Needed twice, otherwise the width is not correct
; Show ScrollGUI1
SG1.Show("", "x0 y0")
Return
; ----------------------------------------------------------------------------------------------------------------------
MainGuiClose:
MainGuiEscape:
ExitApp
 
MainGuisize(GuiHwnd, EventInfo, Width, Height)
{
   ;~ guicontrol, main:move,ButtonSave,% "y" Height-40
   ;~ guicontrol, main:move,ButtonCancel,% "y" Height-40
 
   ;attempt 1 ;Everything disappears
   SetWinDelay,0
   winmove,% "ahk_id " SG1.HWND,  , 0, 0,  ,% Height-60

   ;attempt 2 ;Everything disappears
   ;~ SG1.height:=Height-60
   ;~ sg1.show()
 
   ;attempt 3 ;Nothing happens
   ;SG1.size(,Height-60) 
 
   ;~ ToolTip % Width " " Height " " GUIHWND "`n" SG1.HWND 
 
}
 
ExitApp
ExitApp