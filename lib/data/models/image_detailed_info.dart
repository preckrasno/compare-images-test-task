import 'package:equatable/equatable.dart';

/// Class [ImageDetailedInfo] represents information about image.
class ImageDetailedInfo extends Equatable {
  /// Path to image.
  final String path;

  /// Width of image in pixels.
  final int width;

  /// Height of image in pixels.
  final int height;

  /// Size of image in bytes.
  final int bytes;

  /// Average red color value of image.
  final int averageRed;

  /// Average green color value of image.
  final int averageGreen;

  /// Average blue color value of image.
  final int averageBlue;

  /// Number of unique colors in image.
  final int numberOfUniqueColors;

  /// Number of pixels in image.
  final int numberOfPixels;

  /// Histogram for red channel.
  final List<int> redHistogram;

  /// Histogram for green channel.
  final List<int> greenHistogram;

  /// Histogram for blue channel.
  final List<int> blueHistogram;

  @override
  List<Object?> get props => [
        path,
        width,
        height,
        bytes,
        averageRed,
        averageGreen,
        averageBlue,
        numberOfUniqueColors,
        numberOfPixels,
        redHistogram,
        greenHistogram,
        blueHistogram,
      ];

  /// Constructor [ImageDetailedInfo] will be used to initialize the required
  /// parameters
  const ImageDetailedInfo({
    required this.path,
    required this.width,
    required this.height,
    required this.bytes,
    required this.averageRed,
    required this.averageGreen,
    required this.averageBlue,
    required this.numberOfUniqueColors,
    required this.redHistogram,
    required this.greenHistogram,
    required this.blueHistogram,
  }) : numberOfPixels = width * height;

  /// Method [copyWith] will be used to create a copy of the [ImageDetailedInfo]
  /// instance
  ImageDetailedInfo copyWith({
    String? path,
    int? width,
    int? height,
    int? bytes,
    int? averageRed,
    int? averageGreen,
    int? averageBlue,
    int? numberOfUniqueColors,
    List<int>? redHistogram,
    List<int>? greenHistogram,
    List<int>? blueHistogram,
  }) {
    return ImageDetailedInfo(
      path: path ?? this.path,
      width: width ?? this.width,
      height: height ?? this.height,
      bytes: bytes ?? this.bytes,
      averageRed: averageRed ?? this.averageRed,
      averageGreen: averageGreen ?? this.averageGreen,
      averageBlue: averageBlue ?? this.averageBlue,
      numberOfUniqueColors: numberOfUniqueColors ?? this.numberOfUniqueColors,
      redHistogram: redHistogram != null
          ? List.from(redHistogram)
          : List.from(this.redHistogram),
      greenHistogram: greenHistogram != null
          ? List.from(greenHistogram)
          : List.from(this.greenHistogram),
      blueHistogram: blueHistogram != null
          ? List.from(blueHistogram)
          : List.from(this.blueHistogram),
    );
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'ImageInfo(path: $path, width: $width, height: $height, bytes: $bytes, averageRed: $averageRed, averageGreen: $averageGreen, averageBlue: $averageBlue, numberOfUniqueColors: $numberOfUniqueColors, numberOfPixels: $numberOfPixels, redHistogram: $redHistogram, greenHistogram: $greenHistogram, blueHistogram: $blueHistogram)';
  }
}
