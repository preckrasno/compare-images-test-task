import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:compare_images/services/image_constants.dart';

/// An extension on the [ui.Image] class that provides a histogram calculation
/// functionality. A histogram represents the distribution of colors in an image.
///
/// This extension allows for the calculation of histograms for each color
/// channel: Red, Green, and Blue.
extension ImageHistogram on ui.Image {
  /// Calculates the color histogram of the image.
  ///
  /// The histogram is a representation of the distribution of colors in an image.
  /// It provides insights into the intensity distribution of the Red, Green,
  /// and Blue channels of the image. Each channel's histogram is an array of
  /// 256 entries corresponding to the number of pixels in the image that have
  /// a particular intensity value (from 0 to 255).
  ///
  /// Returns:
  /// A [Map] where:
  /// - The key 'red' maps to the histogram of the red channel.
  /// - The key 'green' maps to the histogram of the green channel.
  /// - The key 'blue' maps to the histogram of the blue channel.
  ///
  /// Throws:
  /// An [Exception] if there's a failure in retrieving the byte data from
  /// the image.
  Future<Map<String, List<int>>> calculateHistogram() async {
    final ByteData? data = await toByteData();
    if (data == null) {
      throw Exception('Failed to retrieve byte data from image');
    }
    final Uint8List bytes = data.buffer.asUint8List();

    final List<int> redHistogram = List<int>.filled(256, 0);
    final List<int> greenHistogram = List<int>.filled(256, 0);
    final List<int> blueHistogram = List<int>.filled(256, 0);

    for (int i = 0; i < bytes.length; i += bytesPerPixel) {
      final int red = bytes[i + redOffset];
      final int green = bytes[i + greenOffset];
      final int blue = bytes[i + blueOffset];

      redHistogram[red]++;
      greenHistogram[green]++;
      blueHistogram[blue]++;
    }

    return {
      'red': redHistogram,
      'green': greenHistogram,
      'blue': blueHistogram,
    };
  }
}
