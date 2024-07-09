import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageprovider extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();
  XFile? xFile;
  String? pickimagepath;

  void pickimage() async {
    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (xFile != null) {
      pickimagepath = xFile!.path;
      notifyListeners();
    }
  }

  void pickimagegallary() async {
    xFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      pickimagepath = xFile!.path;
      notifyListeners();
    }
  }
}
