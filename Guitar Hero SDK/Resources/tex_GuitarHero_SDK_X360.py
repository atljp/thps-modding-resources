# ---------------------------------------------------
# Quick and dirty GH X360 importer
# This code untiles X360 DXT images, that is all
#
# Based off of GHFear's THPG script:
#       https://zenhax.com/viewtopic.php?t=9407
# ---------------------------------------------------

from inc_noesis import *

def registerNoesisTypes():
    handle = noesis.register("GHSDK Tex (Neversoft) [X360]", ".ghm")
    noesis.setHandlerTypeCheck(handle, noepyCheckType)
    noesis.setHandlerLoadRGBA(handle, noepyLoadRGBA)
    return 1

def noepyCheckType(data):
    bs = NoeBitStream(data)
    return 1
    
def noepyLoadRGBA(data, texList):

    bs = NoeBitStream(data, NOE_BIGENDIAN)

    datasize = bs.readInt()
    imgFmt = bs.readByte()
    imgWidth = bs.readInt()
    imgHeight = bs.readInt()
       
    data = bs.readBytes(datasize)   
       
    if imgFmt == 0x52:
        data = rapi.imageUntile360DXT(rapi.swapEndianArray(data, 2), imgWidth, imgHeight, 8)
        texFmt = noesis.NOESISTEX_DXT1
    elif imgFmt == 0x53:
        data = rapi.imageUntile360DXT(rapi.swapEndianArray(data, 2), imgWidth, imgHeight, 16)
        texFmt = noesis.NOESISTEX_DXT3
    elif imgFmt == 0x54:
        data = rapi.imageUntile360DXT(rapi.swapEndianArray(data, 2), imgWidth, imgHeight, 16)
        texFmt = noesis.NOESISTEX_DXT5
    elif imgFmt == 0x71:
        data = rapi.imageUntile360DXT(rapi.swapEndianArray(data, 2), imgWidth, imgHeight, 16)
        data = rapi.imageDecodeDXT(data, imgWidth, imgHeight, noesis.FOURCC_ATI2)
        texFmt = noesis.NOESISTEX_RGBA32
    elif imgFmt == 0x7C:
        data = rapi.imageUntile360DXT(rapi.swapEndianArray(data, 2), imgWidth, imgHeight, 8)
        data = rapi.imageDecodeDXT(data, imgWidth, imgHeight, noesis.FOURCC_DXT1NORMAL)
        texFmt = noesis.NOESISTEX_RGBA32
    elif imgFmt == 0x86:
        data = rapi.imageUntile360Raw(data, imgWidth, imgHeight, 4)
        data = rapi.imageDecodeRaw(data, imgWidth, imgHeight, "a8r8g8b8")
        texFmt = noesis.NOESISTEX_RGBA32
    elif imgFmt == 0x44:
        data = rapi.imageUntile360Raw(rapi.swapEndianArray(data, 2), imgWidth, imgHeight, 2)
        data = rapi.imageDecodeRaw(data, imgWidth, imgHeight, "b5g6r5")
        texFmt = noesis.NOESISTEX_RGBA32
    elif imgFmt == 0x43:
        data = rapi.imageUntile360Raw(rapi.swapEndianArray(data, 2), imgWidth, imgHeight, 2)
        data = rapi.imageDecodeRaw(data, imgWidth, imgHeight, "b5g5r6")
        texFmt = noesis.NOESISTEX_RGBA32
        
        # Multiply red by 2, why? Who knows
        for i in range(0, imgWidth*imgHeight):
            data[i*4 + 0] = data[i*4 + 0] * 2
    else:
        print("WARNING: Unhandled image format")
        return None
    texList.append(NoeTexture(rapi.getInputName(), imgWidth, imgHeight, data, texFmt))
    return 1

# 0100010010100110
# 0100100010100110
