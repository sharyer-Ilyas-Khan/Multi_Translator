import 'package:get/get.dart';
import 'package:translator/app/modules/image_text_translator/controllers/camera_controller.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';
import 'package:translator/app/modules/voice_translator/controllers/voice_translator_controller.dart';

class ClearController extends GetxController {
  //TODO: Implement ClearController
// UniTranslatorController uniTranslatorController=Get.put(UniTranslatorController());
// MultiTranslatorController multiTranslatorController=Get.put(MultiTranslatorController());
// CameraControllers cameraControllers=Get.put(CameraControllers());
// VoiceTranslatorController voiceTranslatorController=Get.put(VoiceTranslatorController());
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
    // uniTranslatorController.translatedText.value="";
    // uniTranslatorController.textContent="";


  }
  void clearMicTranslator(){
// voiceTranslatorController.translatedText.value="";
// voiceTranslatorController.inputText.value="...";
// voiceTranslatorController.audioEnabled.value=false;

  }
  void clearCameraTranslator(){
    // cameraControllers.controller.stopImageStream();
    // cameraControllers.file=null;
    // cameraControllers.flashOn.value=false;
    // cameraControllers.isInitialized.value=false;
  }
  void clearMultiTranslator(){

  }
  void clearLanguages(){
    // languagesController.languagesPrefix=languagesController.languagesPrefix[0];
    // languagesController.languages=languagesController.languages[0];
  }


}
