part of 'image_selection_bloc.dart';

sealed class ImageSelectionState extends Equatable {
  const ImageSelectionState();
  
  @override
  List<Object> get props => [];
}

final class ImageSelectionInitial extends ImageSelectionState {}
