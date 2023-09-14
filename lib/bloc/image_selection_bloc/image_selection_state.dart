part of 'image_selection_bloc.dart';

sealed class ImageSelectionState {
  const ImageSelectionState();
}

final class ImageSelectionInitial extends ImageSelectionState {}

final class ImageSelectionNavigateToCompareImagesState
    extends ImageSelectionState {}
