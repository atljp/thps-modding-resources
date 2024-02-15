// - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	G H   T R A C K
//		Contains GH notes
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - 

class GHTrackContainer
{
	constructor()
	{
		this.notes = [];
	}
}

class GHTrack
{
	constructor()
	{
		this.lefthand_notes = [];
		
		// Note containers for various difficulties
		this.diffs = {
			'easy': new GHTrackContainer(),
			'medium': new GHTrackContainer(),
			'hard': new GHTrackContainer(),
			'expert': new GHTrackContainer()
		};
	}
}

module.exports = GHTrack;
