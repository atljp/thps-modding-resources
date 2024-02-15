var elemViewport, elemTopContainer;
var elemScreenshot, elemScreenshotText, elemTimeline;
var elemTimeText, elemCameraList, elemActionContainer;
var elemScrubber;
var audioPlayer;

const songName = "song.ogg";

var activeCameraItem = -1;
var curMarkers = [];
var activeMarkers = [];
var lastClickedTimelinePos = -1;
var lastClickedMarker = null;
var draggingMarker = null;
var pendingMarker = null;
var holdingShift = false;
var holdingCtrl = false;
var curScreenshot = "";

var dragMousePos = 0;

var DEFAULT_CAMERA = "generic_stage_shot";

const CameraIDs = [
	"audience",
	"bassist_closeup",
	"bassist_mocap01",
	"bassist_mocap02",
	"bassist_stage",
	"drummer_closeup",
	"drummer_mocap01",
	"drummer_mocap02",
	"drummer_stage",
	"generic_stage_shot",
	"guitarist_closeup",
	"guitarist_mocap01",
	"guitarist_mocap02",
	"guitarist_stage",
	"longshot",
	"midshot",
	"singer_closeup",
	"singer_mocap01",
	"singer_mocap02",
	"singer_stage",
	"single",
	"solo_bass",
	"solo_drum",
	"solo_guitar",
	"spotlight",
	"venue_midshot",
	"zoom_in"
];

//----------------------------------
// Element we clicked on
//----------------------------------

function GetClickedElement()
{
	return window.event.target || window.event.srcElement;
}

//----------------------------------
// Format time into mins and secs
//----------------------------------

function FormatTime(seconds)
{
	var sec = Math.floor(seconds);
	var mins = Math.floor(seconds / 60);
	sec -= (mins * 60);
	
	return [0, mins, sec];
}

//----------------------------------
// Set current time
//----------------------------------

function SetTimeText(seconds)
{
	var fmt = FormatTime(seconds);
	
	var minF = fmt[1].toString().padStart(2, "0");
	var secF = fmt[2].toString().padStart(2, "0");
	var secPct = seconds - Math.floor(seconds);
	var pctF = Math.floor(secPct * 100).toString().padStart(2, "0");

	elemTimeText.innerText = "00:" + minF + ":" + secF + ":" + pctF;
}

//----------------------------------
// Set screenshot
//----------------------------------

function SetScreenshot(id)
{
	curScreenshot = id;
	console.log("Set screenshot " + id + ".");
	elemScreenshot.src = "screens/" + id + ".jpg";
	elemScreenshotText.style.display = "block";
	elemScreenshotText.innerText = id;
}

//----------------------------------
// Maintain aspect ratio of viewport
//----------------------------------

const ensureViewportSize = new ResizeObserver(entries => {
	var rect = entries[0].contentRect;
	var height = rect.height;
	
	// Set width and height of viewport based on top size
	var newWidth = Math.floor(height * 1.77);

	elemViewport.style.width = newWidth;
});

//----------------------------------
// Highlight or unhighlight cam by index
//----------------------------------

function HighlightCamElement(idx, highlighted)
{
	var elem = document.querySelector("#camitem_" + idx);
	if (!elem)
		return;
		
	elem.className =  highlighted ? "camitem_container_active" : "camitem_container";
}

//----------------------------------
// Update active camera item
//----------------------------------

function ClickCameraItem()
{
	var elem = GetClickedElement();
	var parent = elem.parentNode;
	var idx = Array.prototype.indexOf.call(parent.children, elem);
	
	console.log("Active camera type is " + idx);
	
	for (var i=0; i<CameraIDs.length; i++)
		HighlightCamElement(i, (i == idx));
		
	activeCameraItem = idx;
}

//----------------------------------
// Populate camera list with elements
//----------------------------------

function AddCameraElem(idx)
{
	var camText = CameraIDs[idx];
	
	var itemCont = document.createElement('div');
	itemCont.className = "camitem_container";
	itemCont.innerText = CameraIDs[idx];
	itemCont.id = "camitem_" + idx;
	itemCont.onclick = ClickCameraItem;
	
	elemCameraList.appendChild(itemCont);
}

function PopulateCameraList()
{
	for (var i=0; i<CameraIDs.length; i++)
		AddCameraElem(i);
}

//----------------------------------

function ActionAddMarker()
{
	if (activeCameraItem < 0)
		return;
		
	AddMarker(audioPlayer.currentTime, CameraIDs[activeCameraItem]);
}

