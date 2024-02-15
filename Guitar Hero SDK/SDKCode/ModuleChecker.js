// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Checks to make sure that required modules
// are installed. Errors are scary to users, so
// this should tell them what's going on.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

const fs = require('fs');
const path = require('path');

function CheckModules()
{
    var errors = [];
    
    var modulesDir = path.join(__dirname, '..', 'node_modules');
    
    const packagePath = path.join(__dirname, '..', 'package.json');
    
    if (!fs.existsSync(packagePath))
        return {success: false, errors: ["package.json did not exist."]};
        
    var data = JSON.parse( fs.readFileSync(packagePath).toString() );
    
    if (data.dependencies)
    {
        for (const key of Object.keys(data.dependencies))
        {
            var spl = key.replace(/\\/g, '/').split('/');
            var checkPath = [__dirname, '..', 'node_modules'].concat(spl);
            
            if (!fs.existsSync(checkPath.join(path.sep)))
                errors.push(key);
        }
    }
        
    return {success: (errors.length <= 0), errors: errors};
}

module.exports = CheckModules;
