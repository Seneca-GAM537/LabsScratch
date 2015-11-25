class L9Bot extends UTBot;

var float AggroDistance;
var float EscapeDistance;
var float AttackDistance;
var float PatrolPointReachedThreshold;
var L9PatrolPath NextPatrolPoint;
var L9AISpawner MySpawner;

var private Actor _intermediate;
var private float _dist;

function EnterPatrolPath(L9PatrolPath path)
{
	NextPatrolPoint = Path;
	MySpawner = L9AISpawner(path);

	if (path == None)
	{
		GotoState();
	}
	else
	{
		GotoState('FollowingPatrolPath', 'Begin');
	}
}

function bool PatrolPointReached()
{
	if (Pawn == None || NextPatrolPoint == None) return false;

	return VSize(Pawn.Location - NextPatrolPoint.Location) <= PatrolPointReachedThreshold;
}

function AcquireEnemy(Pawn p)
{
	Enemy = p;
	Focus = p;
	GotoState('HuntingEnemy', 'Begin');
}

function PawnDied(Pawn p)
{
	super.PawnDied(p);
	if (MySpawner != None) MySpawner.BotsToSpawn++;
}

function NotifyTakeHit(Controller InstigatedBy, Vector HitLocation, int Damage, class<DamageType> damageType, Vector momentum)
{
	super.NotifyTakeHit(InstigatedBy, HitLocation, Damage, damageType, Momentum);
	if (PlayerController(InstigatedBy) != None && InstigatedBy.Pawn != None)
	{
		AcquireEnemy(InstigatedBy.Pawn);
	}
}

function protected ExecuteWhatToDoNext()
{
	local PlayerController pc;

	if (Pawn == None) return;

	pc = GetALocalPlayerController();
	if (pc.Pawn != None && VSize(pc.Pawn.Location - Pawn.Location) <= AggroDistance)
	{
		AcquireEnemy(pc.Pawn);
		return;
	}

	if (NextPatrolPoint != None)
	{
		if (PatrolPointReached())
		{
			NextPatrolPoint = NextPatrolPoint.NextNode;
		}

		GotoState('FollowingPatrolPath', 'Begin');
	}
}

auto state FollowingPatrolPath
{
Begin:
	if (NextPatrolPoint != None)
	{
		if (ActorReachable(NextPatrolPoint))
		{
			MoveToward(NextPatrolPoint);
		}
		else
		{
			_intermediate = FindPathToward(NextPatrolPoint);
			MoveToward(_intermediate);
		}
	}
	LatentWhatToDoNext();
}

state HuntingEnemy
{
Begin:
	if (Enemy != None && Pawn != None)
	{
		_dist = VSize(Pawn.Location - Enemy.Location);
		if (_dist > EscapeDistance)
		{
			Enemy = None;
			Focus = None;
		}
		else if (_dist <= AttackDistance)
		{
			SwitchToBestWeapon();
			FireWeaponAt(Enemy);
		}
		else
		{
			if (ActorReachable(Enemy))
			{
				MoveToward(Enemy);
			}
			else
			{
				_intermediate = FindPathToward(Enemy);
				MoveToward(_intermediate);
			}
		}
	}
	LatentWhatToDoNext();
}

DefaultProperties
{
	PatrolPointReachedThreshold=50
	AggroDistance=600
	EscapeDistance=1500
	AttackDistance=300
}
