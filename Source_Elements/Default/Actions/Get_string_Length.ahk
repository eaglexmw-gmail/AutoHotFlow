﻿;Always add this element class name to the global list
AllElementClasses.push("Action_Get_String_Length")

;Element type of the element
Element_getElementType_Action_Get_String_Length()
{
	return "Action"
}

;Name of the element
Element_getName_Action_Get_String_Length()
{
	return lang("Get_String_Length")
}

;Category of the element
Element_getCategory_Action_Get_String_Length()
{
	return lang("Variable")
}

;This function returns the package of the element.
;This is a reserved function for future releases,
;where it will be possible to install additional add-ons which provide more elements.
Element_getPackage_Action_Get_String_Length()
{
	return "default"
}

;Minimum user experience to use this element.
;Elements which are complicated or rarely used by beginners should not be visible to them.
;This will help them to get started with AHF
Element_getElementLevel_Action_Get_String_Length()
{
	;"Beginner" or "Advanced" or "Programmer"
	return "Beginner"
}

;Icon path which will be shown in the background of the element
Element_getIconPath_Action_Get_String_Length()
{
}

;Returns a list of all parameters of the element.
;Only those parameters will be saved.
Element_getParameters_Action_Get_String_Length()
{
	parametersToEdit:=Object()
	
	parametersToEdit.push({id: "Varname"})
	parametersToEdit.push({id: "VarValue"})
	parametersToEdit.push({id: "expression"})
	
	return parametersToEdit
}

;Returns an array of objects which describe all controls which will be shown in the element settings GUI
Element_getParametrizationDetails_Action_Get_String_Length(Environment)
{
	parametersToEdit:=Object()
	
	parametersToEdit.push({type: "Label", label: lang("Output variable name")})
	parametersToEdit.push({type: "Edit", id: "Varname", default: "NewLength", content: "VariableName", WarnIfEmpty: true})
	parametersToEdit.push({type: "Label", label:  lang("Input string")})
	parametersToEdit.push({type: "Edit", id: "VarValue", default: "Hello World", content: ["String", "Expression"], contentID: "expression", contentDefault: "string", WarnIfEmpty: true})
	
	return parametersToEdit
}

;Returns the detailed name of the element. The name can vary depending on the parameters.
Element_GenerateName_Action_Get_String_Length(Environment, ElementParameters)
{
	return lang("Get_String_Length") "`n" ElementParameters.Varname " = |" ElementParameters.VarValue "|"
}

;Called every time the user changes any parameter.
;This function allows to check the integrity of the parameters. For example you can:
;- Disable options which are not available because of other options
;- Correct misconfiguration
Element_CheckSettings_Action_Get_String_Length(Environment, ElementParameters)
{
	
}


;Called when the element should execute.
;This is the most important function where you can code what the element acutally should do.
Element_run_Action_Get_String_Length(Environment, ElementParameters)
{
	Varname := x_replaceVariables(Environment, ElementParameters.Varname)
	
	if not x_CheckVariableName(Varname)
	{
		;On error, finish with exception and return
		x_finish(Environment, "exception", lang("%1% is not valid", lang("Ouput variable name '%1%'", varname)))
		return
	}

	if (ElementParameters.Expression = 2)
	{
		evRes := x_EvaluateExpression(Environment, ElementParameters.VarValue)
		if (evRes.error)
		{
			;On error, finish with exception and return
			x_finish(Environment, "exception", lang("An error occured while parsing expression '%1%'", ElementParameters.VarValue) "`n`n" evRes.error) 
			return
		}
		else
		{
			VarValue:=evRes.result
		}
	}
	else
		VarValue := x_replaceVariables(Environment, ElementParameters.VarValue)


	StringLen,Result,VarValue
	x_SetVariable(Environment,Varname,Result)
	
	x_finish(Environment,"normal")
	return
}

;Called when the execution of the element should be stopped.
;If the taks takes more than several seconds, then it is up to you to make it stoppable.
Element_stop_Action_Get_String_Length(Environment, ElementParameters)
{
	
}

