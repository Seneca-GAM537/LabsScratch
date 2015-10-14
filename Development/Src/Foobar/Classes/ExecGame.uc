class ExecGame extends UTDeathmatch;

var int counter;

exec function Increment()
{
	counter++;
}

exec function PrintOut()
{
	`Log("Current counter value is "$counter);
}

exec function IteratePawns()
{
	local Pawn iterPawn;

	foreach AllActors(class'Pawn', iterPawn)
	{
		`log("Pawn name: "$iterPawn.name$", location: "$iterPawn.location);
	}
}

DefaultProperties
{
	counter = 0
	MapPrefixes[0] = "Exec"
}
