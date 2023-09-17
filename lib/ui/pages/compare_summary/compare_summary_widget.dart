import 'dart:io';

import 'package:compare_images/data/models/image_detailed_info.dart';
import 'package:compare_images/theme/app_dimensions.dart';
import 'package:compare_images/theme/app_texts.dart';
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
      {'label': 'Width', 'value': '${info.width}px'},
      {'label': 'Height', 'value': '${info.height}px'},
      {
        'label': 'Size',
        'value': '${(info.bytes / _bytesPerKilobyte).toStringAsFixed(
          _decimalPlaces,
        )} KB',
      },
      {'label': 'Avg Red', 'value': info.averageRed.toString()},
      {'label': 'Avg Green', 'value': info.averageGreen.toString()},
      {'label': 'Avg Blue', 'value': info.averageBlue.toString()},
      {
        'label': 'Unique Colors',
        'value': _numberFormat.format(info.numberOfUniqueColors),
      },
      {
        'label': 'Total Pixels',
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('${info['label']}: '),
                            Text(info['value'].toString()),
                          ],
                        ),
                      );
                    }),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('${info['label']}: '),
                            Text(info['value'].toString()),
                          ],
                        ),
                      );
                    }),
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
