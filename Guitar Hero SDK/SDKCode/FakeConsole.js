// - - - - - - - - - - - - - - - - - - - - - - 
// F A K E   C O N S O L E
// Console helpers, for colored text and things
// - - - - - - - - - - - - - - - - - - - - - - 

// POSIX and Windows color codes
const FGCodes = {
	'white': GHSDK.Constants.Chalk.keyword('white'),
	'yellow': GHSDK.Constants.Chalk.keyword('yellow'),
	'red': GHSDK.Constants.Chalk.keyword('red'),
	'lime': GHSDK.Constants.Chalk.keyword('lime'),
	'orange': GHSDK.Constants.Chalk.keyword('orange'),
	'cyan': GHSDK.Constants.Chalk.keyword('cyan')
};

class FakeConsole
{
	constructor()
	{
		this.debugChannels = {};
		this.showDebugChannel = true;
	}
	
	// Debug in a debug channel
	debug(txt, chan, color = 'white')
	{
		if (this.debugChannels[chan])
		{
			var prf = this.showDebugChannel ? ('[' + chan + '] ') : '';
			this.log(prf + txt, color);
		}
	}
	
	// Plain log message, not a big deal at all
	log(txt, fg) {
		this.FakeLog(txt, fg);
	}
	
	// WARN MESSAGE
	warn(txt) {
		this.FakeLog(txt, 'yellow');
	}
	
	// ERROR MESSAGE
	error(txt) {
		this.FakeLog(txt, 'red');
	}
	
	getPercentColor(txt, pct)
	{
		var col = "red";
				
		if (pct >= 0.75)
			col = "lime";
		else if (pct >= 0.50)
			col = "yellow";
		else if (pct >= 0.25)
			col = "orange";
		else
			col = "red";
			
		return col;
	}
	
	// Fancy log based on percentage
	logPercent(txt, pct) {
		this.log(txt, this.getPercentColor(txt, pct));
	}
	
	EnableDebug(chn) { this.debugChannels[chn] = true; }
	DisableDebug(chn) { this.debugChannels[chn] = false; }
	
	// Attempt to grab a color code by ID
	ColorCode(code)
	{
		return FGCodes[code.toLowerCase()] || GHSDK.Constants.Chalk.keyword(code) || FGCodes['white'];
	}
	
	FakeLog(message, fg = 'white')
	{
		var CC = this.ColorCode(fg);
		console.log(CC(message))
	}
}

global.cons = new FakeConsole();
