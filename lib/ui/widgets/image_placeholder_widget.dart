import 'dart:io';

import 'package:compare_images/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

/// Widget for image placeholder
class ImagePlaceholderWidget extends StatelessWidget {
  final String? _imagePath;

  /// Constructor [ImagePlaceholderWidget] will be used to initialize the
  /// required parameters
  const ImagePlaceholderWidget({
    required String? imagePath,
    super.key,
  }) : _imagePath = imagePath;

  @override
  Widget build(BuildContext context) {
    return _imagePath != null
        ? Image.file(
            File(_imagePath ?? ''),
            height: AppDimensions.height150,
            width: AppDimensions.width150,
          )
        : const Placeholder(
            fallbackHeight: AppDimensions.height150,
            fallbackWidth: AppDimensions.width150,
          );
  }
}
