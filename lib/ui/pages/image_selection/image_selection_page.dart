import 'package:compare_images/bloc/image_selection_bloc/image_selection_bloc.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [ImageSelectionPage] is a [StatelessWidget] which uses [BlocProvider] to
/// provide [ImageSelectionBloc] to its children.
class ImageSelectionPage extends StatelessWidget {
  /// [ImageSelectionPage] constructor
  const ImageSelectionPage({super.key});

  /// Creates [Page] instance.
  static Page<void> page() =>
      const MaterialPage<void>(child: ImageSelectionPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSelectionBloc(),
      child: const ImageSelectionConsumer(),
    );
  }
}
