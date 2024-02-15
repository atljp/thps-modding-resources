// ---------------------------------------------------
//
//	STRING
//	Single-character string value
//
// ---------------------------------------------------

const ItemCore = require('./Core.js');

class QBCString extends ItemCore
{
	IsSingleLine() { return true; }
	Initialize() { this.value = ""; this.wide = false; }
	GetItemInfoType() { return QBC.constants.TypeBindings['String']; }
	GetDebugText() {
		var chr = this.wide ? "\"" : "'";

		return ": " + chr + this.value + chr;
	}

	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	D E S E R I A L I Z E
	//		Deserializes binary data
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

	Read()
	{
		// Script-specific string
		if (this.InScript())
		{
			var strLength = this.reader.UInt32();

            // THAW does not store widestring as wide characters. Apparently.
			if (this.wide)
			{
				var wCharCount = Math.floor((strLength-2) / 2);
				var tempstr = "";

				var inScript = this.InScriptBody();

				if (inScript)
					this.reader.LE = !this.reader.LE;

				for (var w=0; w<wCharCount; w++)
				{
					var toAdd = String.fromCharCode(this.reader.UInt16());

					tempstr += toAdd;
				}

				if (inScript)
					this.reader.LE = !this.reader.LE;

				this.value = tempstr;
				this.reader.UInt16();		 // Terminator
			}
			else
			{
				var charCount = strLength-1;
				var tempstr = "";

				for (var c=0; c<charCount; c++)
				{
					var toAdd = String.fromCharCode(this.reader.UInt8());

					tempstr += toAdd;
				}

				this.value = tempstr;
				this.reader.UInt8();		// Terminator
			}
		}

		// PakQB string
		else
		{
			this.ptr_stringStart = this.reader.Tell();

			// If we're headerless, we're not interested in shared
			// properties AT ALL! We want to read straight from
			// the string content

			if (this.sharedAllowed)
				this.ReadSharedProperties();

			this.reader.Seek(this.ptr_stringStart);

			if (this.wide && !this.job.IsTHAW())
				this.value = this.reader.TermWString();
			else
				this.value = this.reader.TermString();

			// Skip to nearest 4 bytes, just in case!
			// Our string might not be aligned

			this.reader.SkipToNearest(4);
		}
	}

	ReadSharedValue() { this.ptr_stringStart = this.reader.UInt32(); }

	// escape quotes
	EscapedText()
	{
		var chr = this.wide ? "\"" : "'";
		return this.value.replace(new RegExp(chr, "g"), '\\$&');
	}

	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	T E X T	  O U T P U T
	//		Outputs our data to text form
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

	WriteText()
	{
		var chr = this.wide ? "\"" : "'";

		if (this.InScript())
		{
			this.job.AddText(chr + this.EscapedText() + chr);
			this.AddInlineSpace();
			return;
		}

		this.WriteIDString();
		this.job.AddText(chr + this.EscapedText() + chr);

		if (this.CanAutoCreateNewlines())
			this.job.AddLine();
		else
			this.AddInlineSpace();
	}

	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
	//
	//	S E R I A L I Z E
	//		Converts JS data to QB bytecode
	//
	//--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

	//-----------------------
	// Writes the object's data
	// (In this case, a pointer to where the string begins)
	//-----------------------

	SerializeSharedData()
	{
		if (!this.InArray() && !this.InScriptBody())
			this.writer.UInt32(this.writer.Tell() + 8);		// Pointer to string data
	}

	//-----------------------
	// Serialize the main object's data
	// (Override this!)
	//-----------------------

	SerializeData()
	{
		// This serializes the item's information, etc.
		// (Everything that we would need for PakQB)

		super.SerializeData();

		// ----------

		var inScript = this.InScriptBody();

		// Prepend bytecode if in QBScript

        var writeWide = (this.wide);
        
        if (this.job.IsTHAW() && !inScript)
            writeWide = false;

		if (inScript)
		{
			if (writeWide)
			{
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_WIDESTRING);
				this.writer.UInt32((this.value.length+1) * 2);		// Including terminator!
			}
			else
			{
				this.writer.UInt8(QBC.constants.ESCRIPTTOKEN_STRING);
				this.writer.UInt32(this.value.length+1);		// Including terminator!
			}
		}

		if (writeWide)
		{
			// APPARENTLY, widestrings in scripts are in a reverse
			// endian from the script's normal endian.
			// Typically, scripts are LE and these are BE.

			if (inScript)
				this.writer.LE = !this.writer.LE;

			this.writer.ASCIIWString(this.value, true);

			if (inScript)
				this.writer.LE = !this.writer.LE;
		}
		else
			this.writer.ASCIIString(this.value, true);

		// DO NOT pad to nearest 4 bytes if:
		// - in array
		// - in script

		if (!this.InArray() && !this.InScriptBody())
			this.writer.PadToNearest(4);
	}
}

module.exports = QBCString;
