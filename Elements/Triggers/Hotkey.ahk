﻿iniAllTriggers.="Hotkey|" ;Add this trigger to list of all triggers on initialisation

TriggerHotkey_AllActiveTriggerObj:=Object()
TriggerHotkey_MaxAmount:=10

goto,jumpoverTriggerHotkeyLabels

EnableTriggerHotkey(ElementID)
{
	global
	
	local success:=false
	
	local temphotkey:=%ElementID%hotkey
	if temphotkey=
	{
		logger("f0",%ElementID%type " '" %ElementID%name "': Error! Hotkey is not specified.")
		MsgBox,16,% lang("Error"),% lang("The_Hotkey_is_not_set!")
		return
	}
	if (%ElementID%BlockKey=0)
		temphotkey=~%temphotkey%
	if (%ElementID%WhenRelease=1)
		temphotkey=%temphotkey% UP
	if (%ElementID%Wildcard=1)
		temphotkey=*%temphotkey%
	
	
	if (%ElementID%UseWindow =2 or %ElementID%UseWindow =3)
	{
		local tempWinTitle:=v_replaceVariables(InstanceID,ThreadID,%ElementID%Wintitle)
		local tempWinText:=v_replaceVariables(InstanceID,ThreadID,%ElementID%winText)
		local tempTitleMatchMode :=%ElementID%TitleMatchMode
		local tempahk_class:=v_replaceVariables(InstanceID,ThreadID,%ElementID%ahk_class)
		local tempahk_exe:=v_replaceVariables(InstanceID,ThreadID,%ElementID%ahk_exe)
		local tempahk_id:=v_replaceVariables(InstanceID,ThreadID,%ElementID%ahk_id)
		local tempahk_pid:=v_replaceVariables(InstanceID,ThreadID,%ElementID%ahk_pid)
		
		;If no window specified, error
		if (tempwinstring="" and tempWinText="")
		{
			logger("f0",%ElementID%type " '" %ElementID%name "': Error! No window specified")
			MsgBox,16,% lang("Error"),% lang("The hotkey %1% cannot be set!",temphotkey) " " lang("No window specified")
			return
		}
		
		tempwinstring=%tempWinTitle%
		if tempahk_class<>
			tempwinstring=%tempwinstring% ahk_class %tempahk_class%
		if tempahk_id<>
			tempwinstring=%tempwinstring% ahk_id %tempahk_id%
		if tempahk_pid<>
			tempwinstring=%tempwinstring% ahk_pid %tempahk_pid%
		if tempahk_exe<>
			tempwinstring=%tempwinstring% ahk_exe %tempahk_exe%
		
		SetTitleMatchMode,%tempTitleMatchMode%
		
		if %ElementID%findhiddenwindow=0
			DetectHiddenWindows off
		else
			DetectHiddenWindows on
		if %ElementID%findhiddentext=0
			DetectHiddenText off
		else
			DetectHiddenText on
	}


	
	if (%ElementID%UseWindow =2)
		hotkey,IfWinActive,%tempwinstring%,%tempWinText% ;,%tempExcludeTitle%,%tempExcludeText%
	else if (%ElementID%UseWindow =3)
		hotkey,IfWinExist,%tempwinstring%,%tempWinText% ;,%tempExcludeTitle%,%tempExcludeText%
	else
		hotkey,IfWinActive
	
	
	loop %TriggerHotkey_MaxAmount%
	{
		if TriggerHotkey_AllActiveTriggerObj.HasKey("Index" A_Index)
			continue
		else
		{
			
			TriggerHotkey_AllActiveTriggerObj["Index" A_Index]:=ElementID
			
			hotkey,%temphotkey%,TriggerTriggerHotkey%a_index%, UseErrorLevel on
			if ErrorLevel
			{
				logger("f0",%ElementID%type " '" %ElementID%name "': Error! The hotkey " temphotkey " cannot be set!")
				MsgBox,16,% lang("Error"),% lang("The hotkey %1% cannot be set!",temphotkey)
			}
			%ElementID%enabledHotkey:=temphotkey
			success:=true
			break
		}
	}
	
	if not success
	{
		logger("f0",%ElementID%type " '" %ElementID%name "': Error! The hotkey cannot be set! The maximum amount is reached.")
		MsgBox,16,% lang("Error"),% lang("The hotkey %1% cannot be set!",temphotkey) " " lang("The maximum amount is reached.") 
		return
	}
	
	
	
	
}

TriggerTriggerHotkey1:
TriggerTriggerHotkey2:
TriggerTriggerHotkey3:
TriggerTriggerHotkey4:
TriggerTriggerHotkey5:
TriggerTriggerHotkey6:
TriggerTriggerHotkey7:
TriggerTriggerHotkey8:
TriggerTriggerHotkey9:
TriggerTriggerHotkey10:
StringTrimLeft,tempTriggerHotkeyIndex,A_ThisLabel,20
TriggerTriggerHotkey(tempTriggerHotkeyIndex)
return


