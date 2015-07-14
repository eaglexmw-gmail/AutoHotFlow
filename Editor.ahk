#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetBatchLines -1
#SingleInstance off
CoordMode,mouse,client
;FileEncoding,UTF-8
OnExit,Exit






if not a_iscompiled
	developing=yes

DebugLogLevelApp=3 ;Debug level for app debugs: 0=Only errors; 1=Important logs; 2=Detailed logs ; 3=Debug logs
DebugLogLevelFlow=3 ;Debug levels: 0=Only errors; 1=Important logs; 2=Detailed logs ; 3=Debug logs

;Defines / Constants
c_SetLoopVar=2
c_SetBuiltInVar=1
c_loopVarsName=Lоѳрṽạṝṥ

DetectHiddenWindows,on


NoTests:=true ;prevent some test routines. Should be activated.
FlowCompabilityVersion:=1 ;This variable contains a number which will be incremented as soon an incompability appears. This will make it possible to identify old scripts and convert them.

lang_FindAllLanguages()
ini_ReadSettings()

iniAllActions=
iniAllConditions=
iniAllTriggers=

#Include %A_ScriptDir% 


;If you add an element, include the ahk
;the inclusion order affects the appearance order in the element selection GUI
#include elements\actions\New_Variable.ahk ;First element in Category variables
#include elements\actions\tooltip.ahk ;First element in Category user interaction
#include elements\actions\Sleep.ahk ;First element in Category Flow control
#include elements\actions\Send_Keystrokes.ahk ;first element in category user simulation
#include elements\actions\Activate_Window.ahk ;First element in category window
#include elements\actions\run.ahk ;First element in category process
#include elements\actions\Write_to_file.ahk ;first element in category files
#include elements\actions\Play_Sound.ahk ;first element in category sounds
#include elements\actions\Download_file.ahk ;first element in category internet
#include elements\actions\lock_computer.ahk ;first element in category power
#include elements\actions\AutoHotKey_script.ahk ;first element in category for experts
;actions in category variable
#include elements\actions\Copy_variable.ahk
#include elements\actions\Get_Clipboard.ahk
#include elements\actions\Set_Clipboard.ahk
#include elements\actions\Absolute_number.ahk
#include elements\actions\Rounding_a_number.ahk
#include elements\actions\Random_number.ahk
#include elements\actions\Exponentiation.ahk
#include elements\actions\Square_Root.ahk
#include elements\actions\Trigonometry.ahk
#include elements\actions\Substring.ahk
#include elements\actions\Trim_a_string.ahk
#include elements\actions\Replace_a_string.ahk
#include elements\actions\Search_in_a_string.ahk
#include elements\actions\Split_a_string.ahk
#include elements\actions\Get_string_length.ahk
#include elements\actions\Change_character_case.ahk
#include elements\actions\New_date.ahk
#include elements\actions\Date_Calculation.ahk
#include elements\actions\New_list.ahk
#include elements\actions\Add_to_list.ahk
#include elements\actions\Get_from_list.ahk
#include elements\actions\Delete_from_list.ahk
#include elements\actions\Get_index_of_element_in_list.ahk
#include elements\actions\Shuffle_list.ahk

;actions in category user interaction
#include elements\actions\Traytip.ahk
#include elements\actions\Message_Box.ahk
#include elements\actions\Input_box.ahk
#include elements\actions\Speech_output.ahk ;user interaction and sound

;actions in category flow control
#include elements\actions\Set_flow_status.ahk
#include elements\actions\Execute_flow.ahk
#include elements\actions\Stop_flow.ahk

;actions in category window
#include elements\actions\Close_Window.ahk
#include elements\actions\Kill_Window.ahk
#include elements\actions\Move_window.ahk
#include elements\actions\Show_window.ahk
#include elements\actions\Hide_window.ahk
#include elements\actions\Minimize_all_windows.ahk
#include elements\actions\Send_Keystrokes_to_Control.ahk ;Window and user simulation
#include elements\actions\Get_control_text.ahk
#include elements\actions\Set_control_text.ahk

