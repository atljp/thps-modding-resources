const FILE_NAME = 'PH.q'
const SCRIPT_NAME = 'PH_Scripts.q'

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

const crc32_table =
[
      0x00000000, 0x77073096, 0xee0e612c, 0x990951ba,
      0x076dc419, 0x706af48f, 0xe963a535, 0x9e6495a3,
      0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
      0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91,
      0x1db71064, 0x6ab020f2, 0xf3b97148, 0x84be41de,
      0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
      0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,
      0x14015c4f, 0x63066cd9, 0xfa0f3d63, 0x8d080df5,
      0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
      0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,
      0x35b5a8fa, 0x42b2986c, 0xdbbbc9d6, 0xacbcf940,
      0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
      0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116,
      0x21b4f4b5, 0x56b3c423, 0xcfba9599, 0xb8bda50f,
      0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
      0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,
      0x76dc4190, 0x01db7106, 0x98d220bc, 0xefd5102a,
      0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
      0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818,
      0x7f6a0dbb, 0x086d3d2d, 0x91646c97, 0xe6635c01,
      0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
      0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457,
      0x65b0d9c6, 0x12b7e950, 0x8bbeb8ea, 0xfcb9887c,
      0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
      0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2,
      0x4adfa541, 0x3dd895d7, 0xa4d1c46d, 0xd3d6f4fb,
      0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
      0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9,
      0x5005713c, 0x270241aa, 0xbe0b1010, 0xc90c2086,
      0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
      0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4,
      0x59b33d17, 0x2eb40d81, 0xb7bd5c3b, 0xc0ba6cad,
      0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
      0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683,
      0xe3630b12, 0x94643b84, 0x0d6d6a3e, 0x7a6a5aa8,
      0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
      0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe,
      0xf762575d, 0x806567cb, 0x196c3671, 0x6e6b06e7,
      0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
      0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5,
      0xd6d6a3e8, 0xa1d1937e, 0x38d8c2c4, 0x4fdff252,
      0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
      0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60,
      0xdf60efc3, 0xa867df55, 0x316e8eef, 0x4669be79,
      0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
      0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f,
      0xc5ba3bbe, 0xb2bd0b28, 0x2bb45a92, 0x5cb36a04,
      0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
      0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a,
      0x9c0906a9, 0xeb0e363f, 0x72076785, 0x05005713,
      0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
      0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21,
      0x86d3d2d4, 0xf1d4e242, 0x68ddb3f8, 0x1fda836e,
      0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
      0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c,
      0x8f659eff, 0xf862ae69, 0x616bffd3, 0x166ccf45,
      0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
      0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db,
      0xaed16a4a, 0xd9d65adc, 0x40df0b66, 0x37d83bf0,
      0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
      0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6,
      0xbad03605, 0xcdd70693, 0x54de5729, 0x23d967bf,
      0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
      0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
];

function GetQBKey(txt)
{
	// QBKeys must be lowercase
	txt = txt.toLowerCase();

	var buf = Buffer.from(txt, 'utf8');

	var crc = (new BigUint64Array([0xFFFFFFFFn]))[0];

	for (var l=0; l<buf.length; l++)
	{
		var p = BigInt(buf[l]);

		// Converts "crc ^ p" to unsigned long
		var numA = BigInt(crc^p);

		// Convert to an unsigned char
		var chrA = ( new Uint8Array([Number(numA)]) )[0];

		crc = BigInt(crc32_table[chrA]) ^ (crc >> 8n);
	}

	var finalCRC = ~crc;
	
	var res = (-finalCRC-1n).toString(16);

	// If not 8 chars, pad it with zeros
	if (res.length < 8)
		res = res.padStart(8, '0');

	// Convert to buffer and reverse bytes
	var hex = Buffer.from(res, 'hex');
	return hex.readUInt32BE(0);
}

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

const TOD_PREFIX_COUNT = 10;
const TOD_TIMES = [
    "day",
    "morning",
    "afternoon",
    "night"
];

const fs = require('fs');
const path = require('path');

var extra_prefixes = [];

