import 'package:compare_images/bloc/compare_summary_bloc/compare_summary_bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareSummaryPage extends StatelessWidget {
  const CompareSummaryPage({super.key});

  static const Page<void> page =
      MaterialPage<void>(child: CompareSummaryPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompareSummaryBloc(),
      child: CompareSummaryConsumer(),
    );
  }
}
