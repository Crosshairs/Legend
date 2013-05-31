class Moon extends DominantDirectionalLightMovable
	DLLBind(DevUtilityDLL)
	placeable
	ClassGroup(TeamDev, Weather);

var Color Col;
var float fParam_1;
var Rotator rot;
var Rotator newRot;
var float DeltaTime;

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

function statusUpdate()
{
	fParam_1 = getGameTime();
	if(fParam_1 <= 43200)
	{
		Spawn(class'Sun');
		Destroy();
	}
}

function rotateMoon()
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
	setColor(225, 255, 255, 2.0);
	rotateMoon();
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