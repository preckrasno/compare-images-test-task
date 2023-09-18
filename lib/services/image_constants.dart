/// Represents the number of bytes for each pixel in an RGBA image.
///
/// In an RGBA image, each pixel is represented by 4 bytes:
/// 1. Red
/// 2. Green
/// 3. Blue
/// 4. Alpha (opacity)
const bytesPerPixel = 4;

/// The offset to retrieve the red component of a pixel in an RGBA image.
///
/// When iterating over the bytes of an image, this offset helps locate
/// the byte corresponding to the red color component for a particular pixel.
const redOffset = 0;

/// The offset to retrieve the green component of a pixel in an RGBA image.
///
/// When iterating over the bytes of an image, this offset helps locate
/// the byte corresponding to the green color component for a particular pixel.
const greenOffset = 1;

/// The offset to retrieve the blue component of a pixel in an RGBA image.
///
/// When iterating over the bytes of an image, this offset helps locate
/// the byte corresponding to the blue color component for a particular pixel.
const blueOffset = 2;
