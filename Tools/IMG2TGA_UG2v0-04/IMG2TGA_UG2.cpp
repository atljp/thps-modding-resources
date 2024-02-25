#include <windows.h>
#include <stdio.h>


// variables
unsigned char imgHeader[32]; // 32 BYTES
unsigned char *imgData;
unsigned char *pixData;
unsigned char *imgCData;
short imgWidth;
short imgHeight;
short imgDepth;
int imageSize;
short imgColorNum;
int pixCnt = 0; // holds index of Pixel Data copied...
bool compressed = false;

unsigned char tgaHeader[18];
unsigned char tgaFootExt[8];
char tgaFootTag[17] = "TRUEVISION-XFILE";

short pixW;
short pixH;
int pixSize;
short oX = 0;
short oY = 0;


// fucntions
bool OnConvertTGA(char *inFileName);
void OnCopyBlock(short bX, short bY, short bSize);


int main(int argc, char* argv[])
{

	// print main screen
	printf("\n");
	printf("+ THUG2 IMG to TGA Converter v0.4\n");
	printf("+ by Yoshua (Defeat0r)\n");
	printf("+ Web: http://jmn-web.tk \n");
	printf("---------------------------------\n");

	// vars
	char theFileName[MAX_PATH];

	// check runtime parameters
	if(argc < 2) {

		// open file dialog
		OPENFILENAME ofn;
		char szFileName[MAX_PATH] = "";

		ZeroMemory(&ofn, sizeof(ofn));

		ofn.lStructSize = sizeof(ofn);
		ofn.hwndOwner = NULL;
		ofn.lpstrFilter = "IMG File (*.img *img.xbx *img.dat)\0*.img;*img.xbx;*img.dat\0\0";
		ofn.lpstrFile = szFileName;
		ofn.nMaxFile = MAX_PATH;
		ofn.Flags = OFN_EXPLORER | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY;
		//ofn.lpstrDefExt = "img";
		ofn.lpstrInitialDir = NULL;

		if(GetOpenFileName(&ofn)) {

			strcpy(theFileName, szFileName);
		}
		else {

			printf("ERROR: No File Selected!\n");
			system("PAUSE");
			return false;
		}
	}
	else {

		strcpy(theFileName, argv[1]);
	}

	// check if correctly done...
	if(argc > 2) {

		printf("+ USAGE: IMG2TGA_UG2.exe [input.img]\n");
		return 0;
	}


	if(OnConvertTGA(theFileName)) {

		printf("File successfully converted! \n");
	}
	else {

		printf("Unable to convert file! \n");
	}

	// pause at end
	system("PAUSE");

	return 0;
}


