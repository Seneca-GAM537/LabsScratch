class W10Game extends UTGame;

exec function AddBots(int Num)
{
	local int i;
	DesiredPlayerCount += Num;
	for (i = 0; i < Num && AddBot() != None; i++)
	{
		`log("custom added bot "$i);
	}
}

function NavigationPoint FindPlayerStart(
	Controller Player, optional byte InTeam, optional string incomingName)
{
	local W10Bot myBot;
	local W10Spawner spawner;

	myBot = W10Bot(Player);
	if (myBot != None)
	{
		foreach AllActors(class'W10Spawner', spawner)
		{
			`log("Returning spawner "$spawner);
			return spawner;
		}
	}

	return super.FindPlayerStart(Player, InTeam, incomingName);
}

DefaultProperties
{
	MapPrefixes[0]="W10"
	BotClass=class'W10Bot'
}
