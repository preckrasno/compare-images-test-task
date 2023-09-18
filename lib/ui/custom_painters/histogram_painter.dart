import 'package:flutter/material.dart';

/// [HistogramPainter] is a custom painter designed to visualize color histograms.
/// It paints histograms for the Red, Green, and Blue color channels.
///
/// The painter uses three lists of data representing the histogram values for
/// each color channel. These lists should have a length of 256 (since there are
/// 256 possible values in each color channel), where each entry represents the
/// frequency of a particular color intensity value.
class HistogramPainter extends CustomPainter {
  final List<int> _redData;
  final List<int> _greenData;
  final List<int> _blueData;

  /// Specifies the opacity level of the drawn histograms.
  /// By default, it is set to 0.5 to allow the overlapping histograms to be
  /// visible together.
  final double _opacity = 0.5;

  /// Constructs a [HistogramPainter].
  ///
  /// - [redData]: List containing histogram data for the red channel.
  /// - [greenData]: List containing histogram data for the green channel.
  /// - [blueData]: List containing histogram data for the blue channel.
  HistogramPainter({
    required List<int> redData,
    required List<int> greenData,
    required List<int> blueData,
  })  : _blueData = blueData,
        _greenData = greenData,
        _redData = redData;

  /// Internal method to draw a single histogram on the canvas.
  ///
  /// - [canvas]: Canvas where the histogram will be drawn.
  /// - [size]: Size of the drawing area.
  /// - [data]: List containing the histogram data.
  /// - [color]: Color for the histogram bars.
  void _drawHistogram(Canvas canvas, Size size, List<int> data, Color color) {
    final double width = size.width / data.length;

    for (int i = 0; i < data.length; i++) {
      final double height =
          (data[i] / data.reduce((curr, next) => curr > next ? curr : next)) *
              size.height;
      canvas.drawRect(
        Rect.fromLTWH(i * width, size.height - height, width, height),
        Paint()..color = color.withOpacity(_opacity),
      );
    }
  }

  /// This method is responsible for drawing the histograms on the canvas.
  ///
  /// It draws the histograms for each color channel, overlaying them. This
  /// allows visualization of the intensity distribution of the Red, Green, and
  /// Blue channels.
  @override
  void paint(Canvas canvas, Size size) {
    _drawHistogram(canvas, size, _blueData, Colors.blue);
    _drawHistogram(canvas, size, _greenData, Colors.green);
    _drawHistogram(canvas, size, _redData, Colors.red);
  }

  /// Specifies whether the painter should redraw when given new data.
  ///
  /// In this implementation, it always returns `false` indicating the painter
  /// does not need to repaint when given new data. This can be adjusted as per
  /// use-case requirements.
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