;actions in category user simulation
#include elements\actions\Click.ahk
#include elements\actions\Move_mouse.ahk
#include elements\actions\Drag_with_mouse.ahk
#include elements\actions\Get_mouse_position.ahk
#include elements\actions\Set_lock_key.ahk

;actions in category process
#include elements\actions\Kill_Process.ahk
#include elements\actions\Set_process_priority.ahk

;actions in category files
#include elements\actions\Delete_file.ahk
#include elements\actions\Copy_file.ahk
#include elements\actions\Move_file.ahk
#include elements\actions\Rename_file.ahk
#include elements\actions\Read_from_file.ahk
#include elements\actions\Recycle_file.ahk
#include elements\actions\Create_folder.ahk
#include elements\actions\Copy_folder.ahk
#include elements\actions\Move_folder.ahk
#include elements\actions\Rename_folder.ahk
#include elements\actions\Delete_folder.ahk
#include elements\actions\Write_to_ini.ahk
#include elements\actions\Read_from_ini.ahk
#include elements\actions\Delete_from_ini.ahk
#include elements\actions\Get_file_size.ahk
#include elements\actions\Get_file_time.ahk
#include elements\actions\Set_file_time.ahk
#include elements\actions\Get_file_attributes.ahk
#include elements\actions\Set_file_attributes.ahk
#include elements\actions\Select_file.ahk ;files and user interaction
#include elements\actions\Select_folder.ahk ;files and user interaction
#include elements\actions\Empty_recycle_bin.ahk

;actions in category sound
#include elements\actions\Stop_Sound.ahk
#include elements\actions\Beep.ahk
#include elements\actions\Set_Volume.ahk
#include elements\actions\Get_Volume.ahk

;actions in category internet

;actions in category power
#include elements\actions\log_off.ahk
#include elements\actions\Shutdown.ahk
#include elements\actions\reboot_computer.ahk
#include elements\actions\hibernate_computer.ahk
#include elements\actions\suspend_computer.ahk

;actions in category for experts



#include elements\conditions\expression.ahk
#include elements\conditions\Variable_is_empty.ahk
#include elements\conditions\String_contains_text.ahk
#include elements\conditions\List_contains_element.ahk
#include elements\conditions\confirmation_dialog.ahk
#include elements\conditions\key_is_down.ahk
#include elements\conditions\flow_enabled.ahk
#include elements\conditions\flow_running.ahk
#include elements\conditions\window_active.ahk
#include elements\conditions\window_Exists.ahk
#include elements\conditions\Process_is_running.ahk
#include elements\conditions\File_exists.ahk
#include elements\conditions\File_has_attribute.ahk
#include elements\conditions\debug_dialog.ahk
;~ #include elements\conditions\Folder_exists.ahk

#include elements\triggers\window_opens.ahk
#include elements\triggers\window_Closes.ahk
#include elements\triggers\Window_Gets_Active.ahk
#include elements\triggers\Window_Gets_Inactive.ahk
#include elements\triggers\Hotkey.ahk
#include elements\triggers\Shortcut.ahk
#include elements\triggers\Periodic_timer.ahk
#include elements\triggers\Clipboard_Changes.ahk
#include elements\triggers\start_up.ahk
#include elements\triggers\Time_of_day.ahk
#include elements\triggers\User_Idle_Time.ahk
#include elements\triggers\Process_starts.ahk
#include elements\triggers\Process_closes.ahk


#include elements\loops\SimpleLoop.ahk
#include elements\loops\Condition.ahk
#include elements\loops\Work_through_a_list.ahk
#include elements\loops\Loop_through_files.ahk
#include elements\loops\Parse_a_string.ahk



