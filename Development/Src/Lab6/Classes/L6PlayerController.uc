class L6PlayerController extends UTPlayerController;

var vector offset;

exec function IncX()
{
	offset.X += 100;
}

exec function DecX()
{
	offset.X -= 100;
}

exec function IncY()
{
	offset.Y += 100;
}

exec function DecY()
{
	offset.Y -= 100;
}

exec function IncZ()
{
	offset.Z += 100;
}

exec function DecZ()
{
	offset.Z -= 100;
}

DefaultProperties
{
	bBehindView = true
	offset = (Y=-500, X=-500, Z=400)
}
