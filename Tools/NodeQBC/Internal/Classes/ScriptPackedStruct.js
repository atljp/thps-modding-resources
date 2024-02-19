// ---------------------------------------------------
//
//	PACKED STRUCT
//	Used in scripts
//
//	Why NS uses this is unknown but these are
//	essentially PakQB structs that can be within
//	scripts, they may not even provide any benefit
//
//	Regardless, they're very confusing
//
// ---------------------------------------------------

const QBCStruct = require('./Struct.js');

class QBScriptPackedStruct extends QBCStruct
{
	SerializeStructPakInfo() { return false; }
	SerializeItemInfo() {}
	IsPackedStruct() { return true; }
	
	Initialize() 
	{
		super.Initialize();
		
		// Decompiled data that we'll use when writing
		
		this.data = "";
		
		// Our QBC job, separate from our serialize job
		// (We'll use this later)
		
		this.qbcJob = null;
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Internal serialize func, do not touch!
	//
	// (We override this because we do A LOT in our
	// serialize function, we want to handle children
	// in a very specific way)
	//-----------------------
	
	_Serialize()
	{
		// If we have a QBC job, we're serializing our bytecode!
		
		if (this.qbcJob)
		{
			super._Serialize();
			return;
		}
		
		// ----------
		
		if (!this.writer)
		{
			this.Fail("Cannot serialize without writer.");
			return;
		}
		
		this.ptr_spawnOffset = this.writer.Tell();
		
		this.job.TabbedDebug("Serialize: " + this.GetID() + " [" + this.GetClassName() + "]");
		
		// Store our current job as our main job
		
		this.qbcJob = this.job;
		
		// Create a new QBC job for serializing our JS data
		// (This will set it for our children as well)
        
        var options = Object.assign({}, this.job.taskOptions || {});
        options.headerless = true;
		
		var subJob = QBC.SpawnJob();
		this.SetJob(subJob);
		
		// Serialize our data into bytes with our sub-job assigned,
		// this should (hopefully) get us compiled bytecode
		
		subJob.Compile(this, null, options);
		
		// Hand control back to our main job
		
		this.SetJob(this.qbcJob);
		this.qbcJob = null;
		
		// Did our sub-job fail?
		if (subJob.Failed())
		{
			var res = subJob.GetResults();
			console.log(res);
			
			this.Fail("PackedStruct failed to serialize, sub-job failed!");
			return;
		}
		
		var jobResults = subJob.GetResults();
		if (!jobResults)
		{
			this.Fail("PackedStruct could not get results from sub-job.");
			return;
		}
		
		var byteBuffer = jobResults.GetData();
		
        if (!byteBuffer)
        {
            this.Fail("PackedStruct somehow did not have compiled byte data.");
            return;
        }
        
		QBC.KillJob();
		
		// ----------
		
		// FINALLY, at long last, we have byte data!
		// Now we need to write it to our MAIN buffer
		
		this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_INLINEPACKSTRUCT);
		this.writer.UInt16(byteBuffer.length);
		this.writer.PadToNearest(4);
		this.writer.Combine(byteBuffer);
	}
	
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	D E S E R I A L I Z E
	//		Deserializes binary data
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	
	//-----------------------
	// Begin reading from data
	//-----------------------
	
	Read()
	{	
		var dataSize = this.reader.UInt16();
		this.reader.SkipToNearest(4);
		
		// Get the compiled QB bytecode
		var byteData = this.reader.Chunk(dataSize);
		
		// We're only concerned about the text data,
		// so we can just jam it into QBC and get the result
		//
		// (Just like we would decompile a .qb file!)
		
        var options = Object.assign({}, this.job.taskOptions || {});
        options.packedStruct = true;
        
		var subJob = QBC.SpawnJob(options);
		subJob.Decompile(byteData, null, options);
		
		// ------------
		
		var jobResults = subJob.GetResults();
		if (!jobResults)
		{
			this.Fail("PackedStruct could not get results from sub-job.");
			return;
		}
		
        if (jobResults.errors && jobResults.errors.length)
        {
            for (const err of jobResults.errors)
                console.error(err);
                
            this.Fail("PackedStruct had errors, aborting.");
            return;
        }
        
        
		QBC.KillJob();
		
        var jobData = jobResults.GetData();
        
        if (!jobData)
        {
            this.Fail("PackedStruct somehow did not get sub-job data.");
            return;
        }
        
		this.data = jobData.trim();
	}
	
	//-----------------------
	// Internal write, DO NOT CALL
	//-----------------------
	
	_WriteText()
	{
        this.job.AddText("\\");
        var lines = this.data.replace(/\r/g, '\n').split('\n');
        
        // Single line
        if (lines.length == 1)
            this.job.AddText(lines[0]);
            
        // Multi lines
        else
        {
            for (var l=0; l<lines.length; l++)
            {
                var line = lines[l];
                
                this.job.AddText(line);
                
                if (l < lines.length-1)
                    this.job.AddLine();
            }
        }
	}
}

module.exports = QBScriptPackedStruct;
