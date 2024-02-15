const fs = require('fs');
const path = require('path');

global.SDK_OPTIONS = {noHome: true};

require('../../sdk.js');

var th = require('./TexHandler.js');

var handler = new th();
handler.Extract(path.join(__dirname, 'wor_judy_warrior.tex.xen'), path.join(__dirname, 'out'), {noesis: true});
