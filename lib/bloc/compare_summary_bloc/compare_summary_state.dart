part of 'compare_summary_bloc.dart';

sealed class CompareSummaryState {
  const CompareSummaryState();
}

final class CompareSummaryLoading extends CompareSummaryState {
  const CompareSummaryLoading();
}

final class CompareSummaryLoaded extends CompareSummaryState {
  final ImageDetailedInfo imageInfo1;
  final ImageDetailedInfo imageInfo2;
  const CompareSummaryLoaded({
    required this.imageInfo1,
    required this.imageInfo2,
  });
}

final class CompareSummaryError extends CompareSummaryState {
  final String message;

  const CompareSummaryError({
    required this.message,
  });
}
