import 'dart:convert';

import 'package:get/get.dart';

class UniTranslatorController extends GetxController {
  //TODO: Implement UniTranslatorController
  Rx<String> translatedText="...".obs;

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
void setText(text){
    translatedText.value=text;
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
      return "${TRANSLATE_BASE_URL}translate_a/single?client=gtx&sl=${sourceLan}&tl=${targetLan}&dt=t&q=${content}";
    }
  }
}


