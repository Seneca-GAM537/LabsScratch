class W10Spawner extends PathNode
	placeable
	ClassGroup(Lab9);

DefaultProperties
{
	Begin Object Class=StaticMeshComponent Name=DisplayMesh
		StaticMesh=StaticMesh'NodeBuddies.NodeBuddy_PerchUp'
	End Object
	Components.Add(DisplayMesh)
	bBlockActors=false
	bCollideWorld=false
}
