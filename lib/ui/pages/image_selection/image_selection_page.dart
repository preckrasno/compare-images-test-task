import 'package:compare_images/bloc/image_selection_bloc/image_selection_bloc.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSelectionPage extends StatelessWidget {
  const ImageSelectionPage({super.key});

  static const Page<void> page =
      MaterialPage<void>(child: ImageSelectionPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSelectionBloc(),
      child: ImageSelectionConsumer(),
    );
  }
}