;include other stuff
#include language\language.ahk ;Must be very first
#include editor\ini\Ini_compability.ahk ; must be first
#include editor\ini\Ini_Settings.ahk ; must be first
#include editor\ini\Ini_save.ahk
#include editor\ini\Ini_savetoclipboard.ahk
#include editor\ini\Ini_loadfromclipboard.ahk
#include editor\ini\Ini_load.ahk
#include editor\Elements\e_elements.ahk
#include elements\functions for elements.ahk
#include elements\Get window information.ahk
#include elements\Get control information.ahk
#include editor\Variables\v_Variables.ahk
#include editor\Variables\v_Expression.ahk
#include editor\User Interface\ui_GDI+.ahk
#include editor\User Interface\ui_Mouse.ahk
#include editor\User Interface\ui_Help.ahk
#include editor\User Interface\ui_Element_Settings.ahk
#include editor\User Interface\ui_Menu_Bar.ahk
#include editor\User Interface\ui_Main_GUI.ahk
#include editor\User Interface\ui_tooltip.ahk
#include editor\User Interface\ui_flow_settings.ahk
#include editor\User Interface\ui_Tray.ahk

#include editor\run\r_run.ahk
#include editor\run\r_enable.ahk
#include editor\Debug\d_Debug.ahk
#include editor\Debug\d_Logger.ahk



#include External Scripts\gdi+\gdip.ahk
;#include External Scripts\fincs-ahk-eval\Lib\eval.ahk
;#include External Scripts\Uberi - ExprEval\Dynamic Expressions.ahk
#include External Scripts\TTS\TTS by Learning One.ahk
#include External Scripts\ScrollGui\Class_ScrollGUI.ahk
#include External Scripts\Object to file\String-object-file.ahk
#include External Scripts\different external functions.ahk


;Trim the last "|" character, because it is not needed
StringTrimRight,iniAllActions,iniAllActions,1
StringTrimRight,iniAllConditions,iniAllConditions,1
StringTrimRight,iniAllTriggers,iniAllTriggers,1




ini_GetElementInformations()

;close if the manager closes
IfWinExist,•AutoHotFlow•
	SetTimer,endWhenManagerCloses,500



OnExit, ExitAppOverride

;Initialize some variables
clickModus=normal ;click clickModus

saved=yes
triggersenabled:=false

;Create arrays
allElements:=Object()
allTriggers:=Object()
markedElements:=Object()
localVariables:=Object()

ReceivedCommandsBuffer=
CommandCount=0

;Developping:
;~ if developing=yes
;~ {

;~ run,Manager\DevelopmentHelper.ahk
;~ }



;Add the Trigger element
e_newTriggerContainer()
;Create the saving folder for generated scripts
FileCreateDir Generated Scripts

;Create a hidden window for other triggers
gui,CommandWindow:default
gui,CommandWindow:new,,CommandWindowOfEditor
gui,add,text,vCommandWindowFlowName w200,--------------------
gui,add,edit,vCommandWindowRecieve gCommandWindowRecieve w200
;gui,show ;Only for debugging

ui_CreateMainGui()


