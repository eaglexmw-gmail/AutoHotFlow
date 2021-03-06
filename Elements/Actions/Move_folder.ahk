﻿iniAllActions.="Move_folder|" ;Add this action to list of all actions on initialisation

runActionMove_folder(InstanceID,ThreadID,ElementID,ElementIDInInstance)
{
	global
	
	local tempFrom:=% v_replaceVariables(InstanceID,ThreadID,%ElementID%folder)
	local tempTo:=% v_replaceVariables(InstanceID,ThreadID,%ElementID%destFolder)
	if  DllCall("Shlwapi.dll\PathIsRelative","Str",tempFrom)
		tempFrom:=SettingWorkingDir "\" tempFrom
	if  DllCall("Shlwapi.dll\PathIsRelative","Str",tempTo)
		tempTo:=SettingWorkingDir "\" tempTo
	if tempFrom=
	{
		logger("f0","Instance " InstanceID " - " %ElementID%type " '" %ElementID%name "': Error! Source folder not specified.")
		MarkThatElementHasFinishedRunning(InstanceID,ThreadID,ElementID,ElementIDInInstance,"exception",lang("%1% is not specified.",lang("Source folder")))
		return
	}
	
	FileMoveDir,% tempFrom,% tempTo,% %ElementID%Overwrite
	
	if ErrorLevel
	{
		logger("f0","Instance " InstanceID " - " %ElementID%type " '" %ElementID%name "': Error! Folder not moved.")
		MarkThatElementHasFinishedRunning(InstanceID,ThreadID,ElementID,ElementIDInInstance,"exception",lang("Folder not moved"))
		return
	}
	
	MarkThatElementHasFinishedRunning(InstanceID,ThreadID,ElementID,ElementIDInInstance,"normal")
	return
}
getNameActionMove_folder()
{
	return lang("Move_folder")
}
getCategoryActionMove_folder()
{
	return lang("Files")
}

getParametersActionMove_folder()
{
	global
	
	parametersToEdit:=Object()
	parametersToEdit.push({type: "Label", label: lang("Source folder")})
	parametersToEdit.push({type: "Folder", id: "folder", label: lang("Select a folder")})
	parametersToEdit.push({type: "Label", label: lang("Destination folder")})
	parametersToEdit.push({type: "Folder", id: "destFolder", label: lang("Select folder")})
	parametersToEdit.push({type: "Checkbox", id: "Overwrite", default: 0, label: lang("Overwrite existing files")})

	return parametersToEdit
}

GenerateNameActionMove_folder(ID)
{
	global
	;MsgBox % %ID%text_to_show
	
	
	return lang("Move_folder") " " lang("From %1% to %2%", GUISettingsOfElement%ID%folder,GUISettingsOfElement%ID%destFolder) 
	
}


