// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	Unit test for deserializing Havok ragdolls
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

console.log("Loading SDK...");
require(path.join(__dirname, '..', '..', 'sdk.js'))({noChecksums: true});

const TO_OPERATE = path.join(__dirname, 'Rag_GH_Rocker_Male_Rockbot_original.rag.xen');

Havok.DeserializeRagdoll(TO_OPERATE);

for (const warn of Havok.warnings)
	cons.warn(warn);
	
for (const err of Havok.errors)
	cons.error(err);