function ActionPlayPause()
{
	if (audioPlayer)
	{
		if (audioPlayer.paused)
			audioPlayer.play();
		else
			audioPlayer.pause();
	}
}

//----------------------------------
// Add an action button
//----------------------------------

function AddActionButton(image, func, tooltip = "Button")
{
	var but = document.createElement('div');
	but.className = 'actionButton';
	but.onclick = func;
	but.title = tooltip;
	but.setAttribute("draggable", false);
	
	var img = document.createElement('img');
	img.className = 'actionButtonImage';
	img.src = image;
	img.setAttribute("draggable", false);
	
	but.appendChild(img);
	
	elemActionContainer.appendChild(but);
}

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//----------------------------------
// Update scrubber position
//----------------------------------

function UpdateScrubberPos()
{
	var curTime = audioPlayer.currentTime;
	var endTime = audioPlayer.duration;
	var pct = curTime / endTime;
	
	// Figure out where to place the marker
	var x = TimelinePosAt(pct);
	elemScrubber.style.left = x - 1;
	
	SetTimeText(curTime);
	
	var lastMarker = null;
	
	// Sync to markers if we have any
	for (var m=0; m<curMarkers.length; m++)
	{
		var mrk = curMarkers[m];
		if (curTime < mrk.time)
			break;
			
		lastMarker = mrk;
	}
	
	var id = DEFAULT_CAMERA;
	if (lastMarker)
		id = lastMarker.id;
	
	// SYNC UP CAMERA PIC
	if (id !== curScreenshot)
		SetScreenshot(id);
}

//----------------------------------
// Create song audio element
//----------------------------------

function CreateSongAudio()
{
	// Remove element if exists
	if (audioPlayer)
		audioPlayer.remove();
		
	// Create new element
	var aud = document.createElement('audio');
	aud.src = songName;
	aud.type = "audio/ogg";
	aud.volume = 0.1;
	
	audioPlayer = aud;
}

//----------------------------------
// Get timeline pos at pct
//----------------------------------

function TimelinePosAt(val, isTime = false)
{
	// Get width of timeline element
	var w = elemTimeline.offsetWidth;
	
	var pct = isTime ? (val / audioPlayer.duration) : val;;
	var newPos = Math.floor(w * pct);
	
	return newPos;
}

//----------------------------------
// Get timeline pct at pos
//----------------------------------

function TimelinePctAt(pos)
{
	// Get width of timeline element
	var w = elemTimeline.offsetWidth;
	
	return (pos / w);
}

//----------------------------------
// Get mouse pos on timeline
//----------------------------------

function TimelineMousePos(e)
{
	// Where did we click ON the timeline?
	var rect = elemTimeline.getBoundingClientRect();
	var x = e.clientX - rect.left;
	
	return x;
}

//----------------------------------
// Clicked the timeline
//----------------------------------

function ClickedTimeline(e)
{
	if (draggingMarker)
		return;
		
	var elem = GetClickedElement();
	
	if (elem.className.indexOf("marker") >= 0)
		return;
		
	if (holdingCtrl)
	{
		SelectMarkerRange(0, curMarkers.length, true, false);
		SyncMarkers();
		return;
	}
		
	var pos = TimelineMousePos(e);
	var pct = TimelinePctAt(pos);
	
	// Holding shift? Select region
	if (holdingShift)
	{
		var posA = Math.min(pos, lastClickedTimelinePos);
		var posB = Math.max(lastClickedTimelinePos, pos);
		
		var timeA = audioPlayer.duration * TimelinePctAt(posA);
		var timeB = audioPlayer.duration * TimelinePctAt(posB);
		
		var maxMarker = -1;
		var minMarker = 99999;
		
		for (var m=0; m<curMarkers.length; m++)
		{
			if (curMarkers[m].time >= timeA && curMarkers[m].time <= timeB)
			{
				maxMarker = Math.max(maxMarker, m);
				minMarker = Math.min(minMarker, m);
			}
		}
		
		lastClickedTimelinePos = pos;
		
		if (minMarker < 99999)
		{
			SelectMarkerRange(minMarker, maxMarker, true);
			SyncMarkers();
		}
		
		return;
	}
	
	lastClickedTimelinePos = pos;
	
	var newSec = audioPlayer.duration * pct;
	
	audioPlayer.currentTime = newSec;
	
	UpdateScrubberPos();
}

//----------------------------------
// Audio updater
//----------------------------------

function AudioUpdater()
{
	// Probably not a great idea, is it?
	if (!audioPlayer)
		return;
		
	if (audioPlayer.paused)
		return;
		
	UpdateScrubberPos();
}

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//----------------------------------
// Remove marker by index
//----------------------------------