bool OnConvertTGA(char *inFileName)
{

	// init and open file
	FILE *inFile;
	inFile = fopen(inFileName, "rb");

	// check if file can be opened
	if(inFile == NULL) {

		printf("ERROR: Unable to open file! \n");
		return false;
	}

	// read header data
	fread(imgHeader, 1, 32, inFile);

	// check if THUG2 IMG file...
	if(imgHeader[0] != 0x02 || imgHeader[1] != 0x00 || imgHeader[2] != 0x00 || imgHeader[3] != 0x00) {

		printf("ERROR: File not a THUG2 IMG format! \n");
		return false;
	}

	// get image width
	imgWidth = imgHeader[24] + (imgHeader[25] * 256);
	// get image height
	imgHeight = imgHeader[26] + (imgHeader[27] * 256);
	// get image depth
	imgDepth = 32;
	// get number of colors
	imgColorNum = imgHeader[28] + (imgHeader[29] * 256) + (imgHeader[30] * 256) + (imgHeader[31] * 256);
	imgColorNum /= 4;


	// calculate image size
	imageSize = (imgWidth * imgHeight) * (imgDepth / 8);

	// check if compressed
	if(imgColorNum != 0) compressed = true;

	// load in color data if compressed
	if(compressed == true) {

		imgCData = new unsigned char [imgColorNum*4]; // *4 so it refers to number of bytes
		fread(imgCData, 1, imgColorNum*4, inFile);
	}


	// print bmp details
	printf("\n");
	printf("Checking IMG Details...\n\n");
	printf("      Width: %ipx \n", imgWidth);
	printf("     Height: %ipx \n", imgHeight);
	printf(" Compressed: %i \n", (int)compressed);
	printf(" Image Size: %i \n\n", imageSize);

	// test
	//printf("R: %02X G: %02X B: %02X A: %02X \n", imgCData[0], imgCData[1], imgCData[2], imgCData[3]);


	if(compressed == false) {

		// allocate memory for imgData[]
		imgData = new unsigned char [imageSize];

		// load in RGB Data
		fread(imgData, 1, imageSize, inFile);
	}
	else {

		// work out pixel data size (image size rounded up)
		pixW = imgWidth; // do properly later...
		pixH = imgHeight;

		// pixel block vars
		short bX = 0; // block space pos (max of 4)
		short bY = 0; // (max of 4)
		short bSize;

		int lp;


		// from #c++ (mIRC)
		// yosh: use (x>0 && !(x&(x-1))
		// Yosh[d64] : int mask = 1; for (int i = 0; i < 32; ++i) { if (number & mask) /* do something*/ mask << 1; }

		// workout width for pixel data
		for(lp=pixW;lp<(pixW*2);lp++) {

			//if(lp>0 && lp&(lp-1) == 0) {
			if(lp == 8 || lp == 16 || lp == 32 || lp == 64 || lp == 128 || lp == 256 || lp == 512 || lp == 1024) {

				pixW = lp;
				break;
			}
		}

		// workout height for pixel data
		for(lp=pixH;lp<(pixH*2);lp++) {

			//if(lp>0 && lp&(lp-1) == 0) {
			if(lp == 8 || lp == 16 || lp == 32 || lp == 64 || lp == 128 || lp == 256 || lp == 512 || lp == 1024) {

				pixH = lp;
				break;
			}
		}


		// set actual image start (cause pixW & pixH maybe rounded up)
		for(lp=imgWidth;lp<pixW;lp++) {

			oX++;
		}

		for(lp=imgHeight;lp<pixH;lp++) {

			oY++;
		}


		// update image size, width & height
		//imgWidth = pixW;
		//imgHeight = pixH;
		//imageSize = (imgWidth * imgHeight) * (imgDepth / 8);


		// set pixel data size
		pixSize = (pixW*pixH);

		// allocate memory for imgData[]
		imgData = new unsigned char [pixSize*4];

		// allocate memory for pixData[]
		pixData = new unsigned char [pixSize];
		
		// load in Pixel Data
		fread(pixData, 1, pixSize, inFile);


		// loop through Pixel Data
		for(lp=0;lp<pixSize;lp++) { // 128 // imageSize/4 cause 1 byte represents 1 pixel


			// work out the block size...
			if(pixW <= pixH) {

				bSize = pixW;
			}
			else if(pixH <= pixW) {

				bSize = pixH;
			}

			// Copy Block
			OnCopyBlock(bX, bY, bSize);
			lp += (bSize*bSize);

			// work out next position...
			if(pixW <= pixH) {

				bY += bSize;
			}
			else if(pixH <= pixW) {

				bX += bSize;
			}

		} // end loop

		
		unsigned char tmp;
		short tCnt = 0;
		short tX = 0;

		// Resize image...
		for(lp=0;lp<imageSize;lp++) {

			if(tCnt == (imgWidth*4)) {

				tX += oX;
				tCnt = 0;
			}

			tmp = imgData[lp+(oY*(pixW*4)) + (tX*4)];
			imgData[lp] = tmp;

			tCnt++;
		}
		
	}

	fclose(inFile);

	// setup tga header...
	short lp2;
	for(lp2=0;lp2<18;lp2++) tgaHeader[lp2] = 0x00; // set all bytes to 0x00
	tgaHeader[2] = 0x02; // image type code...
	tgaHeader[12] = *((char*)&imgWidth); tgaHeader[13] = *(((char*)&imgWidth)+1); // width
	tgaHeader[14] = *((char*)&imgHeight); tgaHeader[15] = *(((char*)&imgHeight)+1); // height
	tgaHeader[16] = 0x20; // depth (32)
	tgaHeader[17] = 0x08; // image descriptor byte???


	// setup tga footer extension...
	for(lp2=0;lp2<8;lp2++) tgaFootExt[lp2] = 0x00; // set all bytes to 0x00


	// change filename
	short fnlen = strlen(inFileName);
	inFileName[fnlen-3] = 't';
	inFileName[fnlen-2] = 'g';
	inFileName[fnlen-1] = 'a';


	// init and out output file
	FILE *outFile;
	outFile = fopen(inFileName, "wb");

	// write data
	fwrite(tgaHeader, 1, 18, outFile);
	fwrite(imgData, 1, imageSize, outFile);
	fwrite(tgaFootExt, 1, 8, outFile);
	fwrite(tgaFootTag, 1, 16, outFile);
	fputc(0x2E, outFile); // at end of file...
	fputc(0x00, outFile); // at end of file...

	fclose(outFile);


	// free allocated memory
	delete[] imgData;
	delete[] pixData;
	delete[] imgCData;

	return true;
}


