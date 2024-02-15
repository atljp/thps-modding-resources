// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// A S S E T S
// Useful for asset-related things in Assets
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const MenuCore = require('../Menu_Core.js');

const path = require('path');
const fs = require('fs');

class AssetsMenu extends MenuCore
{
	constructor()
	{
		super();
		
		this.title = 'Assets';
		this.description = 'Handle various stray file formats.';
		this.value = 'assets';
		
		this.selectedMod = "";
	}
	
	Selected(val)
	{
		if (!val)
			return;
			
		this.ShowMain();
	}
	
	//--------------------------------------------
	// Show the main menu for this type
	//--------------------------------------------
	
	async ShowMain(msg)
	{
		GHSDK.ShowHeader();
		
		// Show the last message, if we had one
		if (msg)
		{
			cons.log(msg)
			cons.log("");
		}
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: [
				{
					title: "[.pak] - Archives",
					description: 'Archives that contain data',
					value: "pak"
				},
				
				{
					title: "[.qb] - Scripts",
					description: 'Script files that contain values / logic',
					value: "qb"
				},
				
				{
					title: "[.img] - Images",
					description: 'Singular images',
					value: "img",
				},
				
				{
					title: "[.tex] - Textures",
					description: 'Texture packages',
					value: "tex",
				},
				
				{
					title: "[.fsb] - FMod Banks",
					description: 'FMod sound banks',
					value: "fsb",
				},
				
				{
					title: "[LZSS] - Compression",
					description: 'Compressed files',
					value: "lzss",
				},

				{
					title: "[GZip] - Compression",
					description: 'Compressed files',
					value: "gz",
				},
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
			case 'pak':
				this.ShowExtMenu_PAK();
				break;
				
			case 'qb':
				this.ShowExtMenu_QB();
				break;
				
			case 'img':
				this.ShowExtMenu_IMG();
				break;
				
			case 'tex':
				this.ShowExtMenu_TEX();
				break;
				
			case 'fsb':
				this.ShowExtMenu_FSB();
				break;
				
			case 'lzss':
				this.ShowExtMenu_LZSS();
				break;

			case 'gz':
				this.ShowExtMenu_GZip();
				break;
				
			default:
				return;
		}
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// Show the menu for .pak files
	//--------------------------------------------
	
	async ShowExtMenu_PAK()
	{
		GHSDK.ShowHeader();
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: [
				{
					title: "Pack (no PAB)",
					description: 'Pack .pak files',
					value: "pack"
				},
				
				{
					title: "Pack (with PAB)",
					description: 'Pack .pak files',
					value: "pack_pab"
				},
				
				{
					title: "Unpack",
					description: 'Unpack .pak files',
					value: "unpack",
				},
				
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
			case 'pack_pab':
			case 'pack':
				this.needsPab = (mod.value == 'pack_pab');
				this.ShowExtMenu_PAK_Pack();
				break;
				
			case 'unpack':
				this.ShowExtMenu_PAK_Unpack();
				break;

			default:
				return;
		}
	}
	
	//--------------------------------------------
	// Pack folders into archives
	//--------------------------------------------
	
	async ShowExtMenu_PAK_Pack()
	{
		GHSDK.ShowHeader();
		
		var opt = [];
		
		var pakFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'Pak');
		
		if (fs.existsSync(pakFolder))
		{
			var files = fs.readdirSync(pakFolder);
			for (const file of files)
			{
				if (file == 'Compiled')
					continue;
					
				var fpath = path.join(pakFolder, file);
				if (fs.statSync(fpath).isDirectory())
				{
					opt.push({
						title: file,
						value: fpath
					});
				}
			}
		}
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Package",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Any other value will be a file path
		var inFolder = val.value;
		var fName = path.basename(inFolder);
		var outFile = path.join(pakFolder, 'Compiled', fName + ".pak.xen");
		
		GHSDK.ShowHeader();
		
		GHSDK.PakHandler.Compile(inFolder, outFile, {usePAB: this.needsPab});
		
		cons.log(fName + " compiled, check Compiled folder.", 'lime');
		GHSDK.Pause();
	}
	
	//--------------------------------------------
	// Unpack folders into archives
	//--------------------------------------------
	
