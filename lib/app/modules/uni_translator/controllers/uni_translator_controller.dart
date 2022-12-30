import 'dart:convert';

import 'package:get/get.dart';
import 'package:translator/app/controllers/clear_controller.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';

class UniTranslatorController extends GetxController {
  //TODO: Implement UniTranslatorController
  Rx<String> translatedText="...".obs;
  ClearController clearController=Get.put(ClearController());
  String textContent='';
  @override
  void onInit() {
    clearController.clearLanguages();
    clearController.clearCameraTranslator();
    clearController.clearMicTranslator();
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
void setText(text){
    translatedText.value=text;
}
  Future<String> getTranslateUrl(String sourceLan, String targetLan, String content)async {
    textContent=content;
    String TRANSLATE_BASE_URL = "https://translate.google.com.hk/";
    try {
     String url="${TRANSLATE_BASE_URL}translate_a/single?client=gtx&sl=${sourceLan}&tl=${targetLan}&dt=t&q=${Uri.encodeFull(content)}";
    Response response=await GetConnect().get(url);
    // print(response.body);
    var result=response.body[0][0];
    return result[0];
    } catch (e) {
      return "....";
    }
  }
  String lang="";
  Future<int> detectLanguage(content) async {
    lang="";
    String url="https://translate.google.com.hk/translate_a/single?client=gtx&sl=auto&tl=eng&dt=t&q=${Uri.encodeFull(content)}";
    Response response= await GetConnect().get(url);
    List detectedLang=response.body[8][0];
    if(detectedLang[0].toString().length>3){
      lang=detectedLang[0].toString().split("-").first;
    }
    else{
      lang=detectedLang[0].toString();
    }
    for(int i=0;i<languagesPrefix.length;i++){

      if( languagesPrefix[i]==lang){
        return i;
      }
    }
    return 0;


  }
  List languages=[
    "English",
    "Spanish",
    "German",
    "Arabic",
    "French",
    "Italian",
    "Urdu",
    "Hindi",
    "Dutch",
    "Thai",
    "Russian",
    "Afrikaans",
    "Chinese",
    "Bengali",
    "Czech",
    "Danish",
    "Estonian",
    "Finnish",
    "Georgian",
    "Greek",
    "Gujarati",
    "Hungarian",
    "Icelandic",
    "Telugu",
    "Tamil",
    "Ukrainian",
    "Romanian",
    "Japanese",
    "Korean",
    "Irish",
    "Indonesian",
    "Hebrew",
    "Kannada",
    "Korean",
    "Swedish",
    "Polish",
    "Farsi",
    "Norwegian",
    "Portuguese",
    "Belarusian",
    "Bulgarian",
    "Catalan",
    "Haitian Creole",
    "Latvian",
    "Lithuanian",
    "Macedonian",
    "Malay",
    "Maltese",
    "Slovak",
    "Slovenian",
    "Swahili",
    "Vietnamese",
  ];

  List languagesPrefix=[
    "en",
    "es",
    "de",
    "ar",
    "fr",
    "it",
    "ur",
    "hi",
    "nl",
    "th",
    "ru",
    "af",
    "zh",
    "bn",
    "cs",
    "da",
    "et",
    "fi",
    "ka",
    "el",
    "gu",
    "hu",
    "is",
    "te",
    "ta",
    "uk",
    "ro",
    "ja",
    "kn",
    "ga",
    "id",
    "iw",
    "kn",
    "kn",
    "sv",
    "pl",
    "fa",
    "no",
    "pt",
    "be",
    "bg",
    "ca",
    "gl",
    "ht",
    "lv",
    "lt",
    "mk",
    "ms",
    "mt",
    "sk",
    "sl",
    "sw",
    "vi",
  ];


}


