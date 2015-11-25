class L9AISpawner extends L9PatrolPath;

var(Spawner) int BotsToSpawn;
var(Spawner) float SpawnInterval;

function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(SpawnInterval, true);
}

function Timer()
{
	if (BotsToSpawn <= 0) return;

	if (SpawnBot() != None) BotsToSpawn--;
}

function L9Bot SpawnBot()
{
	local L9Bot NewBot;
    local Pawn NewPawn;

    NewBot = Spawn(class'L9Bot');
    if (NewBot == None)
    {
        `log("Couldn't spawn "$class'L9Bot'$" at "$self);
        return None;
    }

    NewPawn = Spawn(class'UTPawn',,,Location,Rotation);
    if ( NewPawn == None )
    {
        `log("Couldn't spawn "$class'UTPawn'$" at "$self);
        NewBot.Destroy();
        return None;
    }

    NewPawn.SetAnchor(self);
    NewPawn.LastStartTime = WorldInfo.TimeSeconds;
    NewBot.Possess(NewPawn, false);
    NewBot.Pawn.PlayTeleportEffect(true, true);
    NewBot.ClientSetRotation(NewBot.Pawn.Rotation, TRUE);
    WorldInfo.Game.AddDefaultInventory(NewPawn);
    WorldInfo.Game.SetPlayerDefaults(NewPawn);

    NewBot.EnterPatrolPath(self);

    return NewBot;
}

DefaultProperties
{
	Begin Object NAME=Sprite
		Sprite=Texture2D'EditorResources.Corpse'
	End Object

	BotsToSpawn=3
	SpawnInterval=2

	bStatic=false
}
