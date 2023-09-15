import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:compare_images/data/models/image_info.dart';
import 'package:compare_images/services/image_processing.dart';
import 'package:image_picker/image_picker.dart';

part 'compare_summary_event.dart';
part 'compare_summary_state.dart';

/// Bloc [CompareSummaryBloc] responsible for handling events
class CompareSummaryBloc
    extends Bloc<CompareSummaryEvent, CompareSummaryState> {
  /// Creates [CompareSummaryBloc] instance.
  CompareSummaryBloc({
    required XFile image1,
    required XFile image2,
  }) : super(CompareSummaryInitial(
          image1: image1,
          image2: image2,
        )) {
    on<CompareSummaryLoadEvent>(_onCompareSummaryLoadEvent);
  }

  Future<FutureOr<void>> _onCompareSummaryLoadEvent(
    CompareSummaryLoadEvent event,
    Emitter<CompareSummaryState> emit,
  ) async {
    emit(
      CompareSummaryLoading(
        image1: state.image1,
        image2: state.image2,
      ),
    );

    final File image1 = File(state.image1.path);
    final File image2 = File(state.image2.path);

    // Get the image bytes
    final Uint8List image1Bytes = await image1.readAsBytes();
    final Uint8List image2Bytes = await image2.readAsBytes();

    // Decode the image
    final ui.Codec image1Codec = await ui.instantiateImageCodec(image1Bytes);
    final ui.Codec image2Codec = await ui.instantiateImageCodec(image2Bytes);

    // Get the first frame of the image
    final ui.FrameInfo image1FrameInfo = await image1Codec.getNextFrame();
    final ui.FrameInfo image2FrameInfo = await image2Codec.getNextFrame();

    // Get the image size in pixels
    final ui.Size image1Size = ui.Size(
      image1FrameInfo.image.width.toDouble(),
      image1FrameInfo.image.height.toDouble(),
    );
    final ui.Size image2Size = ui.Size(
      image2FrameInfo.image.width.toDouble(),
      image2FrameInfo.image.height.toDouble(),
    );

    // Get average RGB values
    final Map<String, double> avgRGBImage1 =
        await image1FrameInfo.image.averageRGB();
    final Map<String, double> avgRGBImage2 =
        await image2FrameInfo.image.averageRGB();

    // Get the number of unique colors
    final int uniqueColorsCountImage1 =
        await image1FrameInfo.image.uniqueColorsCount();
    final int uniqueColorsCountImage2 =
        await image2FrameInfo.image.uniqueColorsCount();

    // Get the image size in bytes
    final int image1SizeInBytes = image1Bytes.lengthInBytes;
    final int image2SizeInBytes = image2Bytes.lengthInBytes;

    final ImageInfo imageInfo1 = ImageInfo(
      path: image1.path,
      width: image1Size.width.toInt(),
      height: image1Size.height.toInt(),
      bytes: image1SizeInBytes,
      averageRed: avgRGBImage1['red']!.toInt(),
      averageGreen: avgRGBImage1['green']!.toInt(),
      averageBlue: avgRGBImage1['blue']!.toInt(),
      numberOfUniqueColors: uniqueColorsCountImage1,
    );

    final ImageInfo imageInfo2 = ImageInfo(
      path: image2.path,
      width: image2Size.width.toInt(),
      height: image2Size.height.toInt(),
      bytes: image2SizeInBytes,
      averageRed: avgRGBImage2['red']!.toInt(),
      averageGreen: avgRGBImage2['green']!.toInt(),
      averageBlue: avgRGBImage2['blue']!.toInt(),
      numberOfUniqueColors: uniqueColorsCountImage2,
    );
  }
}
