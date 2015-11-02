class W8Game extends UTGame;

exec function CreateBall()
{
	spawn(class'W8Ball');
}

exec function CreateBox()
{
	spawn(class'W8Box');
}

exec function CreateTriangle()
{
	spawn(class'W8Triangle');
}

exec function IterateSelectable()
{
	local Actor actor;
	local W8Selectable selectable;

	`Log("Iteration start");
	foreach AllActors(class'Actor',
		actor,
		class'W8Selectable')
	{
		selectable = W8Selectable(actor);
		`Log("Iteration found -> "
			$selectable.SaySomething());
	}
}

DefaultProperties
{
	bUseClassicHUD=true
	MapPrefixes[0]="W8"
	HUDType=class'W8HUD'
}
