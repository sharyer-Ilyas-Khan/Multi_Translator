import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class SpeakerController extends GetxController {
  FlutterTts? flutterTtsTo;
  FlutterTts? flutterTtsFrom;
  RxBool isAvailableFrom=false.obs;
  RxBool isAvailableTo=false.obs;
  @override
  void onInit() {
    flutterTtsTo= FlutterTts();
    flutterTtsFrom= FlutterTts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    flutterTtsTo!.stop();
    flutterTtsFrom!.stop();
    super.onClose();
  }
  void checkAvailableFrom(prefix){
    if(supportedLanguagesPrefix.contains(prefix)){
      isAvailableFrom.value=true;
      print("match--");
      for(int i=0;i<supportedLanguagesPrefix.length;i++){
        if(supportedLanguagesPrefix[i]==prefix){
          flutterTtsFrom!.setLanguage(supportedLanguages[i]);
        }
      }
    }
    else{
      print("Not match--");
      isAvailableFrom.value=false;
    }
  }
  void checkAvailableTo(prefix){
    print(prefix);
    if(supportedLanguagesPrefix.contains(prefix)){
      isAvailableTo.value=true;
      print("match");
      for(int i=0;i<supportedLanguagesPrefix.length;i++){
        if(supportedLanguagesPrefix[i]==prefix){
          flutterTtsTo!.setLanguage(supportedLanguages[i]);
        }
      }
    }
    else{
      print("Not match");
      isAvailableTo.value=false;
    }
  }
  void speakTo(text)async{
            flutterTtsTo!.speak(text.toString());
      }
  void speakFrom(text)async{
    flutterTtsFrom!.speak(text.toString());
  }


List supportedLanguages=[
  "tr-TR", "nl-BE", "cs-CZ", "da-DK", "hi-IN", "zh-CN", "en-ZA", "de-DE",
  "pl-PL", "ar-SA", "hu-HU", "en-AU", "sv-SE", "en-IE", "es-ES", "ru-RU", "es-MX",
  "pt-PT", "id-ID", "fr-FR", "ko-KR", "no-NO", "nl-NL", "zh-TW", "ro-RO", "fi-FI", "sk-SK", "en-US", "zh-HK",
  "pt-BR", "he-IL", "ja-JP", "th-TH", "it-IT",
  "en-GB", "el-GR","en-IN", "fr-CA"

];
  List supportedLanguagesPrefix=[
    "tr",
    "nl",
    "cs",
    "da",
    "hi",
    "zh",
    "en",
    "de",
    "pl",
    "ar",
    "hu",
    "en",
    "sv",
    "en",
    "es",
    "ru",
    "es",
    "pt",
    "id",
    "fr",
    "ko",
    "no",
    "nl",
    "zh",
    "ro",
    "fi",
    "sk",
    "en",
    "zh",
    "pt",
    "he",
    "ja",
    "th",
    "it",
    "en",
    "el",
    "en",
    "fr"
  ];
}
//
// "tr-TR",
// "nl-BE",
// "cs-CZ",
// "da-DK",
// "hi-IN",
// "zh-CN",
// "en-ZA",
// "de-DE",
// "pl-PL",
// "ar-SA",
// "hu-HU",
// "en-AU",
// "sv-SE",
// "en-IE",
// "es-ES",
// "ru-RU",
// "es-MX",
// "pt-PT",
// "id-ID",
// "fr-FR",
// "ko-KR",
// "no-NO",
// "nl-NL",
// "zh-TW",
// "ro-RO",
// "fi-FI",
// "sk-SK",
// "en-US",
// "zh-HK",
// "pt-BR",
// "he-IL",
// "ja-JP",
// "th-TH",
// "it-IT",
// "en-GB",
// "el-GR",
// "en-IN",
// "fr-CA"