function Convert()
{
    var inFile = path.join(__dirname, FILE_NAME);
    
    if (!fs.existsSync(inFile))
    {
        console.log(inFile + " did not exist.");
        return;
    }
    
    // -------------------------------------------------
    
    var scrFile = path.join(__dirname, SCRIPT_NAME);
    
    if (fs.existsSync(scrFile))
    {
        var lines = fs.readFileSync(scrFile).toString().replace(/\r/g, '\n').split('\n');
        
        for (var line of lines)
        {
            line = line.trim();
            var tlc = line.toLowerCase();
            
            if (tlc.indexOf("prefix") == -1)
                continue;
                
            var match = line.match(/'.+'/g);
            
            if (match && match.length)
            {
                var prf = match[0].replace(/'/g, '');
                console.log("Script Prefix: " + prf);
                extra_prefixes.push(prf);
            }
        }
    }
    
    // -------------------------------------------------
    
    var spl = FILE_NAME.split(".");
    var outFile = path.join(__dirname, spl[0] + "_out.q");
    
    console.log("Converting to " + path.basename(outFile) + "...");
    
    var lines = fs.readFileSync(inFile).toString().replace(/\r/g, '\n').split("\n");
    
    // -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    var inScript = false;
    var outLines = [];
    var nodeNames = [];
    var prefixes = {};
    var nodeArrayName = "";
    
    for (var line of lines)
    {
        var trim = line.trim().toLowerCase();
        
        // Node array name
        if (line.toLowerCase().indexOf("_nodearray") >= 0)
        {
            var array_name = line.trim();
            array_name = array_name.slice(0, array_name.toLowerCase().indexOf("_nodearray")).trim();
            
            console.log("  Zone name is probably " + array_name);
            
            nodeArrayName = array_name;
        }
        
        // Is it a node name?
        else if (line.trim().toLowerCase().indexOf("name =") == 0)
        {
            var nodeName = line.trim();
            nodeName = nodeName.slice(nodeName.indexOf("=")+1, nodeName.length).trim();
            
            nodeNames.push(nodeName);
            
            // --------------------------
            // Hey, see if it starts with a TOD. 
            // If so, then we want to add a createdfromtod param.
            // --------------------------
            
            var tod_prefix = "";
            
            for (var i=0; i<2; i++)
            {
                var onOffString = (i == 0) ? "off" : "on";
                
                for (const time of TOD_TIMES)
                {
                    for (var t=0; t<TOD_PREFIX_COUNT; t++)
                    {
                        var checkPrefix = time + onOffString + "_" + (t+1).toString().padStart(2, "0");
                        
                        if (nodeName.toLowerCase().indexOf(checkPrefix) == 0)
                            tod_prefix = checkPrefix;
                    }
                }
            }
            
            // --------------------------
            // Check level lights. These are
            // different in THUG2.
            // --------------------------
            
            for (const time of TOD_TIMES)
            {
                for (var t=0; t<TOD_PREFIX_COUNT; t++)
                {
                    var checkPrefix = "trg_" + time + "_levellight_" + (t+1).toString().padStart(2, "0");
                    
                    if (nodeName.toLowerCase().indexOf(checkPrefix) == 0)
                        tod_prefix = time + "on_" + (t+1).toString().padStart(2, "0");
                }
            }
            
            // --------------------------
            
            if (tod_prefix)
            {
                // Beautify it.
                var whitespace = "";
                for (var c=0; c<line.length; c++)
                {
                    if (line[c] == '\t' || line[c] == ' ')
                        whitespace += line[c];
                    else
                        break;
                }
                    
                    
                outLines.push(whitespace + "createdfromtod = TOD_" + tod_prefix);
            }
        }
        
        outLines.push(line);
    }
    
    // --------------------------------------
    
    if (nodeNames.length)
    {
        if (nodeArrayName)
        {
            outLines.push(nodeArrayName + "_NodeArray_SortedNames = [");
            
            for (const nn of nodeNames)
                outLines.push("\t" + nn);
            
            outLines.push("]");
            
            outLines.push("");
            
            outLines.push(nodeArrayName + "_NodeArray_SortedIndices = [");
            
            for (var nn=0; nn<nodeNames.length; nn++)
                outLines.push("\t" + nn);
            
            outLines.push("]");
            
            // -- GENERATE PREFIXES! -- //
            for (var nidx=0; nidx<nodeNames.length; nidx++)
            {
                const nn = nodeNames[nidx];
                
                // See if it matches any of our "extra" prefixes, from our scripts.
                for (const ep of extra_prefixes)
                {
                    if (nn.toLowerCase().indexOf(ep.toLowerCase()) == 0)
                    {
                        prefixes[ep] = prefixes[ep] || {id: ep, nodes: []};
                        
                        var hadNode = false;
                        for (const nd of prefixes[ep].nodes) { if (nd.arrayIndex == nidx) { hadNode = true; break; } }
                
                        if (!hadNode)
                            prefixes[ep].nodes.push({prefix: ep, index: prefixes[ep].nodes.length, arrayIndex: nidx});
                    }
                }
                
                // Does it end in a number?
                var isPrefixed = false;
                
                for (var n=0; n<99; n++)
                {
                    if (nn.endsWith(n.toString().padStart(2, "0")))
                    {
                        isPrefixed = true;
                        break;
                    }
                }
                
                if (!isPrefixed)
                    continue;
                    
                // This is a prefixed node. We need to add it to the array of prefixes.
                var numLength = 0;
                var chr = nn.length-1;
                
                while (chr >= 0)
                {
                    if (nn.charCodeAt(chr) >= 48 && nn.charCodeAt(chr) <= 57)
                        numLength ++;
                    else
                        break;
                        
                    chr --;
                }
                
                // Did not have a number.
                if (numLength <= 0)
                    continue;
                    
                var pfxname = nn.slice(0, nn.length - numLength);
                var pfxIndex = nn.slice(nn.length - numLength, nn.length);
                
                var plc = pfxname.toLowerCase();
                
                // Trim trailing underscores, if they exist.
                //~ while (pfxname[pfxname.length-1] == '_')
                    //~ pfxname = pfxname.slice(0, pfxname.length-1);
                
                // Make sure a prefix exists with this name.
                if (!prefixes[plc])
                    prefixes[plc] = {id: pfxname, nodes: []}
                    
                var hadNode = false;
                for (const nd of prefixes[plc].nodes) { if (nd.arrayIndex == nidx) { hadNode = true; break; } }
                
                if (!hadNode)
                    prefixes[plc].nodes.push({prefix: pfxname, index: parseInt(pfxIndex), arrayIndex: nidx});
            }
        }
        else
            console.log("Probably had nodes but could not find array name.");
    }
    
    // ---------------------------------------------
    // GENERATE ACTUAL PREFIXES, SORT THROUGH THEM
    
    var keys = Object.keys(prefixes);
    
    if (keys.length)
    {
        var buffers = [];
        
        var arrayQBKey = nodeArrayName + "_NodeArray";
        console.log("Creating .pfx for " + arrayQBKey + "...");
        
        arrayQBKey = GetQBKey(arrayQBKey);
        console.log(arrayQBKey.toString(16));
        
        // Push a buffer with node array name, and prefix count.
        var buf = Buffer.alloc(8);
        buf.writeUInt32LE(arrayQBKey, 0);
        buf.writeUInt32LE(keys.length, 4);
        buffers.push(buf);
        
        var indicesList = [];
        
        for (const key of keys)
        {
            const pfx = prefixes[key];
            
            if (!pfx.nodes.length)
                continue;
            
            // Each prefix in the .pfx file has:
            //  - id
            //  - list offset
            //  - node count
            
            var mapping = Buffer.alloc(12);
            mapping.writeUInt32LE( GetQBKey(pfx.id), 0 );       // ID
            mapping.writeUInt32LE( indicesList.length * 2, 4 ); // Offset
            mapping.writeUInt32LE( pfx.nodes.length, 8 );       // Prefix count
            
            buffers.push(mapping);
            
            for (const node of pfx.nodes)
                indicesList.push(node.arrayIndex);
        }
        
        // Now write the indices.
        var indBuf = Buffer.alloc(indicesList.length * 2);
        
        for (var i=0; i<indicesList.length; i++)
            indBuf.writeUInt16LE(indicesList[i], i*2);
            
        buffers.push(indBuf);
        
        console.log("  Writing .pfx...");
        var pfxOut = path.join(__dirname, nodeArrayName + ".pfx.wpc");
        fs.writeFileSync(pfxOut, Buffer.concat(buffers));
    }
    else
        console.log("No prefixed nodes to create.");
    
    // ---------------------------------------------
    
    //~ console.log(outLines.slice(800, outLines.length));
    fs.writeFileSync(outFile, outLines.join("\n"));
    
    console.log("Done.");
}

Convert();
