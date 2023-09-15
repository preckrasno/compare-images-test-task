import 'dart:io';

import 'package:compare_images/theme/app_dimensions.dart';
import 'package:compare_images/theme/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Widget [CompareSummaryWidget] will be used to show the compare summary
/// between two images
class CompareSummaryWidget extends StatelessWidget {
  final void Function() _onTapBack;
  final XFile _image1;
  final XFile _image2;

  /// Constructor [CompareSummaryWidget] will be used to initialize the
  /// required parameters
  const CompareSummaryWidget({
    required void Function() onTapBack,
    required XFile image1,
    required XFile image2,
    super.key,
  })  : _onTapBack = onTapBack,
        _image1 = image1,
        _image2 = image2;

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
                        _image1.path,
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
                        _image2.path,
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
