// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
//                                                                       //
//            _   __          __     ____  ____  ____                    //
//           / | / /___  ____/ /__  / __ \/ __ \/ __ \                   //
//          /  |/ / __ \/ __  / _ \/ /_/ / / / / / / /                   //
//         / /|  / /_/ / /_/ /  __/ _, _/ /_/ / /_/ /                    //
//        /_/ |_/\____/\__,_/\___/_/ |_|\____/\___\_\                    //
//                                                                       //
//         node.js copy of roq.exe, for QB compiling                     //
//                                                                       //
//                                                    - Coded by Zedek   //
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //

const path = require('path');
const fs = require('fs');

global.NodeROQ = {
	ByteCode: require('./Constant/ByteCode.js'),
	
	// Types to use for compiling
	CompilerTypes: {}
};

NodeROQ.CompilerTypes.Core = require('./Classes/Core.js');
NodeROQ.CompilerTypes.ScriptHandler = require('./Classes/ScriptHandler.js');
NodeROQ.CompilerTypes.Keyword = require('./Classes/Keyword.js');
NodeROQ.CompilerTypes.SymbolHash = require('./Classes/SymbolHash.js');
NodeROQ.CompilerTypes.String = require('./Classes/String.js');
NodeROQ.CompilerTypes.Comment = require('./Classes/Comment.js');
NodeROQ.CompilerTypes.Injector = require('./Classes/Injector.js');
NodeROQ.CompilerTypes.Integer = require('./Classes/Integer.js');
NodeROQ.CompilerTypes.Float = require('./Classes/Float.js');
NodeROQ.CompilerTypes.Vector = require('./Classes/Vector.js');
NodeROQ.CompilerTypes.Pair = require('./Classes/Pair.js');
NodeROQ.CompilerTypes.Conditional = require('./Classes/Conditional.js');
NodeROQ.CompilerTypes.ConditionalMark = require('./Classes/ConditionalMark.js');
NodeROQ.CompilerTypes.Switch = require('./Classes/Switch.js');
NodeROQ.CompilerTypes.ShortBreak = require('./Classes/ShortBreak.js');
NodeROQ.CompilerTypes.Selector = require('./Classes/Selector.js');
NodeROQ.CompilerTypes.Offset = require('./Classes/Offset.js');
NodeROQ.CompilerTypes.Label = require('./Classes/Label.js');
NodeROQ.CompilerTypes.LineWrap = require('./Classes/LineWrap.js');
NodeROQ.CompilerTypes.ScriptFunction = require('./Classes/ScriptFunction.js');
NodeROQ.CompilerTypes.SymbolEntry = require('./Classes/SymbolEntry.js');
NodeROQ.CompilerTypes.THAWObject = require('./Classes/THAWObject.js');
NodeROQ.CompilerTypes.QBString = require('./Classes/QBString.js');

class NodeROQClass
{
	constructor(opt = {})
	{
		this.ByteCode = global.NodeROQ.ByteCode;
		this.CompilerTypes = global.NodeROQ.CompilerTypes;
		
		// Global reference
		global.NodeROQ = this;
		
		this.QBKey = require('./Constant/QBKey.js');
		
		// Pull in THAWQB if we don't have it already
		// We'll need this for 0x4a scripts
		
		//~ if (global.THAWQB == undefined)
			//~ require('../THAWQB/Main.js');
		
		if (!opt.direct)
			console.log("NodeROQ initialized!");
	}
	
	// - - - - - - - - - - - - - - - - - - 
	// COMPILE CODE AND OUTPUT IT TO A FILE
	// THIS IS USUALLY CALLED FROM THE COMMAND LINE
	// - - - - - - - - - - - - - - - - - - 
	CompileCommand(inPath, outPath)
	{
		fs.readFile(inPath, (err, data) => {
			if (err)
				return console.log(err);
				
			this.Compile(data, {}, output => {
				if (!output.result)
					return;
					
				fs.writeFile(outPath, output.result, err => {});
			});
		});
	}
	
	// - - - - - - - - - - - - - - - - - - 
	// COMPILE A BIT OF SOURCE CODE
	// - - - - - - - - - - - - - - - - - - 
	
