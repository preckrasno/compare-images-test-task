part of 'compare_summary_bloc.dart';

/// [CompareSummaryEvent] is a sealed class representing the events of the
/// [CompareSummaryBloc].
sealed class CompareSummaryState {
  /// Creates [CompareSummaryState] instance.
  const CompareSummaryState();
}

/// [CompareSummaryLoading] is the initial state of the [CompareSummaryBloc].
final class CompareSummaryLoading extends CompareSummaryState {
  /// Creates [CompareSummaryLoading] instance.
  const CompareSummaryLoading();
}

/// [CompareSummaryLoaded] is the state of the [CompareSummaryBloc] when the
/// images have been processed and the [CompareSummaryPage] is ready to be
/// displayed.
final class CompareSummaryLoaded extends CompareSummaryState {
  /// [imageInfo1] is the [ImageDetailedInfo] of the first image.
  final ImageDetailedInfo imageInfo1;

  /// [imageInfo2] is the [ImageDetailedInfo] of the second image.
  final ImageDetailedInfo imageInfo2;

  /// Creates [CompareSummaryLoaded] instance.
  const CompareSummaryLoaded({
    required this.imageInfo1,
    required this.imageInfo2,
  });
}

/// [CompareSummaryError] is the state of the [CompareSummaryBloc] when an error
/// has occurred while processing the images.
final class CompareSummaryError extends CompareSummaryState {
  /// [message] is the error message.
  final String message;

  /// Creates [CompareSummaryError] instance.
  const CompareSummaryError({
    required this.message,
  });
}
