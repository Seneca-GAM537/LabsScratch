class LabExampleGame extends GameInfo;

var int myVar;

function PostBeginPlay()
{
	local String myString;

	`Log("I've been run! I am "@self);
	ScriptTrace();
	myString = GetScriptTrace();
	`Log("Trace complete. Trace again: "$myString);
	super.PostBeginPlay();
}

DefaultProperties
{
	myVar = 6;
}
