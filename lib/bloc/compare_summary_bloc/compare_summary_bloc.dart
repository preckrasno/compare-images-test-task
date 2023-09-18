import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:compare_images/data/models/image_detailed_info.dart';
import 'package:compare_images/services/image_histogram.dart';
import 'package:compare_images/services/image_processing.dart';
import 'package:compare_images/ui/pages/compare_summary/compare_summary_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'compare_summary_event.dart';
part 'compare_summary_state.dart';

/// Bloc [CompareSummaryBloc] responsible for handling events
class CompareSummaryBloc
    extends Bloc<CompareSummaryEvent, CompareSummaryState> {
  final XFile _image1;
  final XFile _image2;

  /// Creates [CompareSummaryBloc] instance.
  CompareSummaryBloc({
    required XFile image1,
    required XFile image2,
  })  : _image1 = image1,
        _image2 = image2,
        super(
          const CompareSummaryLoading(),
        ) {
    on<CompareSummaryLoadEvent>(_onCompareSummaryLoadEvent);
  }

  Future<FutureOr<void>> _onCompareSummaryLoadEvent(
    CompareSummaryLoadEvent event,
    Emitter<CompareSummaryState> emit,
  ) async {
    emit(
      const CompareSummaryLoading(),
    );

    try {
      final File image1 = File(_image1.path);
      final File image2 = File(_image2.path);

      final ui.FrameInfo frameInfo1 = await _getFirstFrameInfo(image1);
      final ui.FrameInfo frameInfo2 = await _getFirstFrameInfo(image2);

      final ImageDetailedInfo imageInfo1 =
          await _extractImageInfo(image1, frameInfo1.image);
      final ImageDetailedInfo imageInfo2 =
          await _extractImageInfo(image2, frameInfo2.image);

      emit(
        CompareSummaryLoaded(
          imageInfo1: imageInfo1,
          imageInfo2: imageInfo2,
        ),
      );
    } catch (e) {
      final String message = "Failed to process images: $e";
      emit(
        CompareSummaryError(
          message: message,
        ),
      );
    }
  }

  Future<ui.FrameInfo> _getFirstFrameInfo(File imageFile) async {
    final Uint8List imageBytes = await imageFile.readAsBytes();
    final ui.Codec imageCodec = await ui.instantiateImageCodec(imageBytes);

    return imageCodec.getNextFrame();
  }

  Future<ImageDetailedInfo> _extractImageInfo(
    File imageFile,
    ui.Image image,
  ) async {
    final ui.Size imageSize = ui.Size(
      image.width.toDouble(),
      image.height.toDouble(),
    );

    final Map<String, double> avgRGB = await image.averageRGB();
    final Map<String, List<int>> histograms = await image.calculateHistogram();

    return ImageDetailedInfo(
      path: imageFile.path,
      width: imageSize.width.toInt(),
      height: imageSize.height.toInt(),
      bytes: await imageFile.length(),
      averageRed: avgRGB['red']!.toInt(),
      averageGreen: avgRGB['green']!.toInt(),
      averageBlue: avgRGB['blue']!.toInt(),
      numberOfUniqueColors: await image.uniqueColorsCount(),
      redHistogram: histograms['red']!,
      greenHistogram: histograms['green']!,
      blueHistogram: histograms['blue']!,
    );
  }
}