function RemoveMarkerIndex(idx)
{
	console.log("Remove marker at " + idx);
}

//----------------------------------
// Find marker at time
//----------------------------------

function MarkerAtTime(time, tolerance = 0.05)
{
	for (var m=0; m<curMarkers.length; m++)
	{
		var gap = Math.abs(curMarkers[m].time - time);
		
		if (gap <= tolerance)
			return m;
	}
	
	return -1;
}

//----------------------------------
// Sort markers by time
//----------------------------------

function SortMarkers()
{
	curMarkers.sort((a, b) => {return a.time - b.time});
}

//----------------------------------
// Sync all marker elements
//----------------------------------

function SyncMarkers(activeCheck = true)
{
	activeMarkers = [];
	
	var actives = 0;
	
	for (const mrk of curMarkers)
	{
		var pos = TimelinePosAt(mrk.time, true);
		MoveMarker(mrk.elem, pos);
		
		if (mrk.active)
		{
			mrk.elem.className = 'marker_active';
			activeMarkers.push(mrk);
			actives += 1;
		}
		else
			mrk.elem.className = 'marker';
	}
	
	if (!actives && activeCheck)
	{
		pendingMarker = null;
		draggingMarker = null;
	}
}

//----------------------------------
// Index of marker element
//----------------------------------

function MarkerIndex(mrk)
{
	return curMarkers.indexOf(mrk);
}

//----------------------------------
// Get index of clicked marker element
//----------------------------------

function ClickedMarkerIndex(elem)
{
	for (var m=0; m<curMarkers.length; m++)
	{
		if (curMarkers[m].elem == elem)
			return m;
	}
	
	return -1;
}

//----------------------------------
// Clicked on a marker
//----------------------------------

function ClickedMarker(e)
{
	var elem = GetClickedElement();
	if (!elem)
		return;
		
	var idx = ClickedMarkerIndex(elem);
	if (idx < 0)
		return;
		
	dragMousePos = TimelineMousePos(e);
	pendingMarker = curMarkers[idx];
}

//----------------------------------
// Select markers within range
//----------------------------------

function SelectMarkerRange(startIdx, endIdx, overwrite = true, value = true)
{		
	var actives = 0;
	
	for (var m=0; m<curMarkers.length; m++)
	{
		var inRange = (m >= startIdx && m <= endIdx);
		
		if (!inRange && overwrite)
			curMarkers[m].active = false;
			
		if (inRange)
		{
			curMarkers[m].active = value;
			actives += value ? 1 : 0;
		}
	}
}

//----------------------------------
// Let go of held marker
//----------------------------------

function ReleaseMarker(e)
{
	var mrkPos = TimelineMousePos(e);
	
	// Didn't drag it at all!
	if (!draggingMarker && pendingMarker &&  Math.abs(mrkPos - dragMousePos) < 1)
	{
		// Holding shift and last marker was active?
		// Start making a selection
		if (lastClickedMarker && lastClickedMarker.active && holdingShift)
		{
			var idxA = curMarkers.indexOf(lastClickedMarker);
			var idxB = curMarkers.indexOf(pendingMarker);
			
			SelectMarkerRange(Math.min(idxA, idxB), Math.max(idxA, idxB), true, true);
		}
		else
			pendingMarker.active = !pendingMarker.active;
			
		lastClickedTimelinePos = mrkPos - 8;
		lastClickedMarker = pendingMarker;

		draggingMarker = null;
		pendingMarker = null;
		
		SyncMarkers();
		return;
	}
	
	var adder = (mrkPos - dragMousePos);
	
	var toMove = activeMarkers.slice(0);
	if (draggingMarker && toMove.indexOf(draggingMarker) < 0)
		toMove.push(draggingMarker);
	
	for (const mrk of toMove)
	{
		var origPos = TimelinePosAt(mrk.time, true);
		
		mrk.time = audioPlayer.duration * TimelinePctAt(origPos + adder);
	}

	SortMarkers();
	SyncMarkers();
	
	UpdateScrubberPos();
	
	draggingMarker = null;
	pendingMarker = null;
}

//----------------------------------
// Move marker to pos
//----------------------------------

function MoveMarker(elem, pos)
{
	// Get width
	var w = elem.offsetWidth;
	elem.style.left = pos;
}

//----------------------------------
// Move marker to mouse
//----------------------------------

