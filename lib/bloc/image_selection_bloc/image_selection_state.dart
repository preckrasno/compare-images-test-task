part of 'image_selection_bloc.dart';

/// [ImageSelectionState] is a sealed class representing the state of the
/// [ImageSelectionBloc].
sealed class ImageSelectionState {
  /// [firstImage] is the path of the first image selected by the user.
  final XFile? firstImage;

  /// [secondImage] is the path of the second image selected by the user.
  final XFile? secondImage;

  /// Creates [ImageSelectionState] instance.
  const ImageSelectionState({
    required this.firstImage,
    required this.secondImage,
  });
}

/// [ImageSelectionInitial] is the initial state of the [ImageSelectionBloc].
final class ImageSelectionInitial extends ImageSelectionState {
  /// Creates [ImageSelectionInitial] instance.
  const ImageSelectionInitial({
    super.firstImage,
    super.secondImage,
  });
}

/// [ImageSelectionNavigateToCompareImagesState] is the state of the
/// [ImageSelectionBloc] when the user has selected both images and is
/// navigating to the [CompareSummaryPage].
final class ImageSelectionNavigateToCompareImagesState
    extends ImageSelectionState {
  @override
  final XFile firstImage;
  @override
  final XFile secondImage;

  /// Creates [ImageSelectionNavigateToCompareImagesState] instance.
  const ImageSelectionNavigateToCompareImagesState({
    required this.firstImage,
    required this.secondImage,
  }) : super(
          firstImage: firstImage,
          secondImage: secondImage,
        );
}
