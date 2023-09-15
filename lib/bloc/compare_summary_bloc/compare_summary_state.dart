part of 'compare_summary_bloc.dart';

sealed class CompareSummaryState {
  final XFile image1;
  final XFile image2;
  const CompareSummaryState({
    required this.image1,
    required this.image2,
  });
}

final class CompareSummaryInitial extends CompareSummaryState {
  const CompareSummaryInitial({
    required super.image1,
    required super.image2,
  });
}

final class CompareSummaryLoading extends CompareSummaryState {
  const CompareSummaryLoading({
    required super.image1,
    required super.image2,
  });
}

final class CompareSummaryLoaded extends CompareSummaryState {
  const CompareSummaryLoaded({
    required super.image1,
    required super.image2,
    required this.result,
  });

  final double result;
}
