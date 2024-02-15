// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	C A M   H A N D L E R
//		Handles cameras, mostly random generation
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Min and max time
const RANDOM_CAM_TIME = [2.0, 4.0];

const CameraNames = [
	"CameraCuts_EnableChangeCam_TRUE",
	"CameraCuts_EnableChangeCam_FALSE",
	"NullCamera",
	"moment01",
	"moment02",
	"moment03",
	"moment04",
	"NullCamera",
	"guitarist_closeup",
	"guitarist_stage",
	"guitarist_mocap01",
	"guitarist_mocap02",
	"NullCamera",
	"singer_closeup",
	"singer_stage",
	"singer_mocap01",
	"singer_mocap02",
	"NullCamera",
	"bassist_closeup",
	"bassist_stage",
	"bassist_mocap01",
	"bassist_mocap02",
	"NullCamera",
	"drummer_closeup",
	"drummer_stage",
	"drummer_mocap01",
	"drummer_mocap02",
	"NullCamera",
	"longshot",
	"midshot",
	"venue_midshot",
	"generic_stage_shot",
	"NullCamera",
	"solo_guitar",
	"solo_vocal",
	"solo_drum",
	"solo_bass",
	"NullCamera",
	"single",
	"NullCamera",
	"special01",
	"special02",
	"NullCamera",
	"audience",
	"NullCamera",
	"zoom_in",
	"zoom_out",
	"NullCamera",
	"spotlight"
];

// Random camera names that we can use
const RandomCameraNames = [
	"guitarist_closeup",
	"guitarist_mocap01",
	"drummer_closeup",
	"drummer_mocap01",
	"bassist_closeup",
	"bassist_mocap01",
	"singer_closeup",
	"singer_mocap01",
	"midshot",
	"single",
];

class CamHandler
{
	constructor(converter) { this.converter = converter; }
	
	//---------------------------------------
	// Find camera by name
	//---------------------------------------
	
	FindCamera(nm)
	{
		nm = nm.toString();
		
		for (const idx in CameraNames)
		{
			if (CameraNames[idx].toLowerCase() == nm.toLowerCase())
				return parseInt(idx);
		}
		
		return this.FindCamera("generic_stage_shot");
	}
	
	//-----------------------
	// Binarize a number to specific length
	//-----------------------
	
	Binarize(num, len = 8)
	{
		return num.toString(2).padStart(len, "0");
	}
	
	//-----------------------
	// Convert camera note to number
	//-----------------------

	NoteToNumber(camVal)
	{
		var flagVal = this.Binarize(camVal.flags || 0);
		var numVal = this.Binarize(camVal.num || 0);
		var lenVal = this.Binarize(camVal.length, 16);
		
		var finalNum = flagVal + numVal + lenVal;
		
		return parseInt(finalNum, 2);
	}
	
	//-----------------------
	// Generate a random camera array
	//		(Requires time in seconds)
	//-----------------------
	
	RandomCamArray(finalTime, startTime = 0.0, opt = {})
	{
		var arr = [];
		var runningTime = startTime;
		var lastCamera = "";
		
		while (runningTime < finalTime)
		{
			var startTime = runningTime;
			var rndTime = RANDOM_CAM_TIME[0] + (Math.random() * (RANDOM_CAM_TIME[1] - RANDOM_CAM_TIME[0]));
			runningTime += rndTime;
			var endTime = runningTime;
			
			// Find unique camera
			var cam = "";
			
			// FORCE CAMERA
			if (opt.debug_drummer)
				cam = "drummer_mocap02";
			else if (opt.debug_guitarist)
				cam = "guitarist_mocap02";
			else if (opt.debug_bassist)
				cam = "bassist_mocap02";
			else if (opt.debug_singer)
				cam = "singer_mocap02";
			else if (opt.debug_all)
				cam = "midshot";

			// If cam wasn't forced, find a random one
			if (cam == "")
			{
				while (cam == lastCamera)
				{
					cam = RandomCameraNames[ Math.floor(Math.random() * RandomCameraNames.length) ];
					
					// Skip singer camera, for the moment
					if (cam.toLowerCase().indexOf("singer") >= 0 && !this.converter.hasSinger)
						cam = lastCamera;
				}
			}
			
			lastCamera = cam;
			
			var msTime = Math.floor(startTime * 1000.0);
			arr.push(msTime);
			
			var camLength = Math.floor((endTime - startTime) * 1000.0);
			var camIdx = this.FindCamera(cam);
			var noteNum = this.NoteToNumber({num: camIdx, length: camLength, flags: 100});
			
			arr.push(noteNum);
		}
			
		return arr;
	}
}

module.exports = CamHandler;