	async ShowExtMenu_PAK_Unpack()
	{
		GHSDK.ShowHeader();
		
		var opt = [];
		
		var pakFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'Pak');
		
		if (fs.existsSync(pakFolder))
		{
			var files = fs.readdirSync(pakFolder);
			for (const file of files)
			{
				if (file == 'Compiled')
					continue;
					
				var fpath = path.join(pakFolder, file);
					
				if (fs.statSync(fpath).isDirectory())
					continue;
                    
				// Pak files only
				if (file.toLowerCase().indexOf(".pak") >= 0)
				{
					opt.push({
						title: file,
						value: fpath
					});
				}
			}
		}
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Package",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		var inPak = val.value;
		var spl = path.basename(inPak).split(".").shift();
		var outFolder = path.join(pakFolder, 'Compiled', spl);
		
		GHSDK.ShowHeader();
		
		var pakName = path.basename(inPak);
		cons.log("Extracting " + pakName + "...", "lime");
		
		var isCas = false;
		if (pakName.toLowerCase().indexOf("cas_pieces") >= 0)
		{
			isCas = true;
			cons.log("Detected as cas_pieces file!", "yellow");
		}
		
		// cas_pieces file
        var opt = {
            cas_pieces: isCas
        };
        
		GHSDK.PakHandler.Extract(inPak, outFolder, opt);
		
		cons.log("Extracted! Check Compiled folder for files.", "lime");
		
		GHSDK.Pause();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// Show the menu for .qb files
	//--------------------------------------------
	