TriggerTriggerHotkey(Index)
{
	global
	local ElementID:=TriggerHotkey_AllActiveTriggerObj["Index" index]
	local temppars:=Object()
	temppars["threadVariables"]:=v_AppendAVariableToString("","A_ThisHotkey",%ElementID%enabledHotkey)
	
	r_Trigger(ElementID,temppars)
}

DisableTriggerHotkey(ID)
{
	
	global
	local index
	local success
	
	for key, value in TriggerHotkey_AllActiveTriggerObj
	{
		if (value=ID)
		{
			TriggerHotkey_AllActiveTriggerObj.delete(key)
			StringTrimLeft,index,key,5
			success:=true
			break
		}
		
	}
	
	if success
	{
		temphotkey:=%ID%enabledHotkey
		hotkey,%temphotkey%,TriggerTriggerHotkey%index%,UseErrorLevel off
		
	}
	
	
	
}


getParametersTriggerHotkey()
{
	
	parametersToEdit:=Object()
	parametersToEdit.push({type: "Label", label: lang("Hotkey")})
	parametersToEdit.push({type: "Hotkey", id: "hotkey"})
	parametersToEdit.push({type: "Label", label: lang("Options")})
	parametersToEdit.push({type: "Checkbox", id: "BlockKey", default: 1, label: lang("Block_key")})
	parametersToEdit.push({type: "Checkbox", id: "Wildcard", default: 0, label: lang("Trigger even if other keys are already held down")})
	parametersToEdit.push({type: "Checkbox", id: "WhenRelease", default: 0, label: lang("Trigger on release rather than press")})
	parametersToEdit.push({type: "Label", label: lang("Window")})
	parametersToEdit.push({type: "Radio", id: "UseWindow", default: 1, choices: [lang("Always active"), lang("Only active when the specified window is active"), lang("Only active whe the specified window exists")]})
	parametersToEdit.push({type: "Label", label: lang("Title_of_Window")})
	parametersToEdit.push({type: "Radio", id: "TitleMatchMode", default: 1, choices: [lang("Start_with"), lang("Contain_anywhere"), lang("Exactly")]})
	parametersToEdit.push({type: "Edit", id: "Wintitle", content: "String"})
	parametersToEdit.push({type: "Label", label: lang("Text_of_a_control_in_Window")})
	parametersToEdit.push({type: "Edit", id: "winText", content: "String"})
	parametersToEdit.push({type: "Checkbox", id: "FindHiddenText", default: 0, label: lang("Detect hidden text")})
	parametersToEdit.push({type: "Label", label: lang("Window_Class")})
	parametersToEdit.push({type: "Edit", id: "ahk_class", content: "String"})
	parametersToEdit.push({type: "Label", label: lang("Process_Name")})
	parametersToEdit.push({type: "Edit", id: "ahk_exe", content: "String"})
	parametersToEdit.push({type: "Label", label: lang("Unique_window_ID")})
	parametersToEdit.push({type: "Edit", id: "ahk_id", content: "String"})
	parametersToEdit.push({type: "Label", label: lang("Unique_Process_ID")})
	parametersToEdit.push({type: "Edit", id: "ahk_pid", content: "String"})
	parametersToEdit.push({type: "Label", label: lang("Hidden window")})
	parametersToEdit.push({type: "Checkbox", id: "FindHiddenWindow", default: 0, label: lang("Detect hidden window")})
	parametersToEdit.push({type: "Label", label: lang("Get_parameters")})
	parametersToEdit.push({type: "button", id: "GetWindowInformation", goto: "FunctionsForElementGetWindowInformation", label: lang("Get_Parameters")})

	
	
	return parametersToEdit
}

getNameTriggerHotkey()
{
	return lang("Hotkey")
}
getCategoryTriggerHotkey()
{
	return lang("User_interaction")
}


GenerateNameTriggerHotkey(ID)
{
	return lang("Hotkey") ": " GUISettingsOfElement%ID%hotkey
	
}

CheckSettingsTriggerHotkey(ID)
{
	
	if (GUISettingsOfElement%ID%BlockKey=1)
		tempenable:=0
	else
		tempenable:=1
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%WhenRelease 
	if (GUISettingsOfElement%ID%WhenRelease=1)
		tempenable:=0
	else
		tempenable:=1
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%BlockKey 
	
	if (GUISettingsOfElement%ID%UseWindow2=1 or GUISettingsOfElement%ID%UseWindow3=1)
		tempenable:=1
	else
		tempenable:=0
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%TitleMatchMode1 
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%TitleMatchMode2
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%TitleMatchMode3 
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%Wintitle 
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%excludeTitle
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%winText
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%ExcludeText 
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%ahk_class
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%ahk_exe
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%ahk_id 
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%ahk_pid 
	GuiControl,Enable%tempenable%,GUISettingsOfElement%ID%GetWindowInformation 
}

jumpoverTriggerHotkeyLabels:
temp= ;Do nothing