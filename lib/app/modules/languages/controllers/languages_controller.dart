import 'package:get/get.dart';
import 'package:translator/app/controllers/remote_config_controller.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';
import 'package:translator/app/modules/voice_translator/controllers/voice_translator_controller.dart';

class LanguagesController extends GetxController {
  //TODO: Implement LanguagesController

  final selectedIndex = 0.obs;
  dynamic indexId = 0.obs;
  dynamic selectedFromIndex = 0.obs;
  dynamic selectedToIndex = 0.obs;
  // dynamic selectedIndex;
  // dynamic selectedFromIndex;
  // dynamic selectedToIndex;
  // dynamic indexId ;

  UniTranslatorController uniTranslatorController=Get.put(UniTranslatorController());
  VoiceTranslatorController voiceTranslatorController=Get.put(VoiceTranslatorController());
  MultiTranslatorController multiTranslatorController=Get.put(MultiTranslatorController());
  RemoteConfigController remoteConfigController=Get.find<RemoteConfigController>();
  @override
  void onInit() {
if(remoteConfigController.languageIndex!=null){
  selectedToIndex.value=remoteConfigController.languageIndex;
  print(remoteConfigController.languageIndex);
}
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

Future<void> setIndex(index,from,id) async {
  selectedIndex.value=index;
    if(from=="from"){
      selectedFromIndex.value=index;
    }
  if(from=="to" && id==null){
    selectedToIndex.value=index;
    String translatedText=await uniTranslatorController.getTranslateUrl(
      languagesPrefix[selectedFromIndex.value],

      languagesPrefix[selectedToIndex.value],
      uniTranslatorController.textContent

    );
    uniTranslatorController.setText(translatedText);

  }
  if(from=="to" && id=="voice"){
    selectedToIndex.value=index;
    String translatedText=await voiceTranslatorController.getTranslateUrl(
        languagesPrefix[selectedFromIndex.value],

        languagesPrefix[selectedToIndex.value],
        voiceTranslatorController.inputText.value

    );
    voiceTranslatorController.setText(translatedText);

  }
  if(from=="to" && id!=null && id!="voice" ){
    indexId.value=id;
    selectedToIndex.value=index;
    multiTranslatorController.listOfPrefix[indexId.value]=languagesPrefix[selectedToIndex.value];
    multiTranslatorController.listOfLang[indexId.value]=languages[selectedToIndex.value];


    String translatedText=await multiTranslatorController.getTranslateUrl(
        languagesPrefix[selectedFromIndex.value],

        multiTranslatorController.listOfPrefix[indexId.value],
        multiTranslatorController.textContent

    );
    multiTranslatorController.listOfTranslation[indexId.value]=translatedText;
    // multiTranslatorController.setText(translatedText);

  }

}
  RxList languagesValue=[
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
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
