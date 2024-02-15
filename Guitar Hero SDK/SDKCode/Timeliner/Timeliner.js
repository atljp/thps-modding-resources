// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
//
//	T I M E L I N E R
//		Local server for handling timeline editing
//
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const express = require('express');
const statics = express.static(__dirname);
const fs = require('fs');
const path = require('path');

const TIMELINER_PORT = 2009;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

class Timeliner
{
	constructor() 
	{ 
		if (GHSDK.standalone)
			console.log("Timeliner initialized."); 
	}
	
	//--------------------------------
	// Opened timeliner from song menu
	//--------------------------------
	
	FromMenu()
	{
		GHSDK.ShowHeader();
		
		this.Host();
	}
	
	//--------------------------------
	// Begin hosting the Timeliner server
	//--------------------------------
	
	Host()
	{
		cons.log("Starting Timeliner server...");
		
		this.app = express();
		this.app.listen(TIMELINER_PORT, () => {
			cons.log("");
			cons.log('Timeliner listening on port ' + TIMELINER_PORT + '!', 'lime');
			
			var orn = GHSDK.Constants.Chalk.keyword('orange');
			var wht = GHSDK.Constants.Chalk.keyword('white');
			cons.log(wht("To use Timeliner, open ") + orn("127.0.0.1:" + TIMELINER_PORT) + wht(" in your browser."));
		})
		this.app.use(statics);
		
		this.app.get('*', (req, res) => { this.HandleRequest(req, res); });
		this.app.use((req, res, next) => { this.HandleRequest(req, res); });
	}
	
	//--------------------------------
	// Handle a request from client
	//--------------------------------
	
	HandleRequest(req, res)
	{
		// We'll read it every time it's requested, easy updating!
		var html = fs.readFileSync(path.join(__dirname, 'timeliner.html')).toString();
		res.send(html);
	}
}

module.exports = Timeliner;
