// Base class for all menu options, don't worry about it

class MenuCore
{
	Display()
	{
		return {
			title: this.title || 'Unknown',
			description: this.description || 'Unknown',
			value: this.value || '',
			disabled: this.disabled || false
		};
	}
	
	// Do something when we select this option, OR ANY OPTION
	Selected(val) {}
}

module.exports = MenuCore;
