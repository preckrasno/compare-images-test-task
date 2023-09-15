import 'package:compare_images/theme/app_dimensions.dart';
import 'package:compare_images/theme/app_texts.dart';
import 'package:compare_images/ui/widgets/image_placeholder_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// StatelessWidget [ImageSelectionWidget] is a widget that will be used to
/// select two images to compare
class ImageSelectionWidget extends StatelessWidget {
  final void Function() _onCompareImagesPressed;
  final void Function(XFile?) _onImage1Selected;
  final void Function(XFile?) _onImage2Selected;
  final XFile? _firstImage;
  final XFile? _secondImage;

  /// Constructor [ImageSelectionWidget] will be used to initialize the
  /// required parameters
  ImageSelectionWidget({
    required void Function() onCompareImagesPressed,
    required void Function(XFile?) onImage1Selected,
    required void Function(XFile?) onImage2Selected,
    required XFile? firstImage,
    required XFile? secondImage,
    super.key,
  })  : _onCompareImagesPressed = onCompareImagesPressed,
        _onImage1Selected = onImage1Selected,
        _onImage2Selected = onImage2Selected,
        _firstImage = firstImage,
        _secondImage = secondImage;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.imageSelection),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.padding8),
                child: Text(
                  AppTexts.pleaseSelectTwoImagesToCompare,
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
                    ImagePlaceholderWidget(imagePath: _firstImage?.path),
                    ElevatedButton(
                      onPressed: () async {
                        final image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        _onImage1Selected(image);
                      },
                      child: const Text(AppTexts.selectImage1),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ImagePlaceholderWidget(imagePath: _secondImage?.path),
                    ElevatedButton(
                      onPressed: () async {
                        final image = await _picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        _onImage2Selected(image);
                      },
                      child: const Text(AppTexts.selectImage2),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed:
                  _isBothImageAvailable() ? _onCompareImagesPressed : null,
              child: const Text(AppTexts.compareImages),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  bool _isBothImageAvailable() {
    if (_firstImage == null) {
      return false;
    }
    if (_firstImage?.path.isEmpty ?? true) {
      return false;
    }
    if (_secondImage == null) {
      return false;
    }
    if (_secondImage?.path.isEmpty ?? true) {
      return false;
    }

    return true;
  }
}
