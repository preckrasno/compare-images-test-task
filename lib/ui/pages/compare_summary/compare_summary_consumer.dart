import 'package:compare_images/bloc/compare_summary_bloc/compare_summary_bloc.dart';
import 'package:compare_images/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [CompareSummaryConsumer] is a [StatelessWidget] that consumes
/// [CompareSummaryBloc] and handles its states.
class CompareSummaryConsumer extends StatelessWidget {
  /// Constructor of [CompareSummaryConsumer] class.
  const CompareSummaryConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationBloc = context.read<NavigationBloc>();

    return BlocConsumer<CompareSummaryBloc, CompareSummaryState>(
      listener: (context, state) {
        if (state is CompareSummaryError) {
          _handleFailureState(state, context);
        }
      },
      buildWhen: (previous, current) {
        return current is! CompareSummaryError;
      },
      builder: (context, state) {
        if (state is CompareSummaryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is CompareSummaryLoaded) {
          return WillPopScope(
            onWillPop: () {
              navigationBloc.add(NavigationPopPageEvent());

              return Future.value(false);
            },
            child: CompareSummaryWidget(
              onTapBack: _onTapBack(navigationBloc),
              imageInfo1: state.imageInfo1,
              imageInfo2: state.imageInfo2,
            ),
          );
        }
        throw Exception('Unhandled state: $state');
      },
    );
  }

  void Function() _onTapBack(NavigationBloc navigationBloc) {
    return () => navigationBloc.add(NavigationPopPageEvent());
  }

  void _handleFailureState(
    CompareSummaryError state,
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
      ),
    );
  }
}
