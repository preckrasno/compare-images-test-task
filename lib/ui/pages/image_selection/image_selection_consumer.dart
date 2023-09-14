import 'package:compare_images/bloc/image_selection_bloc/image_selection_bloc.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSelectionConsumer extends StatelessWidget {
  const ImageSelectionConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageSelectionBloc, ImageSelectionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const ImageSelectionWidget();
      },
    );
  }
}
