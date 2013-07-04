class CP_PlayerCamera extends BaseCamera
	dependson(BaseHUD);

struct CameraBoundingBox
{
	var Vector2D Deadzone; //dimensions of the deadzone of the bounding box
	var Vector2D MovementZone; //dimensions of the area that causes the camera to move (dimensions only for one side, not both)
};

var CameraBoundingBox BB;

var name PlayerView;

event PostBeginPlay()
{
	super.PostBeginPlay();
}

function UpdateViewTarget(out TViewTarget OutVT, float DeltaTime)
{
	//the position of the cursor, the size of the viewport (both assigned from class instances below),
	//and the distance (X & Y) the cursor is from the deadzone
	local Vector2D CursorPosition, ViewPortSize, CursorOverExtension;
	//the location of the camera in 3d space
	local Vector CameraLoc;
	//the rotation of the camera currently and the rotation that the camera will be set to
	local Rotator CameraRot, RotReturn;

	//the instances for the cursor and screen
	local BasePlayerInput CursorInfo;
	local BaseHUD ScreenInfo;

	//typecasting the instances to get cursor and screen info
	CursorInfo = BasePlayerInput(PCOwner.PlayerInput);
	ScreenInfo = BaseHUD(PCOwner.myHUD);

	//assigning local variables to corresponding class instance info
	CursorPosition.X = CursorInfo.MousePosition.X;
	CursorPosition.Y = CursorInfo.MousePosition.Y;
	ViewPortSize.X = ScreenInfo.SizeX;
	ViewPortSize.Y = ScreenInfo.SizeY;
	
	//assigning other miscellaneous info
	CameraLoc = Location;
	CameraRot = GetCameraRotation();
	BB.MovementZone = (ViewPortSize - BB.Deadzone)/2;
	CursorOverExtension = CursorPosition - (BB.Deadzone + BB.MovementZone);

	//figuring out generally where the mouse is ( [left of/right of/inside] the deadzone) and calculating Cursor Over-Extension along the X-axis
	if(CursorPosition.X < BB.MovementZone.X)
	{
		CursorOverExtension.X = (BB.MovementZone.X - CursorPosition.X) * -1; //multiply by -1 to declare the cursor is left of the deadzone
	}
	else if(CursorPosition.X > (ViewPortSize.X - BB.MovementZone.X))
	{
		CursorOverExtension.X = CursorPosition.X - (ViewPortSize.X - BB.MovementZone.X);
	}
	else
	{
		CursorOverExtension.X = 0;
	}
	//figuring out generally where the mouse is ( [above/below/inside] the deadzone) and calculating Cursor Over-Extension   along the Y-axis
	if(CursorPosition.Y < BB.MovementZone.Y)
	{
		CursorOverExtension.Y = BB.MovementZone.Y - CursorPosition.Y;
	}
	else if(CursorPosition.Y > (ViewPortSize.Y - BB.MovementZone.Y))
	{
		CursorOverExtension.Y = (CursorPosition.Y - (ViewPortSize.Y - BB.MovementZone.Y)) * -1; //multiply by -1 to declare the cursor below the deadzone
	}
	else
	{
		CursorOverExtension.Y = 0;
	}

	//calculating camera velocity
	CameraVelocity.Yaw = ( (CursorOverExtension.X / BB.MovementZone.X) * CameraMaxVelocity.X ) * DeltaTime;
	CameraVelocity.Pitch = ( (CursorOverExtension.Y / BB.MovementZone.Y) * CameraMaxVelocity.Y ) * DeltaTime;

	//making final calculations
	RotReturn = CameraRot + (CameraVelocity * DegToUnrRot);

	//making it so 0 <= Yaw <= 360
	//did not use mod because of its problems with negative numbers
	if(RotReturn.Yaw > (360 * DegToUnrRot))
	{
		RotReturn.Yaw -= (360 * DegToUnrRot);
	}
	else if(RotReturn.Yaw < 0)
	{
		RotReturn.Yaw += (360 * DegToUnrRot);
	}

	//moving camera only
	SetRotation(RotReturn);
	SetLocation(CameraLoc);

	//moving camera and pawn as one unit
	OutVT.POV.FOV = DefaultFOV;
	OutVT.POV.Location = CameraLoc;
	OutVT.POV.Rotation = RotReturn;
	super.UpdateViewTarget(OutVT, DeltaTime);
}

DefaultProperties
{
	CameraMaxVelocity = (X=360, Y=360)
	BB = ( Deadzone = (X=400, Y=250) )
	DefaultFOV=90.f
}
