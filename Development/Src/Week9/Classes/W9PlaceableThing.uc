class W9PlaceableThing extends Actor
	placeable
	ClassGroup(Week9);

function Touch(Actor Other, PrimitiveComponent OtherComp,
	Vector HitLocation, Vector HitNormal)
{
	`Log("Touch START "$Other);	
}

function PostTouch(Actor Other)
{
	`Log("post touch... "$Other);
}

function Untouch(Actor Other)
{
	`Log("Touch END "$Other);
}

function Bump(Actor Other, PrimitiveComponent OtherComp,
	Vector HitNormal)
{
	`Log("BUMP "$other);
}

DefaultProperties
{
	Begin Object Class=StaticMeshComponent Name=MySM
		StaticMesh=StaticMesh'NodeBuddies.3D_Icons.NodeBuddy_Climb'
		Translation=(Z=-96)
	End Object
	Components.Add(MySM)
	bBlockActors = True
	bCollideActors = True
}
