// - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	G H   N O T E
//		Single note
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - 

class GHNote
{
	constructor()
	{
		this.frets = [];
        this.accents = [];
        
        this.force_strum = false;
		this.hopo = false;
		this.star = false;
		this.open = false;
		this.time = 0.0;
		this.ticks = 0;
		this.length = 0.0;
		this.pitch = -1;
		this.vocal = false;
		
		// Special sustain frets
		// These disable bits in the final note
		this.exclude_frets = [];
	}
	
	// Left-most fret on the fretboard, FOR GUITAR
	LeftMostFret()
	{
		if (this.HasFret('green'))
			return 'green';
			
		if (this.HasFret('red'))
			return 'red';
			
		if (this.HasFret('yellow'))
			return 'yellow';
			
		if (this.HasFret('blue'))
			return 'blue';
			
		if (this.HasFret('orange'))
			return 'orange';
			
		return 'null';
	}
	
	// Replace fret color
	ReplaceFret(inColor, outColor)
	{
		for (var f=0; f<this.frets.length; f++)
		{
			if (this.frets[f].toLowerCase() == inColor.toLowerCase())
			{
				this.frets[f] = outColor;
				break;
			}
		}
	}
	
	// Exclude a fret color
	ExcludeFret(color)
	{
		var hasIt = false;
		
		for (const col of this.exclude_frets)
		{
			if (col == color)
				return;
		}
		
		this.exclude_frets.push(color);
	}
	
	// Has a fret?
	HasFret(col, sustain = false)
	{
		for (const fret of this.frets)
		{
			if (fret.toLowerCase() == col.toLowerCase())
				return true;
		}
		
		return false;
	}
	
	// Get frets as a string
	FretString()
	{
		var sorted = this.frets.sort((a, b) => a - b);
		return sorted.join("_");
	}
};

module.exports = GHNote;
