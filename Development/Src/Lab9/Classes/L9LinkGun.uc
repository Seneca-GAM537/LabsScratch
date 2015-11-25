class L9LinkGun extends UTWeap_LinkGun;

function bool CanAttack(Actor Other)
{
	return VSize(Instigator.Location - Other.Location) <= WeaponRange;
}

function byte BestMode()
{
	return 0;
}

DefaultProperties
{
	WeaponRange=300
}
