import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_page.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_page.dart';
import 'package:image_picker/image_picker.dart';

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
          firstImage: state.firstImage ?? XFile(''),
          secondImage: state.secondImage ?? XFile(''),
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
        firstImage: event.image,
        secondImage: state.secondImage,
      ),
    );
  }

  FutureOr<void> _onImageSelectionSelectSecondImageEvent(
    ImageSelectionSelectSecondImageEvent event,
    Emitter<ImageSelectionState> emit,
  ) {
    emit(
      ImageSelectionInitial(
        firstImage: state.firstImage,
        secondImage: event.image,
      ),
    );
  }

  bool _isBothImagesSelected() {
    if (state.firstImage == null) {
      return false;
    }

    if (state.firstImage?.path.isEmpty ?? true) {
      return false;
    }

    if (state.secondImage == null) {
      return false;
    }

    if (state.secondImage?.path.isEmpty ?? true) {
      return false;
    }

    return true;
  }
}
