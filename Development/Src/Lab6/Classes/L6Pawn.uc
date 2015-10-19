class L6Pawn extends UTPawn;



simulated function bool CalcCamera(
	float fDeltaTime, out vector out_CamLoc,
	out rotator out_CamRot, out float out_FOV )
{
	out_camLoc = location + vect(0, -500, 400);

	return true;
}

DefaultProperties
{
}
