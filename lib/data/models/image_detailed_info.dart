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
    );
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'ImageInfo(path: $path, width: $width, height: $height, bytes: $bytes, averageRed: $averageRed, averageGreen: $averageGreen, averageBlue: $averageBlue, numberOfUniqueColors: $numberOfUniqueColors, numberOfPixels: $numberOfPixels)';
  }
}
