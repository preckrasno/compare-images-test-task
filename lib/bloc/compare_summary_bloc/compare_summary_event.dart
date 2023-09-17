part of 'compare_summary_bloc.dart';

/// [CompareSummaryEvent] is a sealed class representing the events of the
/// [CompareSummaryBloc].
sealed class CompareSummaryEvent {
  /// Creates [CompareSummaryEvent] instance.
  const CompareSummaryEvent();
}

/// [CompareSummaryLoadEvent] is the event used to trigger the processing of the
/// images.
final class CompareSummaryLoadEvent extends CompareSummaryEvent {}
