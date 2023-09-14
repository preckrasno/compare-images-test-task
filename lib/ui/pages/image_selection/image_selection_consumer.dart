import 'package:compare_images/bloc/image_selection_bloc/image_selection_bloc.dart';
import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_page.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSelectionConsumer extends StatelessWidget {
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
        );
      },
    );
  }

  void Function() _onCompareImagesPressed(
    ImageSelectionBloc imageSelectionBloc,
  ) {
    return () =>
        imageSelectionBloc.add(ImageSelectionNavigateToCompareImagesEvent());
  }
}
