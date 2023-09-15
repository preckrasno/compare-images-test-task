import 'package:compare_images/bloc/image_selection_bloc/image_selection_bloc.dart';
import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_page.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [ImageSelectionConsumer] is a [StatelessWidget] which uses [BlocConsumer] to
/// listen to [ImageSelectionBloc] state changes and rebuilds the UI accordingly
class ImageSelectionConsumer extends StatelessWidget {
  /// [ImageSelectionConsumer] constructor
  const ImageSelectionConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageSelectionBloc = context.read<ImageSelectionBloc>();
    final navigationBloc = context.read<NavigationBloc>();

    return BlocConsumer<ImageSelectionBloc, ImageSelectionState>(
      listener: (context, state) {
        if (state is ImageSelectionNavigateToCompareImagesState) {
          navigationBloc.add(
            NavigationPushPageEvent(
              CompareSummaryPage.page,
            ),
          );
        }
      },
      builder: (context, state) {
        return ImageSelectionWidget(
          onCompareImagesPressed: _onCompareImagesPressed(imageSelectionBloc),
          onImage1Selected: _onImage1Selected(imageSelectionBloc),
          onImage2Selected: _onImage2Selected(imageSelectionBloc),
          firstImagePath: state.firstImagePath,
          secondImagePath: state.secondImagePath,
        );
      },
    );
  }

  void Function() _onCompareImagesPressed(
    ImageSelectionBloc imageSelectionBloc,
  ) {
    return () => imageSelectionBloc.add(
          ImageSelectionNavigateToCompareImagesEvent(),
        );
  }

  void Function(String?) _onImage1Selected(
      ImageSelectionBloc imageSelectionBloc) {
    return (imagePath) => imageSelectionBloc.add(
          ImageSelectionSelectFirstImageEvent(imagePath),
        );
  }

  void Function(String?) _onImage2Selected(
      ImageSelectionBloc imageSelectionBloc) {
    return (imagePath) => imageSelectionBloc.add(
          ImageSelectionSelectSecondImageEvent(imagePath),
        );
  }
}
