console.log("Requiring SDK...");

// Notice that we didn't pass in noChecksums as an option
// (We need checksums to decompile, as slow as loading them may be)

require('../../sdk.js')();

console.log("Decompiling...");
GHSDK.M_DecompileQB('./guitar_gems.qb', './guitar_gems.txt');

console.log("Done!");
