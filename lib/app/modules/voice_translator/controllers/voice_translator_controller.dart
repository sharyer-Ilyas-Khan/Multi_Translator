import 'package:get/get.dart';
import 'package:translator/app/controllers/clear_controller.dart';

import '../../../controllers/text_font_controller.dart';

class VoiceTranslatorController extends GetxController {
  //TODO: Implement VoiceTranslatorController
  Rx<String> translatedText="...".obs;
  Rx<String> inputText="...".obs;
  RxBool audioEnabled=false.obs;
  TextFontController fontController=Get.put(TextFontController());
  ClearController clearController=Get.put(ClearController());
  @override
  void onInit() {
    clearController.clearLanguages();
    clearController.clearCameraTranslator();
    clearController.clearUniTranslator();
    clearController.clearMultiTranslator();
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
  void audioEnable(status){
    audioEnabled.value=status;
  }
  void setText(text){
    translatedText.value=text;
  }
  void setInputText(text){
    inputText.value=text;
    if(inputText.value.length>40){
      fontController.inputFont.value=20.0;
    }
    if(inputText.value.length<40){
      fontController.inputFont.value=40.0;
    }
  }
  void getFont(){

  }

  Future<String> getTranslateUrl(String sourceLan, String targetLan, String content)async {
    String TRANSLATE_BASE_URL = "https://translate.google.com.hk/";
    try {
      String url="${TRANSLATE_BASE_URL}translate_a/single?client=gtx&sl=${sourceLan}&tl=${targetLan}&dt=t&q=${Uri.encodeFull(content)}";
      Response response=await GetConnect().get(url);
      print(response.body);
      var result=response.body[0][0];
      return result[0];
    } catch (e) {
      return "....";
    }
  }
}