	Compile(data, compilerOptions = {strip: true}, callback)
	{	
		this.decompile = compilerOptions.decompile || false;
		var addNodeROQHeader = (compilerOptions.header == undefined) ? true : compilerOptions.header;
		
		// Tidy! If true, some elements will be slimmed down for ease of reading
		this.tidy = (compilerOptions.tidy == undefined) ? false : compilerOptions.tidy;
		
		this.isSectionScript = compilerOptions.sectionScript;
		
		this.friendlyName = compilerOptions.friendly || ""
		
		this.source = this.decompile ? data : data.toString();
		this.bytes = [];
		this.text = "";
		
		// Compile with NodeROQ
		if (this.decompile && addNodeROQHeader)
			this.text += ("// NodeROQ\n");
		
		this.indent = 0;
		this.indentPending = false;
		
		// Double newlines?
		this.doubleNewlines = !this.decompile && compilerOptions.obfuscate;
		
		// Scratchpad of compile variables, we can store things here
		// We'll store an object of checksums, for debug symbol purposes
		this.scratchpad = {
			labelCount: 0,
			checksums: {},
			labels: {},
			lowsums: {}
		};
		
		// Store the BYTE LOCATIONS of our newlines
		// Rather than naively checking for 0x01, we can check this instead
		this.newLineSpots = [];
		
		// List of post-compile callbacks that we should operate on
		// These can be used to inject things at bytes, etc.
		this.postFunctions = [];
		
		// Warnings / errors
		this.warnings = [];
		this.errors = [];
		
		// Totally FAIL
		this.failed = false;
		
		global.scriptHandler = {};
		
		// Create a new script handler
		var handler = new this.CompilerTypes.ScriptHandler({
			source: this.source
		});
		
		if (compilerOptions.debug)
			handler.Debug();
		
		if (!this.decompile)
			handler.ToBytes();
		else
			handler.PrepareText();
			
		// Handle post functions
		for (const pf in this.postFunctions)
			this.postFunctions[pf]();
			
		// Check validity of our objects, inspect for errors and warnings
		handler.DoValidityTest();
			
		// Add debug symbols?
		if (!this.decompile && !compilerOptions.strip && !this.isSectionScript)
		{
			// Slice last byte off, store it for later
			var lastByte = this.bytes[this.bytes.length-1];
			this.bytes = this.bytes.slice(0, this.bytes.length-1);
			
			var keys = Object.keys(this.scratchpad.checksums);
			
			for (const k in keys)
			{
				var theQB = this.scratchpad.checksums[ keys[k] ];
				var theName = keys[k];
				
				this.bytes.push(this.ByteCode.SYMBOL_ENTRY);
				
				for (var b=0; b<theQB.length; b++)
					this.bytes.push(theQB[b]);
				
				var bf = Buffer.from(theName);
				for (var b=0; b<bf.length; b++)
					this.bytes.push(bf[b]);
					
				this.bytes.push(0x00);
			}
			
			this.bytes.push(lastByte);
		}
		
		// Log warnings
		if (this.warnings)
		{
			for (const w in this.warnings)
				console.log(this.warnings[w]);
		}
		
		// Did we have any errors? If so, ABORT COMPILE
		if (this.errors.length > 0 || this.failed)
		{
			var returner = {
				error: "Encountered " + this.errors.length + " error(s).",
				warnings: this.warnings,
				errors: this.errors
			}
			
			if (callback)
				callback(returner);
				
			return returner;
		}
		
		if (!this.failed)
		{
			var returnResult = this.decompile ? this.text : Buffer.from(this.bytes);
			
			if (callback)
				callback({result: returnResult});
			return {result: returnResult};
		}
		else
		{
			if (callback)
				callback({error: "Compiling has failed."});
				
			return {error: "Compiling has failed."};
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// ADD A WARNING / ERROR
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	AddError(msg, line, critical = false)
	{
		var prf = critical ? "ERROR" : "Warning";
		var finalMsg = (this.friendlyName || "") + " [" + prf + ", Line " + line.toString() + "] " + msg;
		
		if (critical)
		{
			this.errors.push(finalMsg);
			this.failed = true;
		}
		else
			this.warnings.push(finalMsg);
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// RAISE INDENT LEVEL
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	RaiseIndent()
	{
		this.indent ++;
		this.indentPending = true;
	}
		
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// UTILITY: TRY NEWLINE
	// This adds a newline only if the last byte wasn't one
	//
	// Could this mess up with numbers that end in 01? Possibly
	// (Shouldn't matter 99% of the time, newlines are MOSTLY for decompiler semantics)
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	TryNewLine()
	{
		var shouldAdd = true;
		
		// No prior lines, add regardless
		if (this.newLineSpots.length <= 0)
			shouldAdd = true;
			
		else
		{
			// Is it one AHEAD of our last newline?
			// This would make a dupe, this is a no-no
			
			var NLS = this.newLineSpots[this.newLineSpots.length-1];
			
			if (this.bytes.length-1 == NLS)
				shouldAdd = false;
		}
		
		if (shouldAdd)
		{
			// Store the location of it
			this.newLineSpots.push(this.bytes.length);
			this.bytes.push(this.ByteCode.NEW_INSTRUCTION);
			
			// Double-newline
			if (this.doubleNewlines)
			{
				this.newLineSpots.push(this.bytes.length);
				this.bytes.push(this.ByteCode.NEW_INSTRUCTION);
			}
		}
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// UTILITY: UINT16 BUFFER
	// Returns 2 bytes of little-endian uint16
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	UInt16Buffer(val)
	{
		var ret = [];
		var BF = Buffer.alloc(2);
		BF.writeUInt16LE(val, 0);
		
		for (var b=0; b<BF.length; b++)
			ret.push(BF[b]);
			
		return ret;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// UTILITY: UINT32 BUFFER
	// Returns 4 bytes of little-endian uint32
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	UInt32Buffer(val)
	{
		var ret = [];
		var BF = Buffer.alloc(4);
		BF.writeUInt32LE(val, 0);
		
		for (var b=0; b<BF.length; b++)
			ret.push(BF[b]);
			
		return ret;
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// COMPILE A FILE, USED FOR DEBUGGING
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	CompileFile(file)
	{
		// Read the data first
		fs.readFile(file, (err, data) => {
			if (err)
				return console.log(err);
				
			this.Compile(data, {debug: true, obfuscate: false, strip: true}, output => {
				
				// Output it to a file
				var outFile = file.replace(".txt", ".qb");
				fs.writeFile(outFile, output.result, err => {
					if (err)
						return console.log(err);
						
					console.log("Compiled!");
				});
				
			});
		});
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// DO NEWLINE IN TEXT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	TextNewLine(doI = true)
	{
		if (this.indent < 0)
			this.indent = 0;
		
		this.indentPending = false;
		
		this.text += "\n";
		
		for (var l=0; l<this.indent; l++)
			this.text += String.fromCharCode(9);
			
		if (doI)
			this.text += ":i ";
	}
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// POP THE LAST INDENT
	// - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	PopIndent()
	{
		if (this.indentPending)
			return;
			
		var ind = -1;
		var pos = this.text.length-1;
		
		// Loop back to the first tab OR stop at a new line
		while (true && pos >= 0)
		{
			var cc = this.text.charCodeAt(pos);
			if (cc == 10)
				return;
				
			if (cc == 9)
				break;
				
			pos --;
		}
			
		if (pos <= 0)
			return;
			
		this.text = this.text.slice(0, pos) + this.text.slice(pos+1);
	}
	
}

module.exports = NodeROQClass;

// -- CHECK IF WE RAN THIS FILE DIRECTLY --
if (process.argv.length > 2)
{
	var args = process.argv;
	args.shift();
	args.shift();
	
	switch (args[0])
	{
		// Old-school compile, ROQ context
		case '-c':
			args.shift();
			
			if (args.length <= 0)
				return console.log("You must enter a filename!");
				
			var inFile = args[0];
			var outFile = args[0] + ".qb";
			
			// Actually specified an output name
			if (args.length > 1)
				outFile = args[1];
				
			// Not absolute, make them absolute
			if (!path.isAbsolute(inFile))
				inFile = path.join(__dirname, inFile);
				
			if (!fs.existsSync(inFile))
				return console.log("FILE DID NOT EXIST!");
				
			if (!path.isAbsolute(outFile))
				outFile = path.join(__dirname, outFile);
			
			var roq = new NodeROQClass({direct: true});
			
			roq.CompileCommand(inFile, outFile);
		break;
	}
}
