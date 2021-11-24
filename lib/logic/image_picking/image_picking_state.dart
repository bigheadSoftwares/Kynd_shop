part of 'image_picking_cubit.dart';

abstract class ImagePickingState extends Equatable {
  const ImagePickingState();

  @override
  List<Object> get props => <Object>[];
}

class ImagePickingInitial extends ImagePickingState {}

class ImagePicked extends ImagePickingState {
  const ImagePicked(this.file);
  final XFile file;

  @override
  List<XFile> get props => <XFile>[file];
}

class ImageError extends ImagePickingState {}
