﻿


API_Editor_EditGUIshow(par_FlowID)
{
	global
	
	local retvalue
	logger("t2", A_ThisFunc " called")
	
	for threadID, threadpars in global_Allthreads
	{
		if (threadpars.flowID = par_FlowID)
		{
			_share["editor" par_FlowID].tasks.push({name: "EditGUIshow"})
			break
		}
	}
	
	
	logger("t2", A_ThisFunc " finished")
	return retvalue
}