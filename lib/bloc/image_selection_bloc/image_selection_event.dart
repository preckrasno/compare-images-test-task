part of 'image_selection_bloc.dart';

/// Sealed class for [ImageSelectionBloc] events.
sealed class ImageSelectionEvent {
  /// Creates [ImageSelectionEvent] instance.
  const ImageSelectionEvent();
}

/// [ImageSelectionNavigateToCompareImagesEvent] is the event of the
/// [ImageSelectionBloc] when the user has selected both images and is
final class ImageSelectionNavigateToCompareImagesEvent
    extends ImageSelectionEvent {}

/// [ImageSelectionSelectFirstImageEvent] is the event of the
/// [ImageSelectionBloc] when the user has selected first image.
final class ImageSelectionSelectFirstImageEvent extends ImageSelectionEvent {
  /// [imagePath] is the path of the image selected by the user.
  final String? imagePath;

  /// Creates [ImageSelectionSelectFirstImageEvent] instance.
  const ImageSelectionSelectFirstImageEvent(
    this.imagePath,
  );
}

/// [ImageSelectionSelectSecondImageEvent] is the event of the
/// [ImageSelectionBloc] when the user has selected second image.
final class ImageSelectionSelectSecondImageEvent extends ImageSelectionEvent {
  /// [imagePath] is the path of the image selected by the user.
  final String? imagePath;

  /// Creates [ImageSelectionSelectSecondImageEvent] instance.
  const ImageSelectionSelectSecondImageEvent(
    this.imagePath,
  );
}
