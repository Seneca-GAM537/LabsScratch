class L9Game extends UTGame;

function RestartPlayer(Controller aPlayer)
{
	if (L9Bot(aPlayer) != None && aPlayer.IsInState('Dead'))
	{
		aPlayer.Destroy();
		return;
	}

	super.RestartPlayer(aPlayer);
}

function Logout(Controller Exiting)
{
	if (L9Bot(Exiting) != None) return;

	super.Logout(Exiting);
}

DefaultProperties
{
	MapPrefixes[0]="L9"
	DefaultInventory[0]=class'L9LinkGun'
}
