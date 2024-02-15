// ----------------------------------------------
//
//  VERTEX GROUP
//      A vertex group. Contains vertices.
//      Each vertex group is assigned to a
//      list of bones and contains a certain
//      amount of weights.
//
// ----------------------------------------------

class VertexGroup
{
    constructor(mesh)
    {
        this.mesh = mesh;
        
        this.boneIndices = [0, 0, 0, 0];
        this.vertices = [];
    }
}

module.exports = VertexGroup;
