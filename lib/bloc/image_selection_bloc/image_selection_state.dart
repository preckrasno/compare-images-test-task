part of 'image_selection_bloc.dart';

/// [ImageSelectionState] is a sealed class representing the state of the
/// [ImageSelectionBloc].
sealed class ImageSelectionState {
  /// [firstImagePath] is the path of the first image selected by the user.
  final String? firstImagePath;

  /// [secondImagePath] is the path of the second image selected by the user.
  final String? secondImagePath;

  /// Creates [ImageSelectionState] instance.
  const ImageSelectionState({
    required this.firstImagePath,
    required this.secondImagePath,
  });
}

/// [ImageSelectionInitial] is the initial state of the [ImageSelectionBloc].
final class ImageSelectionInitial extends ImageSelectionState {
  /// Creates [ImageSelectionInitial] instance.
  const ImageSelectionInitial({
    super.firstImagePath,
    super.secondImagePath,
  });
}

/// [ImageSelectionNavigateToCompareImagesState] is the state of the
/// [ImageSelectionBloc] when the user has selected both images and is
/// navigating to the [CompareSummaryPage].
final class ImageSelectionNavigateToCompareImagesState
    extends ImageSelectionState {
  /// Creates [ImageSelectionNavigateToCompareImagesState] instance.
  const ImageSelectionNavigateToCompareImagesState({
    required String firstImagePath,
    required String secondImagePath,
  }) : super(
          firstImagePath: firstImagePath,
          secondImagePath: secondImagePath,
        );
}
