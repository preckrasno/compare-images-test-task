import 'package:compare_images/bloc/compare_summary_bloc/compare_summary_bloc.dart';
import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareSummaryConsumer extends StatelessWidget {
  const CompareSummaryConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final compareSummaryBloc = context.read<CompareSummaryBloc>();
    final navigationBloc = context.read<NavigationBloc>();

    return BlocConsumer<CompareSummaryBloc, CompareSummaryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            navigationBloc.add(NavigationPopPageEvent());

            return Future.value(false);
          },
          child: CompareSummaryWidget(
            onTapBack: _onTapBack(navigationBloc),
          ),
        );
      },
    );
  }

  void Function() _onTapBack(NavigationBloc navigationBloc) {
    return () => navigationBloc.add(NavigationPopPageEvent());
  }
}
