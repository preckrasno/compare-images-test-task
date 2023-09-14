part of 'image_selection_bloc.dart';

sealed class ImageSelectionEvent {
  const ImageSelectionEvent();
}

/// Event [ImageSelectionNavigateToCompareImagesEvent] is used to navigate
/// to [CompareImagesPage].
final class ImageSelectionNavigateToCompareImagesEvent
    extends ImageSelectionEvent {}
