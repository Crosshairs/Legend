class MythicGameInfo extends GameInfo;

auto State PendingMatch
{
Begin:
	StartMatch();
}

defaultproperties
{
	HUDType=class'MythicGame.BaseHUD'
	PlayerControllerClass=class'MythicGame.BasePlayerController'
	DefaultPawnClass=class'MythicGame.BasePawn'
	bDelayedStart=false
}


