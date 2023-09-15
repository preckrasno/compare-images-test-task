import 'package:compare_images/bloc/compare_summary_bloc/compare_summary_bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

/// Page [CompareSummaryPage] responsible providing [CompareSummaryConsumer]
/// with [CompareSummaryBloc].
class CompareSummaryPage extends StatelessWidget {
  final XFile _image1;
  final XFile _image2;

  /// Creates [CompareSummaryPage] instance.
  const CompareSummaryPage({
    required XFile image1,
    required XFile image2,
    super.key,
  })  : _image2 = image2,
        _image1 = image1;

  /// Creates [Page] instance.
  static Page<void> page({
    required XFile image1,
    required XFile image2,
  }) =>
      MaterialPage<void>(
        child: CompareSummaryPage(
          image1: image1,
          image2: image2,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompareSummaryBloc(
        image1: _image1,
        image2: _image2,
      )..add(CompareSummaryLoadEvent()),
      child: const CompareSummaryConsumer(),
    );
  }
}