	async ShowExtMenu_QB()
	{
		GHSDK.ShowHeader();
        
        var qbChoices = [
            {
                title: "Decompile",
                description: 'Decompile QB files',
                value: "decompile"
            },
            
            {
                title: "Compile",
                description: 'Compile QB files',
                value: "compile"
            },
            
            GHSDK.HomeOption()
        ];
        
        // ------
        // Is NodeQBC installed?
        // If so, we'll add a separate Decompile option.
        //
        // This will decompile QB files into Q files.
        // ------

        
        if (GHSDK.HasNodeQBC())
        {
            qbChoices.unshift({
                title: "Decompile (QBC)",
                description: 'Decompile QB files using NodeQBC',
                value: "decompile_qbc"
            });
        }
        
        // ------
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: qbChoices,
			initial: 0
		});
		
		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
            case 'decompile_qbc':
                this.forceQBC = true;
				this.ShowExtMenu_QB_Perform(true);
				break;
                
			case 'decompile':
                this.forceQBC = false;
				this.ShowExtMenu_QB_Perform(true);
				break;
				
			case 'compile':
				this.ShowExtMenu_QB_Perform(false);
				break;

			default:
				return;
		}
	}
	
	//--------------------------------------------
	// Decompile certain QB files
	//--------------------------------------------
	
	async ShowExtMenu_QB_Perform(doDecompile = true)
	{
		GHSDK.ShowHeader();
		
		var actionText = doDecompile ? "Decompile" : "Compile";
		
		var opt = [{
			title: actionText + " All Files",
			value: "all",
			description: actionText + "s all files in the folder."
		}];
		
		var qbFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'QB');
		var validQB = [];
		
		if (fs.existsSync(qbFolder))
		{
            var hasQBC = GHSDK.HasNodeQBC();
            
			var files = fs.readdirSync(qbFolder);
			for (const file of files)
			{
				var fPath = path.join(qbFolder, file);
				
				var exten = file.split(".").pop().toLowerCase();
				
				// Directory?
				if (fs.lstatSync(fPath).isDirectory())
					continue;
				
				// Bad extension!
                if (doDecompile)
                {
                    if (exten == "txt" || exten == "q")
                        continue;
                }
                else
                {
                    var goodSource = ( (exten == "q" && hasQBC) || exten == "txt" );
                    if (!goodSource)
                        continue;
                }
					
				// QB files only
				validQB.push(fPath);
				
				opt.push({
					title: file,
					value: fPath
				});
			}
		}
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Package",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Create a list of files that need to be processed
		var toProcess = [];
		
		if (val.value == 'all')
			toProcess = validQB;
		else
			toProcess.push(val.value);
		
		GHSDK.ShowHeader();
		
		for (const qbPath of toProcess)
		{
			var nm = GHSDK.Constants.Chalk.keyword('orange')(path.basename(qbPath));
			var gr = GHSDK.Constants.Chalk.keyword('grey')
			var processText = doDecompile ? "Decompiling " : "Compiling ";
			
			cons.log(gr(processText) + nm + gr("..."));
			
            // ------
			// Which extension would we like to use?
			var shorthand = path.basename(qbPath).split(".")[0];
            
            var outExten;
            
            if (doDecompile)
                outExten = this.forceQBC ? "q" : "txt";
            else
                outExten = "qb.xen";
            
			var decomPath = path.join(path.dirname(qbPath), shorthand + "." + outExten);
            // ------
			
			// Ensure the output directory exists
			GHSDK.EnsureDirectory(decomPath);
			
			if (doDecompile)
				GHSDK.QBHandler.DecompileFile(qbPath, decomPath, this.forceQBC);
			else
			{
                var res = GHSDK.QBHandler.CompileFile(qbPath, decomPath);

				// Good!
				if (res.errors.length <= 0 && res.warnings.length <= 0)
                {
                    // Does it contain the compiler name?
                    // If so, we'll say what we compiled it with.
                    
                    if (res.compiler)
                        cons.log(path.basename(decomPath) + " compiled with " + res.compiler + "!", "lime");
                    else
                        cons.log(path.basename(decomPath) + " compiled!", "lime");
                }
					
				// Bad!
				else
				{
                    if (res.errors && res.errors.length)
                    {
                        for (const err of res.errors)
                            cons.error(err);
                    }
                    
                    if (res.warnings && res.warnings.length)
                    {
                        for (const wrn of res.warnings)
                            cons.warn(wrn);
                    }
				}
				
				//~ qbReaderCompileFile(qbPath, decomPath, fullNameHere, optionsHere);
			}
		}

		GHSDK.Pause();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// Show the menu for .img files
	//--------------------------------------------
	
	async ShowExtMenu_IMG()
	{
		GHSDK.ShowHeader();
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: [
				{
					title: "To DDS",
					description: 'Convert to DDS',
					value: "todds"
				},
				
				{
					title: "To IMG (DXT)",
					description: 'Convert to IMG',
					value: "toimg"
				},
				
				{
					title: "To IMG (Raw)",
					description: 'Convert to IMG',
					value: "toimg_raw"
				},
				
				{
					title: "To IMG (WPC)",
					description: 'Convert to IMG',
					value: "toimg_wpc"
				},
				
				{
					title: "To PNG",
					description: 'Convert to PNG',
					value: "topng"
				},
				
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
			case 'todds':
				this.imgMode = 'dds';
				this.ShowExtMenu_IMG_Select();
				break;
				
			case 'toimg':
			case 'toimg_raw':
			case 'toimg_wpc':
				this.imgMode = 'img';
				this.rawImage = (mod.value == 'toimg_raw');
				this.wpcImage = (mod.value == 'toimg_wpc');
				
				this.ShowExtMenu_IMG_Select();
				break;
				
			case 'topng':
				this.imgMode = 'png';
				this.ShowExtMenu_IMG_Select();
				break;

			default:
				return;
		}
	}
	
	//--------------------------------------------
	// Select which IMG or DDS file to work on
	//--------------------------------------------
	
	async ShowExtMenu_IMG_Select()
	{
		GHSDK.ShowHeader();
		
		var opt = [{
			title: "All Files",
			value: "all",
			description: "Operates on all files in the folder."
		}];
		
		var imgFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'Img');
		var validImages = [];
		
		var inExtensions = [];
		
		switch (this.imgMode)
		{
			// img > dds
			// img > png
			case 'dds':
			case 'png':
				inExtensions = ['.img'];
				break;
				
			// dds, png > img
			case 'img':
				inExtensions = ['.dds', '.png'];
				break;
		}

		if (fs.existsSync(imgFolder))
		{
			var files = fs.readdirSync(imgFolder);
			for (const file of files)
			{
				var exten = file.split(".").pop().toLowerCase();
				
				var fpath = path.join(imgFolder, file);
					
				if (fs.statSync(fpath).isDirectory())
					continue;

				// Valid files only
				for (const ie of inExtensions)
				{
					if (file.toLowerCase().indexOf(ie) >= 0)
					{
						validImages.push(fpath);
						
						opt.push({
							title: file,
							value: fpath
						});
						
						break;
					}
				}
			}
		}
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Package",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Create a list of files that need to be operated on
		var toParse = [];
		
		if (val.value == 'all')
			toParse = validImages;
		else
			toParse.push(val.value);
		
		GHSDK.ShowHeader();
		
		var outName, outExten;
		
		switch (this.imgMode)
		{
			case 'dds':
				outName = 'DDS';
				outExten = '.dds';
				break;
				
			case 'img':
				outName = 'IMG';
				
				if (this.wpcImage)
					outExten = '.img.wpc';
				else
					outExten = '.img.xen';
					
				break;
				
			case 'png':
				outName = 'PNG';
				outExten = '.png';
				break;
		}

		for (const imagePath of toParse)
		{
			var nm = GHSDK.Constants.Chalk.keyword('orange')(path.basename(imagePath));
			var gr = GHSDK.Constants.Chalk.keyword('grey')
			
			cons.log(gr("Converting ") + nm + gr(" to " + outName + "..."));
			
			var outName = path.basename(imagePath).split(".").shift() + outExten;
			var outPath = path.join(path.dirname(imagePath), 'Processed', outName);
			GHSDK.EnsureDirectory(outPath);
			
			var result;
			
			switch (this.imgMode)
			{
				case 'img':
				
					// THAW .img.wpc convert
					if (this.wpcImage)
						result = await GHSDK.Constants.TexHandler.DDStoIMG(fs.readFileSync(imagePath), {thaw: true});
					
					// Other
					else
					{
						if (this.rawImage)
							result = await GHSDK.Constants.TexHandler.PNGtoIMG(fs.readFileSync(imagePath));
						else
							result = await GHSDK.Constants.TexHandler.DDStoIMG(fs.readFileSync(imagePath));
					}
					
					break;
					
				case 'dds':
					result = await GHSDK.Constants.TexHandler.IMGtoDDS(fs.readFileSync(imagePath));
					break;
					
				case 'png':
					result = await GHSDK.Constants.TexHandler.IMGtoDDS(fs.readFileSync(imagePath));
					
					// Convert DDS to PNG
					if (result.data)
						result = await GHSDK.Constants.TexHandler.DDStoPNG(result.data);
					
					break;
			}
			
			if (result.format)
			{
				var spl = outPath.split(".");
				spl[spl.length-1] = result.format;
				outPath = spl.join(".");
			}
				
			// IMG -> DDS, with noesis mode
			if (result.noesis && this.imgMode == 'dds')
			{
				var spl = outPath.split(".");
				spl[spl.length-1] = "ghm";
				outPath = spl.join(".");
				
				cons.log("  Exported in Noesis mode!", "grey");
			}
				
			if (result.data)
				fs.writeFileSync(outPath, result.data);
			else if (result.errors)
			{
				for (const err of result.errors)
					cons.error(err);
			}
			else
				cons.warn("Image handler had no data or errors. Tool coder error.");
				
			//~ GHSDK.QBHandler.DecompileFile(decom, decomPath);
		}
		
		cons.log("");
		cons.log("All images converted.", "lime");

		GHSDK.Pause();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// Show the menu for .fsb files
	//--------------------------------------------
	
	async ShowExtMenu_FSB()
	{
		GHSDK.ShowHeader();
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: [
				{
					title: "Extract",
					description: 'Extract .fsb',
					value: "extract"
				},

				{
					title: "Create",
					description: 'Create .fsb',
					value: "pack",
				},
				
				{
					title: "Create (.dat)",
					description: 'Create .fsb + .dat',
					value: "pack_dat",
				},
				
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
			case 'extract':
			case 'pack':
			case 'pack_dat':
			
				if (mod.value == 'extract')
					this.fsbMode = 'extract';
				else
					this.fsbMode = 'pack';
					
				this.fsbDat = (mod.value == 'pack_dat');
				
				// We don't care about version if extracting
				if (mod.value == 'extract')
					this.ShowExtMenu_FSB_Extract();
					
				// Otherwise, we want to select it for packing
				else
					this.ShowExtMenu_FSB_Version();
					
				break;

			default:
				return;
		}
	}
	
	//--------------------------------------------
	// Select which fsb version to work on
	//--------------------------------------------
	
	async ShowExtMenu_FSB_Version()
	{
		GHSDK.ShowHeader();
		
		var opt = [
			{
				title: "FSB4",
				value: "fsb4",
				description: "Used in GHWT."
			},
			{
				title: "FSB3",
				value: "fsb3",
				description: "Used in GH3."
			}
		];
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a version",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Which version?
		if (val.value == 'fsb3')
			this.fsbVersion = 3;
		else
			this.fsbVersion = 4;
		
		this.ShowExtMenu_FSB_Extract();
	}
	
	//--------------------------------------------
	// Select which fsb to work on
	//--------------------------------------------
	
	async ShowExtMenu_FSB_Extract()
	{
		GHSDK.ShowHeader();
		
		var opt = [];
		
		if (this.fsbMode == 'extract')
		{
			opt.push({
				title: "All Files",
				value: "all",
				description: "Operates on all files in the folder."
			});
		}
		
		var fsbFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'FSB');
		var validFSBs = [];
		
		var inExtension = '.fsb';
		
		if (fs.existsSync(fsbFolder))
		{
			var files = fs.readdirSync(fsbFolder);
			for (const file of files)
			{
				var fpath = path.join(fsbFolder, file);
				
				// -- Extract .fsb files --
				if (this.fsbMode == 'extract')
				{
					var exten = file.split(".").pop().toLowerCase();

					if (fs.statSync(fpath).isDirectory())
						continue;

					// Valid files only
					if (file.toLowerCase().indexOf(inExtension) >= 0)
					{
						validFSBs.push(fpath);
						
						opt.push({
							title: file,
							value: fpath
						});
					}
				}
				
				// -- Compile .fsb files --
				else if (this.fsbMode == 'pack')
				{
					if (file.toLowerCase() == 'processed')
						continue;
						
					if (!fs.statSync(fpath).isDirectory())
						continue;
						
					validFSBs.push(fpath);
					opt.push({
						title: file,
						value: fpath
					});
				}
			}
		}
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a bank",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Create a list of files that need to be operated on
		var toParse = [];
		
		if (val.value == 'all')
			toParse = validFSBs;
		else
			toParse.push(val.value);
			
		GHSDK.ShowHeader();
			
		// Parse each of the FSB's
		var success = true;
		
		var compText = (this.fsbMode == 'extract') ? "Extracting" : "Compiling";
		
		var procDir = path.join(fsbFolder, 'Processed');
		if (!fs.existsSync(procDir))
			fs.mkdirSync(procDir);
		
		for (const fsbPath of toParse)
		{
			cons.log(compText + " " + path.basename(fsbPath) + "...", 'grey');
			
			// -- Extract the FSB --
			if (this.fsbMode == 'extract')
			{
				var inFolder = path.dirname(fsbPath);
				var shorthand = path.basename(fsbPath).split(".")[0];
				var outFolder = path.join(procDir, shorthand);
				
				if (!fs.existsSync(outFolder))
					fs.mkdirSync(outFolder, {recursive: true});
					
				var res = GHSDK.FSBHandler.Extract(fsbPath, outFolder);
				if (!res)
					success = false;
			}
			
			// Compile the FSB --
			else
			{
				var versionToUse = (this.fsbVersion || 4);
				
				var folderName = path.basename(fsbPath);
				var outFile = path.join(procDir, folderName + '.fsb.xen');
				
				var res = GHSDK.FSBHandler.Compile(fsbPath, outFile, {
					dat: this.fsbDat || false,
					version: versionToUse
				});
				
				if (!res)
					success = false;
			}
		}
		
		cons.log("");
		
		if (res)
			cons.log(compText + " completed successfully.", "lime");
		else
			cons.log(compText + " completed with errors.", "orange");

		GHSDK.Pause();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// Show the menu for .tex files
	//--------------------------------------------
	
	async ShowExtMenu_TEX()
	{
		GHSDK.ShowHeader();
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: [
				{
					title: "Extract",
					description: 'Extract a .tex',
					value: "extract"
				},
				
				{
					title: "Extract (Noesis)",
					description: 'Extract a .tex',
					value: "extract_noesis"
				},
				
				{
					title: "Pack",
					description: 'Create a .tex',
					value: "Pack",
					disabled: true
				},
				
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
			case 'extract':
			case 'extract_noesis':
				this.noesisMode = (mod.value == 'extract_noesis');
				this.extracting = true;
				this.ShowExtMenu_TEX_Select();
				break;

			default:
				return;
		}
	}
	
	//--------------------------------------------
	// Select which tex to work on
	//--------------------------------------------
	
	async ShowExtMenu_TEX_Select()
	{
		GHSDK.ShowHeader();
		
		var opt = [{
			title: "All Files",
			value: "all",
			description: "Operates on all files in the folder."
		}];
		
		var imgFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'Tex');
		var validImages = [];
		
		var inExtension = '.tex';
		
		if (fs.existsSync(imgFolder))
		{
			var files = fs.readdirSync(imgFolder);
			for (const file of files)
			{
				var exten = file.split(".").pop().toLowerCase();
				
				var fpath = path.join(imgFolder, file);
					
				if (fs.statSync(fpath).isDirectory())
					continue;

				// Valid files only
				if (file.toLowerCase().indexOf(inExtension) >= 0)
				{
					validImages.push(fpath);
					
					opt.push({
						title: file,
						value: fpath
					});
				}
			}
		}
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a Package",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Create a list of files that need to be operated on
		var toParse = [];
		
		if (val.value == 'all')
			toParse = validImages;
		else
			toParse.push(val.value);
		
		GHSDK.ShowHeader();

		for (const imagePath of toParse)
		{
			var nm = GHSDK.Constants.Chalk.keyword('orange')(path.basename(imagePath));
			var gr = GHSDK.Constants.Chalk.keyword('grey')
			
			cons.log(gr("Extracting ") + nm + gr("..."));
			
			var imgShorthand = path.basename(imagePath).split(".")[0];
			var outPath = path.join(path.dirname(imagePath), 'Processed', imgShorthand);
			GHSDK.EnsureDirectory(outPath);
			
			GHSDK.Constants.TexHandler.Extract(imagePath, outPath, {
				debug: false,
				noesis: this.noesisMode,
			});
		}
		
		cons.log("");
		cons.log("All files extracted.", "lime");

		GHSDK.Pause();
	}
	
	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// Show the menu for LZSS compression
	//--------------------------------------------
	
	async ShowExtMenu_LZSS()
	{
		GHSDK.ShowHeader();
		
		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: [
				{
					title: "Compress",
					description: '',
					value: "compress"
				},
				
				{
					title: "Compress (Header)",
					description: '',
					value: "compress_header"
				},
				
				{
					title: "Decompress",
					description: '',
					value: "decompress"
				},
				
				GHSDK.HomeOption()
			],
			initial: 0
		});
		
		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
			case 'decompress':
			case 'compress':
			case 'compress_header':
				if (mod.value == 'compress_header')
				{
					this.lzssMode = 'compress';
					this.lzssHeader = true;
				}
				else
				{
					this.lzssMode = mod.value;
					this.lzssHeader = false;
				}
			
				
				this.ShowExtMenu_LZSS_Select();
				break;
				
			default:
				return;
				break;
		}
	}
	
	//--------------------------------------------
	// Select which lzss to work on
	//--------------------------------------------
	
	async ShowExtMenu_LZSS_Select()
	{
		GHSDK.ShowHeader();
		
		var opt = [{
			title: "All Files",
			value: "all",
			description: "Operates on all files in the folder."
		}];
		
		var lzssFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'LZSS');
		var validFiles = [];
		
		if (fs.existsSync(lzssFolder))
		{
			var files = fs.readdirSync(lzssFolder);
			for (const file of files)
			{
				var fpath = path.join(lzssFolder, file);
					
				if (fs.statSync(fpath).isDirectory())
					continue;

				validFiles.push(fpath);
				
				opt.push({
					title: file,
					value: fpath
				});
			}
		}
		
		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a File",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});
		
		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}
		
		// Create a list of files that need to be operated on
		var toParse = [];
		
		if (val.value == 'all')
			toParse = validFiles;
		else
			toParse.push(val.value);
		
		GHSDK.ShowHeader();
		
		var outDir = (this.lzssMode == 'compress') ? 'Compressed' : 'Decompressed';
		var outDir_abs = path.join(lzssFolder, outDir);
		
		if (!fs.existsSync(outDir_abs))
			fs.mkdirSync(outDir_abs)

		for (const filePath of toParse)
		{
			var newData = fs.readFileSync(filePath);
			var outPath = path.join(lzssFolder, outDir, path.basename(filePath));
			
			var res;
			
			if (this.lzssMode == 'compress')
				res = GHSDK.Constants.LZSS.CompressBytes(newData);
			else
				res = GHSDK.Constants.LZSS.DecompressBytes(newData, true);
				
			if (res)
			{
				// Slap header on there if necessary
				if (this.lzssHeader)
				{
					var buf = Buffer.alloc(8);
					buf.writeUInt32BE(0x4C5A5353, 0);		// LZSS
					buf.writeUInt32BE(newData.length, 4);
					
					cons.debug("Uncompressed LZSS Length: " + newData.length, 'lzss');
					
					res.result = Buffer.concat([buf, res.result]);
				}
				
				fs.writeFileSync(outPath, res.result);
				cons.log(path.basename(outPath) + " " + (this.lzssMode + "ed!"), 'lime');
			}
			else
			{
				cons.warn(path.basename(outPath) + " failed LZSS!");
				continue;
			}
		}
		
		cons.log("");
		cons.log("All files " + this.lzssMode + "ed.", "lime");

		GHSDK.Pause();
	}

	//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	
	//--------------------------------------------
	// Show the menu for GZip compression
	//--------------------------------------------

	async ShowExtMenu_GZip()
	{
		GHSDK.ShowHeader();

		var mod = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select an Operation",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: [
				{
					title: "Decompress",
					description: '',
					value: "decompress"
				},
				
				GHSDK.HomeOption()
			],
			initial: 0
		});

		switch (mod.value)
		{
			case 'gohome':
				GHSDK.ShowHomeMenu();
				break;
				
			case 'decompress':
                this.gzipMode = "decompress";
				this.ShowExtMenu_GZip_Select();
				break;
				
			default:
				return;
				break;
		}
	}

	async ShowExtMenu_GZip_Select()
	{

		GHSDK.ShowHeader();
		
		var opt = [{
			title: "All Files",
			value: "all",
			description: "Operates on all files in the folder."
		}];

		var gzipFolder = path.join(GHSDK.Constants.DirSDK, 'Assets', 'GZip');
		var validFiles = [];

		if (fs.existsSync(gzipFolder))
		{
			var files = fs.readdirSync(gzipFolder);
			for (const file of files)
			{
				var fpath = path.join(gzipFolder, file);
					
				if (fs.statSync(fpath).isDirectory())
					continue;

				validFiles.push(fpath);
				
				opt.push({
					title: file,
					value: fpath
				});
			}
		}

		opt.push(GHSDK.HomeOption());
		
		var val = await GHSDK.Constants.Prompts({
			type: 'select',
			name: 'value',
			message: "Select a File",
			warn: 'WIP, check in the future',
			hint: ' ',
			choices: opt,
			initial: 0
		});

		if (!val.value)
			return;
		
		// GO HOME
		if (val.value == 'gohome')
		{
			GHSDK.ShowHomeMenu();
			return;
		}

		// Create a list of files that need to be operated on
		var toParse = [];
		
		if (val.value == 'all')
			toParse = validFiles;
		else
			toParse.push(val.value);
		
		GHSDK.ShowHeader();

		var outDir = (this.gzipMode == 'decompress') ? "Decompressed" : "Compressed"
		var outDir_abs = path.join(gzipFolder, outDir);
		
		if (!fs.existsSync(outDir_abs))
			fs.mkdirSync(outDir_abs)

		for (const filePath of toParse)
		{
			var outPath = path.join(gzipFolder, outDir, path.basename(filePath));
				
			if (this.gzipMode == 'decompress')
            {
				var res = GHSDK.Constants.GZip.Decompress(filePath, outPath);
            }
			else
			{
				cons.warn(path.basename(outPath) + " failed GZip, unknown mode!");
				continue;
			}
		}
			
		cons.log("");
		cons.log("All files " + this.gzipMode + "ed.", "lime");
	
		GHSDK.Pause();


	}
}

module.exports = new AssetsMenu();
