// - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// CONSTANT VALUES
// - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const path = require('path');

// This was for creating a standalone binary, but we're not doing that yet
// (Maybe some day in the future!)
//~ const workingDir = (GHSDK.standalone) ? process.cwd() : path.join(__dirname, '..');

const workingDir = path.join(__dirname, '..');

module.exports = {
	
	DECOMPILE_4A: true,
	DECOMPILE_SECTIONSCRIPT: true,
	
	DefaultGame: 'GHWT',
	
	// -- Directories ----------------------------------------------
	DirSDK: workingDir,
	DirCode: path.join(workingDir, 'SDKCode'),
	DirConfig: path.join(workingDir, 'Config'),
	DirPlugins: path.join(workingDir, 'Plugins'),
	DirAssets: path.join(workingDir, 'Assets'),
	DirGameConfig: path.join(workingDir, 'Config', 'Games'),
	
	// -- Various helper classes for reading / writing -------------
	Writer: require('./Writer.js'),
	Reader: require('./Reader.js'),
	TextReader: require('./TextReader.js'),
	INIHandler: require('./INIHandler.js'),
	ChecksumWatcher: require('./ChecksumWatcher.js'),
	TexHandler: new (require('./Tex/TexHandler.js'))(),
	SongConverter: new (require('./Converter/Converter.js'))(),
	Timeliner: new (require('./Timeliner/Timeliner.js'))(),
	Havok: new (require('./Havok/HavokHandler.js'))(),
	ModMenuHandler: new (require('./ModMenuHandler.js'))(),
	
	// -- Modules --------------------------------------------------
	Chalk: require('chalk'),
	Prompts: require('prompts'),
	LZSS: new (require('./QB/LZSS.js'))(),
	GZip: new (require('./QB/GZip.js'))(),
	
	// -- Various states for the SDK -------------------------------
	STATE_HOME: 0
};