function MarkerToMouse(e)
{
	if (!draggingMarker)
		return;
		
	var mouseGap = TimelineMousePos(e) - dragMousePos;
	
	var toMove = activeMarkers.slice(0);
	if (draggingMarker && toMove.indexOf(draggingMarker) < 0)
		toMove.push(draggingMarker);
	
	for (const am of toMove)
	{
		var origPos = TimelinePosAt(am.time, true);
		var newPos = origPos + mouseGap;
		
		am.elem.style.left = newPos;
	}
}

//----------------------------------
// Highlight a marker
//----------------------------------

function SelectMarker(mrk)
{
	mrk.active = true;
	SyncMarkers();
}

//----------------------------------
// Add a marker at a position
// Time is IN SECONDS
//----------------------------------

function AddMarker(time, id, type = 'camera')
{
	// Remove existing marker at this position if it exists
	var mrk = MarkerAtTime(time);
	if (mrk)
		RemoveMarkerIndex(mrk);
		
	// Create a new marker at index
	var obj = {time: time, id: id, active: true};
	
	// Un-highlight all markers
	for (const hl of curMarkers)
		hl.active = false;
	
	// Create actual element for marker
	obj.elem = document.createElement('div');
	obj.elem.className = 'marker';
	obj.elem.onmousedown = ClickedMarker;
	
	// Don't allow drop, this complicates things
	obj.elem.ondragstart = function() { return false; }
	obj.elem.ondrop = function() { return false; }
	obj.elem.setAttribute("draggable", false);
	
	obj.elem.title = id;

	elemTimeline.appendChild(obj.elem);
	
	// Add tick line below it
	var tick = document.createElement('div');
	tick.className = 'marker_tick';
	obj.elem.appendChild(tick);
	
	MoveMarker(obj.elem, TimelinePosAt(audioPlayer.currentTime, true));
	
	curMarkers.push(obj);
	
	SortMarkers();
	
	SyncMarkers();
	
	UpdateScrubberPos();
}

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//----------------------------------
// Mouse was released ANYWHERE on the document
//----------------------------------

function GlobalMouseRelease(e)
{
	if (pendingMarker || draggingMarker)
		ReleaseMarker(e);
}

//----------------------------------
// Mouse moved ANYWHERE on the document
//----------------------------------

function GlobalMouseMove(e)
{
	if (pendingMarker)
	{
		var TP = TimelineMousePos(e);
		if (Math.abs(TP - dragMousePos) >= 2)
		{
			// Deselect all markers if moving a non-active one
			if (!pendingMarker.active && activeMarkers.length > 0)
			{
				SelectMarkerRange(0, curMarkers.length, true, false);
				SyncMarkers(false);
			}
			
			draggingMarker = pendingMarker;
			pendingMarker = null;
		}
	}
	
	if (draggingMarker)
		MarkerToMouse(e);
}

//----------------------------------
// Key down ANYWHERE on document
//----------------------------------

function GlobalKeyDown(e)
{
	if (e.keyCode == 16)
		holdingShift = true;
		
	if (e.keyCode == 17)
		holdingCtrl = true;
}

//----------------------------------
// Key up ANYWHERE on document
//----------------------------------

function GlobalKeyUp(e)
{
	if (e.keyCode == 16)
		holdingShift = false;
		
	if (e.keyCode == 17)
		holdingCtrl = false;
}

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

function Main()
{
	elemViewport = document.getElementById('viewport');
	elemScreenshot = document.getElementById('screenshot');
	elemScreenshotText = document.getElementById('screenshot_text');
	elemTimeText = document.getElementById('time_text');
	elemTopContainer = document.querySelector('.top_container');
	elemCameraList = document.querySelector('#cameralist');
	elemActionContainer = document.querySelector('#action_container');
	elemTimeline = document.querySelector('#timeline');
	elemScrubber = document.querySelector("#timeline_scrubber");
	
	elemTimeline.onmousedown = ClickedTimeline;

	ensureViewportSize.observe( elemTopContainer );
	
	SetTimeText(0);
	SetScreenshot(DEFAULT_CAMERA);
	
	PopulateCameraList();
	
	AddActionButton("fretworks.png", ActionAddMarker, "Add Marker");
	AddActionButton("fretworks.png", ActionPlayPause, "Play / Pause");
	
	CreateSongAudio();
	
	// 50ms
	setInterval(AudioUpdater, 50);
	
	document.onmouseup = GlobalMouseRelease;
	document.onmousemove = GlobalMouseMove;
	document.onkeydown = GlobalKeyDown;
	document.onkeyup = GlobalKeyUp;
}

window.onload = () => { Main(); }
