import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picking_state.dart';

class ImagePickingCubit extends Cubit<ImagePickingState> {
  ImagePickingCubit() : super(ImagePickingInitial());

  final ImagePicker _picker = ImagePicker();

  Future<void> pickFromCamera() async {
    final XFile? file = await _picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (file != null) {
      emit(ImagePicked(file));
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      emit(ImagePicked(file));
    }
  }

  void reset() => emit(ImagePickingInitial());

  @override
  void onChange(Change<ImagePickingState> change) {
    debugPrint('$change');
    super.onChange(change);
  }
}
