import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource imageSource) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: imageSource);

  if (file != null) {
    return await file.readAsBytes();
  }

  Get.snackbar("Warning", "No file selected?");
}
