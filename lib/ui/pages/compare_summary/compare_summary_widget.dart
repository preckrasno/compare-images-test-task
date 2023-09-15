import 'dart:io';

import 'package:compare_images/data/models/image_detailed_info.dart';
import 'package:compare_images/theme/app_dimensions.dart';
import 'package:compare_images/theme/app_texts.dart';
import 'package:flutter/material.dart';

/// Widget [CompareSummaryWidget] will be used to show the compare summary
/// between two images
class CompareSummaryWidget extends StatelessWidget {
  final void Function() _onTapBack;
  final ImageDetailedInfo _imageInfo1;
  final ImageDetailedInfo _imageInfo2;

  /// Constructor [CompareSummaryWidget] will be used to initialize the
  /// required parameters
  const CompareSummaryWidget({
    required void Function() onTapBack,
    required ImageDetailedInfo imageInfo1,
    required ImageDetailedInfo imageInfo2,
    super.key,
  })  : _onTapBack = onTapBack,
        _imageInfo1 = imageInfo1,
        _imageInfo2 = imageInfo2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.compareSummary),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _onTapBack,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.height32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.file(
                      File(
                        _imageInfo1.path,
                      ),
                      height: AppDimensions.height150,
                      width: AppDimensions.width150,
                    ),
                    const SizedBox(height: AppDimensions.height32),
                  ],
                ),
                Column(
                  children: [
                    Image.file(
                      File(
                        _imageInfo2.path,
                      ),
                      height: AppDimensions.height150,
                      width: AppDimensions.width150,
                    ),
                    const SizedBox(height: AppDimensions.height32),
                  ],
                ),
              ],
            ),
            const Text(AppTexts.compareSummary),
          ],
        ),
      ),
    );
  }
}
