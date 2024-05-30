import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider = Provider((ref) => ImagePickerService());

class ImagePickerService {
  final imagePicker = ImagePicker();

  Future<List<File>> getMultipleImages() async {

    final List<File> images = [];

    try {
      final imageFiles = await imagePicker.pickMultiImage();

      if (imageFiles.isNotEmpty) {
        for (final image in imageFiles) {
          images.add(File(image.path));
        }
      }
      return images;
    } catch (e) {
      rethrow;
    }
  }


  Future<File> selectSinglePicture() async{

    try {

      final selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
      return File(selectedImage!.path);
      
    } catch (e) {
      rethrow;
    }
  
  }
}
