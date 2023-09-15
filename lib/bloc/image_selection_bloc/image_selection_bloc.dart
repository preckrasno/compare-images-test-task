import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_page.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_page.dart';

part 'image_selection_event.dart';
part 'image_selection_state.dart';

/// Bloc [ImageSelectionBloc] responsible for handling events
/// and state of [ImageSelectionPage].
class ImageSelectionBloc
    extends Bloc<ImageSelectionEvent, ImageSelectionState> {
  /// Creates [ImageSelectionBloc] instance.
  ImageSelectionBloc() : super(const ImageSelectionInitial()) {
    on<ImageSelectionNavigateToCompareImagesEvent>(
      _onImageSelectionNavigateToCompareImagesEvent,
    );
    on<ImageSelectionSelectFirstImageEvent>(
        _onImageSelectionSelectFirstImageEvent);
    on<ImageSelectionSelectSecondImageEvent>(
        _onImageSelectionSelectSecondImageEvent);
  }

  FutureOr<void> _onImageSelectionNavigateToCompareImagesEvent(
    ImageSelectionNavigateToCompareImagesEvent event,
    Emitter<ImageSelectionState> emit,
  ) {
    if (_isBothImagesSelected()) {
      emit(
        ImageSelectionNavigateToCompareImagesState(
          firstImagePath: state.firstImagePath ?? '',
          secondImagePath: state.secondImagePath ?? '',
        ),
      );
    }
  }

  FutureOr<void> _onImageSelectionSelectFirstImageEvent(
    ImageSelectionSelectFirstImageEvent event,
    Emitter<ImageSelectionState> emit,
  ) {
    emit(
      ImageSelectionInitial(
        firstImagePath: event.imagePath,
        secondImagePath: state.secondImagePath,
      ),
    );
  }

  FutureOr<void> _onImageSelectionSelectSecondImageEvent(
    ImageSelectionSelectSecondImageEvent event,
    Emitter<ImageSelectionState> emit,
  ) {
    emit(
      ImageSelectionInitial(
        firstImagePath: state.firstImagePath,
        secondImagePath: event.imagePath,
      ),
    );
  }

  bool _isBothImagesSelected() {
    if (state.firstImagePath == null) {
      return false;
    }

    if (state.firstImagePath?.isEmpty ?? true) {
      return false;
    }

    if (state.secondImagePath == null) {
      return false;
    }

    if (state.secondImagePath?.isEmpty ?? true) {
      return false;
    }

    return true;
  }
}
