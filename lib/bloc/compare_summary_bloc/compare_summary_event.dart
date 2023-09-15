part of 'compare_summary_bloc.dart';

sealed class CompareSummaryEvent {
  const CompareSummaryEvent();
}

final class CompareSummaryLoadEvent extends CompareSummaryEvent {}