void OnCopyBlock(short bX, short bY, short bSize)
{

	// variables
	int pos = 0;
	unsigned char pix = 0;

	unsigned char lp1024=0;
	short x1024=0, y1024=0;
	unsigned char lp512=0;
	short x512=0, y512=0;
	unsigned char lp256=0;
	short x256=0, y256=0;
	unsigned char lp128=0;
	short x128=0, y128=0;
	unsigned char lp64=0;
	short x64=0, y64=0;
	unsigned char lp32=0;
	short x32=0, y32=0;
	unsigned char lp16=0;
	short x16=0, y16=0;
	unsigned char lp8=0;
	short x8=0, y8=0;
	unsigned char lp4=0;
	short x4=0, y4=0;
	unsigned char lp2=0;
	short x2=0, y2=0;


	for(int blp=0;blp<bSize*bSize;blp++) {


		// 1024x1024
		if(lp1024 == 0) { // enter bottom/left

			x1024 = 0;
			y1024 = 0;
		}
		else if(lp1024 == 1) { // enter bottom/right

			x1024 = 512;
			y1024 = 0;
		}
		else if(lp1024 == 2) { // enter top/left

			x1024 = 0;
			y1024 = 512;
		}
		else if(lp1024 == 3) { // enter top/right

			x1024 = 512;
			y1024 = 512;
		}


		// 512x512
		if(lp512 == 0) { // enter bottom/left

			x512 = 0;
			y512 = 0;
		}
		else if(lp512 == 1) { // enter bottom/right

			x512 = 256;
			y512 = 0;
		}
		else if(lp512 == 2) { // enter top/left

			x512 = 0;
			y512 = 256;
		}
		else if(lp512 == 3) { // enter top/right

			x512 = 256;
			y512 = 256;
		}


		// 256x256
		if(lp256 == 0) { // enter bottom/left

			x256 = 0;
			y256 = 0;
		}
		else if(lp256 == 1) { // enter bottom/right

			x256 = 128;
			y256 = 0;
		}
		else if(lp256 == 2) { // enter top/left

			x256 = 0;
			y256 = 128;
		}
		else if(lp256 == 3) { // enter top/right

			x256 = 128;
			y256 = 128;
		}


		// 128x128
		if(lp128 == 0) { // enter bottom/left

			x128 = 0;
			y128 = 0;
		}
		else if(lp128 == 1) { // enter bottom/right

			x128 = 64;
			y128 = 0;
		}
		else if(lp128 == 2) { // enter top/left

			x128 = 0;
			y128 = 64;
		}
		else if(lp128 == 3) { // enter top/right

			x128 = 64;
			y128 = 64;
		}


		// 64x64
		if(lp64 == 0) { // enter bottom/left

			x64 = 0;
			y64 = 0;
		}
		else if(lp64 == 1) { // enter bottom/right

			x64 = 32;
			y64 = 0;
		}
		else if(lp64 == 2) { // enter top/left

			x64 = 0;
			y64 = 32;
		}
		else if(lp64 == 3) { // enter top/right

			x64 = 32;
			y64 = 32;
		}


		// 32x32
		if(lp32 == 0) { // enter bottom/left

			x32 = 0;
			y32 = 0;
		}
		else if(lp32 == 1) { // enter bottom/right

			x32 = 16;
			y32 = 0;
		}
		else if(lp32 == 2) { // enter top/left

			x32 = 0;
			y32 = 16;
		}
		else if(lp32 == 3) { // enter top/right

			x32 = 16;
			y32 = 16;
		}


		// 16x16
		if(lp16 == 0) { // enter bottom/left

			x16 = 0;
			y16 = 0;
		}
		else if(lp16 == 1) { // enter bottom/right

			x16 = 8;
			y16 = 0;
		}
		else if(lp16 == 2) { // enter top/left

			x16 = 0;
			y16 = 8;
		}
		else if(lp16 == 3) { // enter top/right

			x16 = 8;
			y16 = 8;
		}


		// 8x8
		if(lp8 == 0) { // enter bottom/left

			x8 = 0;
			y8 = 0;
		}
		else if(lp8 == 1) { // enter bottom/right

			x8 = 4;
			y8 = 0;
		}
		else if(lp8 == 2) { // enter top/left

			x8 = 0;
			y8 = 4;
		}
		else if(lp8 == 3) { // enter top/right

			x8 = 4;
			y8 = 4;
		}


		// 4x4
		if(lp4 == 0) { // enter bottom/left

			x4 = 0;
			y4 = 0;
		}
		else if(lp4 == 1) { // enter bottom/right

			x4 = 2;
			y4 = 0;
		}
		else if(lp4 == 2) { // enter top/left

			x4 = 0;
			y4 = 2;
		}
		else if(lp4 == 3) { // enter top/right

			x4 = 2;
			y4 = 2;
		}


		// 2x2
		if(lp2 == 0) { // enter bottom/left

			x2 = 0;
			y2 = 0;
		}
		else if(lp2 == 1) { // enter bottom/right

			x2 = 1;
			y2 = 0;
		}
		else if(lp2 == 2) { // enter top/left

			x2 = 0;
			y2 = 1;
		}
		else if(lp2 == 3) {

			x2 = 1;
			y2 = 1;
		}


		// set wher to copy pixel
		pos = (bX+x2+x4+x8+x16+x32+x64+x128+x256+x512+x1024) + ((bY+y2+y4+y8+y16+y32+y64+y128+y256+y512+y1024)*pixW);

		pix = pixData[pixCnt];
		pixCnt++; // increase pixel index

		imgData[pos*4] = imgCData[pix*4]; // R
		imgData[(pos*4)+1] = imgCData[(pix*4)+1]; // G
		imgData[(pos*4)+2] = imgCData[(pix*4)+2]; // B
		imgData[(pos*4)+3] = imgCData[(pix*4)+3]; // A


		// update lp's
		lp2++;
		if(lp2 == 4) {

			lp2 = 0;
			lp4++;
		}
		if(lp4 == 4) {

			lp4 = 0;
			lp8++;
		}
		if(lp8 == 4) {

			lp8 = 0;
			lp16++;
		}
		if(lp16 == 4) {

			lp16 = 0;
			lp32++;
		}
		if(lp32 == 4) {

			lp32 = 0;
			lp64++;
		}
		if(lp64 == 4) {

			lp64 = 0;
			lp128++;
		}
		if(lp128 == 4) {

			lp128 = 0;
			lp256++;
		}
		if(lp256 == 4) {

			lp256 = 0;
			lp512++;
		}
		if(lp512 == 4) {

			lp512 = 0;
			lp1024++;
		}
		if(lp1024 == 4) {

			lp1024 = 0;
		}
	}
}
