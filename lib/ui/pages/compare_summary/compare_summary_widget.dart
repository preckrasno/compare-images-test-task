import 'dart:io';

import 'package:compare_images/data/models/image_detailed_info.dart';
import 'package:compare_images/theme/app_dimensions.dart';
import 'package:compare_images/theme/app_texts.dart';
import 'package:compare_images/ui/widgets/rgb_histogram_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Widget [CompareSummaryWidget] will be used to show the compare summary
/// between two images
class CompareSummaryWidget extends StatelessWidget {
  final void Function() _onTapBack;
  final ImageDetailedInfo _imageInfo1;
  final ImageDetailedInfo _imageInfo2;

  /// Constructor [CompareSummaryWidget] will be used to initialize the
  /// required parameters
  CompareSummaryWidget({
    required void Function() onTapBack,
    required ImageDetailedInfo imageInfo1,
    required ImageDetailedInfo imageInfo2,
    super.key,
  })  : _onTapBack = onTapBack,
        _imageInfo1 = imageInfo1,
        _imageInfo2 = imageInfo2;

  static const int _bytesPerKilobyte = 1024;
  static const int _decimalPlaces = 2;

  final _numberFormat = NumberFormat("#,###", "en_US");

  List<Map<String, dynamic>> _getImageInfoList(ImageDetailedInfo info) {
    return [
      {'label': AppTexts.width, 'value': '${info.width}px'},
      {'label': AppTexts.height, 'value': '${info.height}px'},
      {
        'label': AppTexts.size,
        'value': '${(info.bytes / _bytesPerKilobyte).toStringAsFixed(
          _decimalPlaces,
        )} KB',
      },
      {'label': AppTexts.averageRed, 'value': info.averageRed.toString()},
      {'label': AppTexts.averageGreen, 'value': info.averageGreen.toString()},
      {'label': AppTexts.averageBlue, 'value': info.averageBlue.toString()},
      {
        'label': AppTexts.uniqueColors,
        'value': _numberFormat.format(info.numberOfUniqueColors),
      },
      {
        'label': AppTexts.totalPixels,
        'value': _numberFormat.format(info.numberOfPixels),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> image1InfoList =
        _getImageInfoList(_imageInfo1);
    final List<Map<String, dynamic>> image2InfoList =
        _getImageInfoList(_imageInfo2);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.file(
                      File(
                        _imageInfo1.path,
                      ),
                      height: AppDimensions.height150,
                      width: AppDimensions.width150,
                    ),
                    const SizedBox(height: AppDimensions.height32),
                    ...image1InfoList.map((info) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.padding8,
                        ),
                        child: Row(
                          children: [
                            Text('${info['label']}: '),
                            Text(info['value'].toString()),
                          ],
                        ),
                      );
                    }),
                    const Text("${AppTexts.rgbHistogram}:"),
                    RGBHistogramWidget(
                      redData: _imageInfo1.redHistogram,
                      greenData: _imageInfo1.greenHistogram,
                      blueData: _imageInfo1.blueHistogram,
                      height: AppDimensions.height150,
                      width: AppDimensions.width150,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.file(
                      File(
                        _imageInfo2.path,
                      ),
                      height: AppDimensions.height150,
                      width: AppDimensions.width150,
                    ),
                    const SizedBox(height: AppDimensions.height32),
                    ...image2InfoList.map((info) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppDimensions.padding8,
                        ),
                        child: Row(
                          children: [
                            Text('${info['label']}: '),
                            Text(info['value'].toString()),
                          ],
                        ),
                      );
                    }),
                    const Text("${AppTexts.rgbHistogram}:"),
                    RGBHistogramWidget(
                      redData: _imageInfo2.redHistogram,
                      greenData: _imageInfo2.greenHistogram,
                      blueData: _imageInfo2.blueHistogram,
                      height: AppDimensions.height150,
                      width: AppDimensions.width150,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
