import 'dart:typed_data';
import 'dart:ui' as ui;

const _bytesPerPixel = 4;
const _redOffset = 0;
const _greenOffset = 1;
const _blueOffset = 2;

/// An extension on the [ui.Image] class to provide additional functionalities
/// for image processing, including calculating the average RGB values and
/// determining the unique color count.
extension ImageProcessing on ui.Image {
  /// Calculates the average RGB values of the image.
  ///
  /// Returns:
  /// A [Map] containing the average red, green, and blue values.
  ///
  /// Throws:
  /// An [Exception] if there's a failure in retrieving the byte data from
  /// the image.
  Future<Map<String, double>> averageRGB() async {
    final ByteData? data = await toByteData();
    if (data == null) {
      throw Exception('Failed to retrieve byte data from image');
    }
    final Uint8List bytes = data.buffer.asUint8List();

    int sumRed = 0;
    int sumGreen = 0;
    int sumBlue = 0;

    for (int i = 0; i < bytes.length; i += _bytesPerPixel) {
      sumRed += bytes[i + _redOffset]; // Red component
      sumGreen += bytes[i + _greenOffset]; // Green component
      sumBlue += bytes[i + _blueOffset]; // Blue component
    }

    final int totalPixels = width * height;

    return {
      'red': sumRed / totalPixels,
      'green': sumGreen / totalPixels,
      'blue': sumBlue / totalPixels,
    };
  }

  /// Determines the number of unique colors present in the image.
  ///
  /// Returns:
  /// An [int] denoting the count of unique colors.
  ///
  /// Throws:
  /// An [Exception] if there's a failure in retrieving the byte data from
  /// the image.
  Future<int> uniqueColorsCount() async {
    final ByteData? data = await toByteData();
    if (data == null) {
      throw Exception('Failed to retrieve byte data from image');
    }
    final Uint8List bytes = data.buffer.asUint8List();

    final Set<int> uniqueColors = {};

    for (int i = 0; i < bytes.length; i += _bytesPerPixel) {
      final int red = bytes[i + _redOffset];
      final int green = bytes[i + _greenOffset];
      final int blue = bytes[i + _blueOffset];

      // Encode the color as an integer. This can be done by bit shifting.
      final int encodedColor = (red << 16) | (green << 8) | blue;
      uniqueColors.add(encodedColor);
    }

    return uniqueColors.length;
  }
}
