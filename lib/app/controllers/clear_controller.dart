import 'package:get/get.dart';
import 'package:translator/app/modules/image_text_translator/controllers/camera_controller.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';
import 'package:translator/app/modules/voice_translator/controllers/voice_translator_controller.dart';

class ClearController extends GetxController {
  //TODO: Implement ClearController
UniTranslatorController uniTranslatorController=Get.put(UniTranslatorController());
MultiTranslatorController multiTranslatorController=Get.put(MultiTranslatorController());
CameraControllers cameraControllers=Get.put(CameraControllers());
LanguagesController languagesController=Get.put(LanguagesController());
VoiceTranslatorController voiceTranslatorController=Get.put(VoiceTranslatorController());
  final count = 0.obs;
  @override
  void onInit() {
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
  void clearUniTranslator(){
    uniTranslatorController.translatedText.value="";
    uniTranslatorController.textContent="";
    languagesController.languagesPrefix=languagesController.languagesPrefix[0];
    languagesController.languages=languagesController.languages[0];


  }
  void clearMicTranslator(){

  }
  void clearCameraTranslator(){

  }
  void clearMultiTranslator(){

  }


}
