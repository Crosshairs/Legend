class BaseCamera extends Camera;

//is the player controlling this camera?
var bool bPlayerControlled;
			 	 
//the maximum speed at which the camera can move (in deg/sec)
var Vector2D CameraMaxVelocity;
						    
//the current speed of the camera's movement (in deg/sec)
var Rotator CameraVelocity;

//should the pitch should be constrained to +/-87 degrees?
var bool bConstrainedPitch;

function UpdateViewTarget(out TViewTarget OutVT, float DeltaTime)
{
	if(bConstrainedPitch)
	{
		OutVT.POV.Rotation.Pitch = Clamp(OutVT.POV.Rotation.Pitch, (-87 * DegToUnrRot), (87 * DegToUnrRot));// make it so they can't look upside down (without the use of Roll) [Also note that 6 degrees are taken away so they cannot look perfectly down or up]
	}
}

DefaultProperties
{
	bConstrainedPitch = true
}											 

