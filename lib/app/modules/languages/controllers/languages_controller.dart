import 'package:get/get.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';

class LanguagesController extends GetxController {
  //TODO: Implement LanguagesController

  final selectedIndex = 0.obs;
  final selectedFromIndex = 0.obs;
  final selectedToIndex = 0.obs;
  UniTranslatorController uniTranslatorController=Get.put(UniTranslatorController());
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

Future<void> setIndex(index,from) async {
  selectedIndex.value=index;
    if(from=="from"){
      selectedFromIndex.value=index;
    }
  if(from=="to"){
    selectedToIndex.value=index;
    String translatedText=await uniTranslatorController.getTranslateUrl(
      languagesPrefix[selectedFromIndex.value],

      languagesPrefix[selectedToIndex.value],
      uniTranslatorController.textContent

    );
    uniTranslatorController.setText(translatedText);

  }

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
