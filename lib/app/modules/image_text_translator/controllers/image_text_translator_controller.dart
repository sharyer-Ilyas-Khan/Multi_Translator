import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/image_text_translator/views/crop_image.dart';

import 'camera_controller.dart';



class ImageTextTranslatorController extends GetxController {
  //TODO: Implement ImageTextTranslatorController
 ImagePicker? imagePicker;
 XFile? image;
 InputImage? inputImage;
  Rx<File> file=File("path").obs;
 RxBool imageReady=false.obs;
final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
// final textRecognizer = TextRecognizer(script: TextRecognitionScript.korean);
DashboardController controller=Get.put(DashboardController());
  CameraControllers cameraControllers=Get.put(CameraControllers());
  @override
  void onInit() {
    imagePicker=ImagePicker();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pickImage()async{
  image=await imagePicker!.pickImage(source: ImageSource.gallery);
  if(image!=null){
    Get.to(()=>CropImage(file: image,));
  }

  // getTextFromImage(image);
  }

// void captureImage()async{
//   image=await imagePicker!.pickImage(source: ImageSource.camera);
//   getTextFromImage(File(image!.path));
// }

Future<void> getTextFromImage(File? image,context) async {
  print("recognizedText.text");
    if(image!=null){
      inputImage=InputImage.fromFilePath(image.path);
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage!);
      print(recognizedText.text.replaceAll("\n"," "));
      controller.selectedOption(0);
      cameraControllers.disposeCamera();
      controller.setText(recognizedText.text.replaceAll("\n"," "));
      Navigator.pop(context);


    }
    else{
      print("Please Select an image");
    }


}
void getCroppedImage(CroppedFile croppedFile){
    file.value=File(croppedFile.path);
    imageReady.value=true;
}
 Future<void> cropImage(image) async {
   if (image != null) {
     final croppedFile = await ImageCropper().cropImage(
       sourcePath: image!.path,
       compressFormat: ImageCompressFormat.jpg,
       compressQuality: 100,
       uiSettings: [
         AndroidUiSettings(
             toolbarTitle: 'Cropper',
             toolbarColor: Colors.deepOrange,
             toolbarWidgetColor: Colors.white,
             initAspectRatio: CropAspectRatioPreset.original,
             lockAspectRatio: false),
         IOSUiSettings(
           title: 'Cropper',
         ),
       ],
     );
     if (croppedFile != null) {
      getCroppedImage(croppedFile);

     }
   }
 }
}

