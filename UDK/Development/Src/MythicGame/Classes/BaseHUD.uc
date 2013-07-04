class BaseHUD extends HUD
	dependson(BasePlayerInput);

// The texture which represents the cursor on the screen
var const Texture2D CursorTexture;

// The color of the cursor
var const Color CursorColor;

// The position of the cursor on the screen
var IntPoint CursorPos;

// The dimensions of the screen
var Vector2D ScreenSize;

event PostRender()
{
	local BasePlayerInput BPInput;

	Super.PostRender();

	BPInput = BasePlayerInput(PlayerOwner.PlayerInput);

	//setting screen size and cursor position
	ScreenSize.X = Canvas.ClipX;
	ScreenSize.Y = Canvas.ClipY;
	CursorPos.X = BPInput.MousePosition.X;
	CursorPos.Y = BPInput.MousePosition.Y;

	if (BPInput != none && CursorTexture != none)
	{
		// Set the canvas position to the mouse position
		Canvas.SetPos(CursorPos.X, CursorPos.Y); 
		// Set the cursor color
		Canvas.DrawColor = CursorColor;
		// Draw the texture on the screen
		Canvas.DrawTile(CursorTexture, CursorTexture.SizeX, CursorTexture.SizeY, 0.f, 0.f, CursorTexture.SizeX, CursorTexture.SizeY,, true);
	}
}

function DrawPlayerOptions()
{

}

DefaultProperties
{
	CursorColor=(R=255,G=0,B=0,A=255)
	CursorTexture=Texture2D'EngineResources.Cursors.Arrow'
}
