import 'dart:typed_data';
import 'dart:ui' as ui;

const bytesPerPixel = 4;
const redOffset = 0;
const greenOffset = 1;
const blueOffset = 2;

extension ImageProcessing on ui.Image {
  Future<Map<String, double>> averageRGB() async {
    final ByteData? data = await toByteData();
    if (data == null) {
      throw Exception('Failed to retrieve byte data from image');
    }
    final Uint8List bytes = data.buffer.asUint8List();

    int sumRed = 0;
    int sumGreen = 0;
    int sumBlue = 0;

    for (int i = 0; i < bytes.length; i += bytesPerPixel) {
      sumRed += bytes[i + redOffset]; // Red component
      sumGreen += bytes[i + greenOffset]; // Green component
      sumBlue += bytes[i + blueOffset]; // Blue component
    }

    final int totalPixels = width * height;

    return {
      'red': sumRed / totalPixels,
      'green': sumGreen / totalPixels,
      'blue': sumBlue / totalPixels,
    };
  }

  Future<int> uniqueColorsCount() async {
    final ByteData? data = await toByteData();
    if (data == null) {
      throw Exception('Failed to retrieve byte data from image');
    }
    final Uint8List bytes = data.buffer.asUint8List();

    final Set<int> uniqueColors = {};

    for (int i = 0; i < bytes.length; i += bytesPerPixel) {
      final int red = bytes[i + redOffset];
      final int green = bytes[i + greenOffset];
      final int blue = bytes[i + blueOffset];

      // Encode the color as an integer. This can be done by bit shifting.
      final int encodedColor = (red << 16) | (green << 8) | blue;
      uniqueColors.add(encodedColor);
    }

    return uniqueColors.length;
  }
}