;Evaluate parameters
if 1=EditFlow 
{
	OnStartLoadFile=%2%
	logger("a1","Editor Started. The flow """ OnStartLoadFile """ should be edited because of parameter.")
	
	
	i_load(OnStartLoadFile)
	ui_showgui()
}
else if 1=RunFlow 
{
	
	OnStartLoadFile=%2%
	logger("a1","Editor Started. The flow """ OnStartLoadFile """ should be run because of parameter.")
	
	Iniread,FlowName,%OnStartLoadFile%,general,name ;It may happen that the editor for that flow is already opened. Try to send the command to the command window of the editor to start the flow, if it is already open. If not load flow and start it.
	ControlSetText,edit1,run,CommandWindowOfEditor,% "Ѻ" FlowName "Ѻ" 
	if not errorlevel
		exitapp
	
	i_load(OnStartLoadFile)
	
	r_startRun()
	return
}
else if 1=EnableFlow 
{
	EnableFlowOptions=%3%
	
	OnStartLoadFile=%2%
	logger("a1","Editor Started. The flow """ OnStartLoadFile """ should be enabled because of parameter.")
	i_load(OnStartLoadFile)
	goto,ui_Menu_Enable
	return
}
else if INIOnStartLoadFile<> ;If a flow should be opened at startup
{
	ui_showgui()
	logger("a1","Editor Started. The flow """ INIOnStartLoadFile """ should be edited because of ini file.")
	i_load(INIOnStartLoadFile)
	IniDelete,settings.ini,common,LoadFileOnStart
	
}
else
{
	logger("a0","Editor Started, but no flow to start available.")
	MsgBox, 64, AutoHotFlow editor, This editor is only designed to be opened by the AutoHotFlow Manager. Please open the manager if you want to edit a flow.
		ExitApp
	
	ui_showgui() ;Show an empty flow
}


return

ui_showgui()
gosub,guisize


return




;React on commands from other ahks
CommandWindowRecieve:
gui,submit
CommandCount++
ReceivedCommandsBuffer=%CommandWindowRecieve%█▬►
logger("a3","Command window received command: " CommandWindowRecieve)
SetTimer,EvaluateCommand,-1
return

EvaluateCommand:
Loop
{
	StringGetPos,tempCommandLength,ReceivedCommandsBuffer,█▬►
	if (errorlevel)
		break
	
	StringLeft,tempCommand,ReceivedCommandsBuffer,tempCommandLength
	StringTrimLeft,ReceivedCommandsBuffer,ReceivedCommandsBuffer,tempCommandLength+3
	
	StringSplit,tempCommand,tempCommand,| ;Split the command
	
	;ToolTip(tempCommand)
	
	if tempCommand1=Run ;run when a trigger triggers
	{
		;tempCommand2 = Variable list
		;tempCommand3 = Calling flow
		;tempCommand4 = Instance ID to calling flow to tell when its finished
		;tempCommand5 = Element ID In Instance
		;tempCommand6 = Whether to return variables
		ThisExecution_Parameters:=Object()
		ThisExecution_Parameters["localVariables"]:=tempCommand2
		ThisExecution_Parameters["CallingFlow"]:=tempCommand3
		ThisExecution_Parameters["InstanceIDOfCallingFlow"]:=tempCommand4
		ThisExecution_Parameters["ElementIDInInstanceOfCallingFlow"]:=tempCommand5
		ThisExecution_Parameters["WhetherToReturVariables"]:=tempCommand6
		
		;MsgBox %ThisExecution_localVariables%
		logger("a2","Command received to start run.")
		
		r_startRun(ThisExecution_Parameters)
		
	}
	else if tempCommand1=Edit ;Show the edit window
	{
		ui_showgui()
		logger("a2","Command received to show the edit window.")
	}
	else if tempCommand1=elementEnd ;An element in external script can tell so that it ended
	{
		logger("a2","Command received to end element " tempCommand2 " with result: " tempCommand3)
		MarkThatElementHasFinishedRunningOneVar(tempCommand2,tempCommand3)
		
	}
	else if tempCommand1=setVariable
	{
		StringSplit,tempInstance,tempCommand2,_
		logger("a2","Command received to set variable " tempCommand3 " to " tempCommand4)
		v_setVariable(tempInstance2,0,tempCommand3,tempCommand4)
		
	}
	else if tempCommand1=stop
	{
		stopRun:=true
		logger("a2","Command received to stop run.")
		
	}
	else if tempCommand1=Enable
	{
		logger("a2","Command received to enable flow.")
		EnableFlowOptions=tempCommand2
		if (triggersEnabled=false)
			goto,ui_Menu_Enable
		
		
	}
	else if tempCommand1=disable
	{
		logger("a2","Command received to disable flow.")
		if (triggersEnabled=true)
			goto,ui_Menu_Enable
		
		
	}
	else if tempCommand1=FlowParametersChanged
	{
		logger("a2","Command received to reload general flow parameters.")
		i_loadGeneralParameters()
		
	}
	else if tempCommand1=updateStatus
	{
		logger("a3","Command received to report current status.")
		if (triggersEnabled=true)
			ControlSetText,edit1,enabled|%flowName%,CommandWindowOfManager ;Tell the manager that this flow is disabled
		else
			ControlSetText,edit1,disabled|%flowName%,CommandWindowOfManager ;Tell the manager that this flow is disabled
		if (nowRunning!=true)
			ControlSetText,edit1,stopped|%flowName%,CommandWindowOfManager ;Tell the manager that this flow is disabled
		else
			ControlSetText,edit1,running|%flowName%,CommandWindowOfManager ;Tell the manager that this flow is disabled

	}
	else if tempCommand1=AnswerExecuteFlow
	{
		logger("a2","Command received to report whether the other flow was started.")
		returnedFlowIsRunning:=tempCommand2
		
		
	}
	else if tempCommand1=AnswerDisableFlow
	{
		logger("a2","Command received to report whether the other flow was disabled.")
		returnedFlowIsDisabled:=tempCommand2
		
		
	}
	else if tempCommand1=AnswerEnableFlow
	{
		logger("a2","Command received to report whether the other flow was enabled.")
		returnedFlowIsEnabled:=tempCommand2
		
		
	}
	else if tempCommand1=AnswerStopFlow
	{
		logger("a2","Command received to report whether the other flow was stopped.")
		returnedFlowIsStopped:=tempCommand2
		
		
	}
	else if tempCommand1=AnswerFlowIsEnabled?
	{
		logger("a2","Command received to report whether the other flow is enabled.")
		returnedWhetherFlowIsEnabled:=tempCommand2
		
		
	}
	else if tempCommand1=AnswerFlowIsRunning?
	{
		logger("a2","Command received to report whether the other flow is running.")
		returnedWhetherFlowIsRunning:=tempCommand2
		
		
	}
	else if tempCommand1=CalledFlowHasFinished
	{
		logger("a2","Command received to report whether the other flow has finished.")
		;tempCommand2 = instance ID
		;tempCommand3 = Element ID in instance
		;tempCommand4 = variables
		;MsgBox %tempCommand%
		returnedFlowHasFinished_Instance_%tempCommand2%_Element_%tempCommand3%:=true
		returnedFlowHasFinishedVariables_Instance_%tempCommand2%_Element_%tempCommand3%:=tempCommand4
		;MsgBox % returnedFlowHasFinishedVariables_Instance_%tempCommand2%_Element_%tempCommand3%
	}
	else if tempCommand1=immediatelyexit
	{
		logger("a2","Command received to emmediately exit.")
		immediatelyexit=true
		exitapp
	
	
	}
	else if tempCommand1=exit
	{
		logger("a2","Command received to exit.")
		exitapp
		
		
	}
	ReceivedCommandsBuffer.Remove(tempcommandID)
}
return




endWhenManagerCloses:

IfWinnotExist,ahk_id %CurrentManagerWindowID%
{
	loop 5
	{
		iniread,CurrentManagerWindowID,settings.ini,common,Hidden window ID of manager
		IfWinExist,ahk_id %CurrentManagerWindowID%
		{
			r_TellCurrentStatus()
			sleep 500
			r_TellCurrentStatus()
			return
		}
		sleep 100
		
	}
	
	logger("a2","Manager was closed. Closing flow.")
	exitapp
}
return


guiclose:
logger("a3","GUI closed by user.")
gui,1:hide
if saved=no
	MsgBox, 64, AutoHotFlow, % lang("Note!") " " lang("You have not saved."), 2



return

Exit:
ExitApp
return

ExitAppOverride:

if (saved="no" and immediatelyexit!="true")
{
	ui_showgui()
	logger("a3","Asking user to save flow")
	MsgBox,3,% lang("Exit"),% lang("You_have_not_saved.") "`n`n" lang("Do_you_want_to_save?")

	IfMsgBox,cancel
	{
		logger("a3","User does not want to save")
		return
	}
	IfMsgBox,yes
	{
		logger("a3","User want to save")
		i_save()
	}

}
saved=yes ;Prevent second prompt to save

if (triggersEnabled=true)
{
	logger("a2","Flow is currently enabled. Disabling flow")
	FileAppend,%A_ExitReason%`n,test.txt
	if (A_ExitReason ="shutdown" or A_ExitReason = "logoff")
		r_EnableFlow("noTellDisabled")
	else
		r_EnableFlow()

}
if nowRunning=true
{
	logger("a2","Flow is currently running. Stopping flow")
	stopRun=true
	settimer,exit,-500
	return
}

; gdi+ may now be shutdown on exiting the program
Gdip_Shutdown(pToken)
logger("a1","Exit")
exitapp
Return

