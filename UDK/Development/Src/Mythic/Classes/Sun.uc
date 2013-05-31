class Sun extends DominantDirectionalLightMovable
	DLLBind(DevUtilityDLL)
	placeable
	ClassGroup(TeamDev, Weather);

var Color Col;
var float fParam_1;
var float fParam_2;
var float fParam_3;
var float fParam_4;
var float DeltaTime;
var Rotator rot;
var Rotator newRot;

dllimport final function float kelvinToRed(float temp);
dllimport final function float kelvinToGreen(float temp);
dllimport final function float kelvinToBlue(float temp);
dllimport final function float getGameTime();

function setColor(float r, float g, float b, float bright)
{
	Col.R = r;
	Col.G = g;
	Col.B = b;

	LightComponent.SetLightProperties(bright, Col);
	LightComponent.bRenderLightShafts = true;
	LightComponent.BloomTint = Col;
	LightComponent.BloomScale = 4.0;
	LightComponent.UpdateLightShaftParameters();
	LightComponent.UpdateColorAndBrightness();
}

function sunColor(float time)
{
	local float kelvin;
	local float brightness;
	kelvin = Abs(2500 * Sin((time*Pi)/43200)) + 2900;
	brightness = Abs(4 * Sin((time*Pi)/43200) ) + 1;

	fParam_1 =  kelvinToRed(kelvin);
	fParam_2 =  kelvinToGreen(kelvin);
	fParam_3 =  kelvinToBlue(kelvin);
	setColor(fParam_1, fParam_2, fParam_3, brightness);
}

function updateColor()
{
	fParam_4 = getGameTime();
	sunColor(fParam_4);

}

function statusUpdate()
{
	fParam_4 = getGameTime();
	if(fParam_4 > 43200)
	{
		Spawn(class'Moon');
		Destroy();
	}
}

function rotateSun()
{
	SetPhysics(PHYS_Rotating);
	RotationRate = rot(0, 0, 18);
}

function updateRotation()
{
	local float time;
	time = getGameTime();
	rot.Roll = 0;
	rot.Yaw = 0;
	newRot.Roll = 0;
	newRot.Yaw = 0;
	rot.Pitch = newRot.Pitch;
	newRot.Pitch = (360*time)/86400;
	newRot.Pitch += 180;
	if(newRot.Pitch > 360)
	{
		newRot.Pitch -= 360;
	}
	newRot.Pitch *= DegToUnrRot;
	newRot.Pitch = Round(newRot.Pitch);
	SetRotation(RInterpTo(rot, newRot, DeltaTime, 90000, true));
}

auto state Ready
{
begin:
	statusUpdate();
	updateColor();
	rotateSun();
	SetTimer(0.033, true, 'updateColor');
	SetTimer(5, true, 'updateRotation');
	SetTimer(0.033, true, 'statusUpdate');
	
}

DefaultProperties
{
	/*Begin Object Class=LightFunction Name=CloudShaderFunction
			SourceMaterial=Material'JW_LightEffects.Materials.M_CloudShadow'
			Name="CloudShaderFunction"
			ObjectArchetype=LightFunction'Engine.Default__LightFunction'
	End Object

	Begin Object Name=DominantDirectionalLightComponent0 Archetype=DominantDirectionalLightComponent'teamdev.Default__Sun:DominantDirectionalLightComponent0'
		Function=CloudShaderFunction
	End Object
	*/
	bNoDelete=false
	TickGroup=TG_PreAsyncWork
	
}
