class L6Pawn extends UTPawn;

simulated function bool CalcCamera(
	float fDeltaTime, out vector out_CamLoc,
	out rotator out_CamRot, out float out_FOV )
{
	local L6PlayerController p;

	out_camLoc = location;
	p = L6PlayerController(Controller);
	if (p != None) {
		out_CamLoc += p.offset;
	}

	//out_CamRot = rot(-4000, 8192, 0);
	out_CamRot = rotator(location - out_camLoc);

	return true;
}

DefaultProperties
{
}
