class BasePlayerInput extends PlayerInput within BasePlayerController
	dependson(BasePlayerController);

//Stores mouse position in the game
var privatewrite IntPoint MousePosition;

event PostBeginPlay()
{
}

//updates the mouse position
function UpdateHUDMousePos()
{
	if(myHUD != none) 
	{
		MousePosition.X = MousePosition.X + aMouseX;
  		MousePosition.Y = MousePosition.Y - aMouseY;
		MousePosition.X = Clamp(MousePosition.X, 0, myHUD.SizeX); 
		MousePosition.Y = Clamp(MousePosition.Y, 0, myHUD.SizeY);
	}
}

event PlayerInput(float DeltaTime)
{
	UpdateHUDMousePos();
	Super.PlayerInput(DeltaTime);
}

DefaultProperties
{
}
