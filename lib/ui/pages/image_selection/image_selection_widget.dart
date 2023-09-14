import 'package:flutter/material.dart';

class ImageSelectionWidget extends StatelessWidget {
  final void Function() onCompareImagesPressed;

  const ImageSelectionWidget({
    required this.onCompareImagesPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Image Selection"),
            ElevatedButton(
              onPressed: () {
                onCompareImagesPressed();
              },
              child: const Text("Compare Images"),
            ),
          ],
        ),
      ),
    );
  }
}
