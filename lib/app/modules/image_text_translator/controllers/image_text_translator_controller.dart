import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
class ImageTextTranslatorController extends GetxController {
  //TODO: Implement ImageTextTranslatorController
 ImagePicker? imagePicker;
 XFile? image;
 InputImage? inputImage;
final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
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
  getTextFromImage(image);

  }
void captureImage()async{
  image=await imagePicker!.pickImage(source: ImageSource.camera);
  getTextFromImage(image);
}
Future<void> getTextFromImage(XFile? image) async {
    if(image!=null){
      inputImage=InputImage.fromFilePath(image.path);
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage!);
      print(recognizedText.text);
    }
    else{
      print("Please Select an image");
    }


}


}

