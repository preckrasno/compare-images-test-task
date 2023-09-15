import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// StatelessWidget [ImageSelectionWidget] is a widget that will be used to
/// select two images to compare
class ImageSelectionWidget extends StatelessWidget {
  final void Function() _onCompareImagesPressed;
  final void Function(String?) _onImage1Selected;
  final void Function(String?) _onImage2Selected;
  final String? _firstImagePath;
  final String? _secondImagePath;

  /// Constructor [ImageSelectionWidget] will be used to initialize the
  /// required parameters
  ImageSelectionWidget({
    required void Function() onCompareImagesPressed,
    required void Function(String?) onImage1Selected,
    required void Function(String?) onImage2Selected,
    required String? firstImagePath,
    required String? secondImagePath,
    super.key,
  })  : _onCompareImagesPressed = onCompareImagesPressed,
        _onImage1Selected = onImage1Selected,
        _onImage2Selected = onImage2Selected,
        _firstImagePath = firstImagePath,
        _secondImagePath = secondImagePath;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Selection"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Please select two images to compare",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    if (_firstImagePath != null)
                      Image.file(
                        File(_firstImagePath ?? ''),
                        height: 150,
                        width: 150,
                      )
                    else
                      const Placeholder(
                        fallbackHeight: 150,
                        fallbackWidth: 150,
                      ),
                    ElevatedButton(
                      onPressed: () async {
                        final image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        _onImage1Selected(image?.path);
                      },
                      child: const Text("Select Image 1"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (_secondImagePath != null)
                      Image.file(
                        File(_secondImagePath ?? ''),
                        height: 150,
                        width: 150,
                      )
                    else
                      const Placeholder(
                        fallbackHeight: 150,
                        fallbackWidth: 150,
                      ),
                    ElevatedButton(
                      onPressed: () async {
                        final image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        _onImage2Selected(image?.path);
                      },
                      child: const Text("Select Image 2"),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed:
                  _isBothImageAvailable() ? _onCompareImagesPressed : null,
              child: const Text("Compare Images"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  bool _isBothImageAvailable() {
    if (_firstImagePath == null) {
      return false;
    }
    if (_firstImagePath?.isEmpty ?? true) {
      return false;
    }
    if (_secondImagePath == null) {
      return false;
    }
    if (_secondImagePath?.isEmpty ?? true) {
      return false;
    }

    return true;
  }
}
