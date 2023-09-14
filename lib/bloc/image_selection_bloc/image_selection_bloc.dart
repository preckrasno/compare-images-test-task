import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:compare_images/ui/pages/image_selection/image_selection_page.dart';

part 'image_selection_event.dart';
part 'image_selection_state.dart';

/// Bloc [ImageSelectionBloc] responsible for handling events
/// and state of [ImageSelectionPage].
class ImageSelectionBloc
    extends Bloc<ImageSelectionEvent, ImageSelectionState> {
  ImageSelectionBloc() : super(ImageSelectionInitial()) {
    on<ImageSelectionEvent>((event, emit) {});
    on<ImageSelectionNavigateToCompareImagesEvent>(
      _onImageSelectionNavigateToCompareImagesEvent,
    );
  }

  FutureOr<void> _onImageSelectionNavigateToCompareImagesEvent(
    ImageSelectionNavigateToCompareImagesEvent event,
    Emitter<ImageSelectionState> emit,
  ) {
    emit(ImageSelectionNavigateToCompareImagesState());
  }
}
