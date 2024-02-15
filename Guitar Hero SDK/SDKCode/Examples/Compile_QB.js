console.log("Requiring SDK...");

// We can require the SDK without checksums, since we're not decompiling
// (Loading them is intensive and slows startup severely)

require('../../sdk.js')({noChecksums: true});

console.log("Compiling...");
GHSDK.M_CompileQB('./guitar_gems.txt', './guitar_gems.qb');
GHSDK.M_CompileQB('./guitar_gems.txt', './guitar_gems1.qb');
GHSDK.M_CompileQB('./guitar_gems.txt', './guitar_gems2.qb');

console.log("Done!");
