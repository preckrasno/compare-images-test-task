import 'package:compare_images/ui/custom_painters/histogram_painter.dart';
import 'package:flutter/material.dart';

/// [RGBHistogramWidget] is a stateless widget designed to display color
/// histograms for the Red, Green, and Blue color channels using
/// the [HistogramPainter].
///
/// This widget encapsulates the logic for creating and managing the histograms
/// and uses [HistogramPainter] to handle the drawing part. It is built with a
/// specific width and height, making it versatile for integration into
/// different parts of your app.
class RGBHistogramWidget extends StatelessWidget {
  /// Histogram data for the red color channel.
  final List<int> _redData;

  /// Histogram data for the green color channel.
  final List<int> _greenData;

  /// Histogram data for the blue color channel.
  final List<int> _blueData;

  /// Height of the histogram drawing area.
  final double _height;

  /// Width of the histogram drawing area.
  final double _width;

  /// Constructs an [RGBHistogramWidget].
  ///
  /// - [redData]: List containing histogram data for the red channel.
  /// - [greenData]: List containing histogram data for the green channel.
  /// - [blueData]: List containing histogram data for the blue channel.
  /// - [height]: Height for the histogram drawing area.
  /// - [width]: Width for the histogram drawing area.
  const RGBHistogramWidget({
    required List<int> redData,
    required List<int> greenData,
    required List<int> blueData,
    required double height,
    required double width,
  })  : _height = height,
        _width = width,
        _blueData = blueData,
        _greenData = greenData,
        _redData = redData;

  /// This method returns a [CustomPaint] widget that draws the RGB histograms
  /// on the canvas using the [HistogramPainter].
  ///
  /// It ensures the histograms are painted within the specified width
  /// and height.
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HistogramPainter(
        redData: _redData,
        greenData: _greenData,
        blueData: _blueData,
      ),
      size: Size(_width, _height),
    );
  }
}
