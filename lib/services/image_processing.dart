import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:compare_images/services/image_constants.dart';

/// An extension on the [ui.Image] class to provide additional functionalities
/// for image processing, including calculating the average RGB values and
/// determining the unique color count.
extension ImageProcessing on ui.Image {
  /// Calculates the average RGB values of the image.
  ///
  /// This method computes the average values of the red (R), green (G),
  /// and blue (B) components of all pixels in the image. It does so by:
  ///
  /// 1. Retrieving byte data for each pixel's color information.
  /// 2. Initializing sum variables for red, green, and blue values.
  /// 3. Iterating through the byte array, fetching the RGB values for each
  /// pixel.
  /// 4. Computing the average RGB values by dividing each sum by the total
  /// pixel count.
  ///
  /// As an illustrative example, for an image with pixel colors:
  /// - Pixel 1: (200, 150, 100)
  /// - Pixel 2: (100, 50, 150)
  /// The average RGB values would be:
  /// - Red: 150.0, Green: 100.0, Blue: 125.0
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

  /// Determines the number of unique colors present in the image.
  ///
  /// This method calculates the number of distinct colors in the image by:
  ///
  /// 1. Retrieving byte data for each pixel's color information.
  /// 2. Initializing a set to store unique color values.
  /// 3. Iterating through the byte array, fetching the RGB values for each
  /// pixel and encoding these values into a single integer.
  /// 4. Adding the encoded color to the set, ensuring only unique values are
  /// stored.
  ///
  /// As an illustrative example, for an image with pixel colors:
  /// - Pixel 1: (200, 150, 100)
  /// - Pixel 2: (100, 50, 150)
  /// - Pixel 3: (200, 150, 100)
  /// Even though there are 3 pixels, there are only 2 unique colors because
  /// Pixel 1 and Pixel 3 share the same RGB values. Thus, the result would
  /// be `2`.
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
