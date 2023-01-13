
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:translator/app/controllers/speaker_controller.dart';

class UniTranslatorController extends GetxController {
  //TODO: Implement UniTranslatorController
  Rx<String> translatedText="Translation".obs;
  String textContent='';
  RxBool isNativeLoaded=false.obs;
  NativeAd? nativeAd;
  TextEditingController fromController=TextEditingController();
SpeakerController speakerController=Get.put(SpeakerController());
  @override
  void onInit() {
    print("object");
    print("object");
    print("object");

    print("object");
    loadNativeAd();
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
FocusNode myFocusNode=FocusNode();
void removeFocus(){
  if(myFocusNode.hasFocus){
    myFocusNode.unfocus();
  }

}
void swipe(){
  if(translatedText.value!="Translation"){
    String newInputText=translatedText.value;
    translatedText.value=fromController.text;
    fromController.text=newInputText;
  }else{
    Get.snackbar("Sorry!", "Cannot swipe empty fields.",snackPosition:SnackPosition.TOP,
      backgroundColor: Colors.black54,colorText: Colors.white,
      duration: Duration(milliseconds: 1500),);
  }

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
     speakerController.checkAvailableTo(targetLan);
    var result=response.body[0][0];

    return result[0];
    } catch (e) {
      return "Translation";
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
  void loadNativeAd() {
    nativeAd = NativeAd(
        request: const AdRequest(),
        adUnitId: "ca-app-pub-3940256099942544/2247696110",
        factoryId:  (Platform.isIOS)?'largeNative':'flightNative',
        listener: NativeAdListener(
            onAdLoaded: (ad) {
              // callEvent("flight_no_native_ad_loaded_flight");
              //   WidgetsBinding.instance.removeObserver(this);
              isNativeLoaded.value = true;
              // widget.remoteController.dashboardNativeClicked(false);

            },
            onAdFailedToLoad: (ad, error) {
              ad.dispose();
              isNativeLoaded.value = false;
              // widget.remoteController.dashboardNativeClicked(false);
              // callEvent("flight_no_native_ad_failed_flight");
              print('failed to load the ad native');
            },
            onAdClicked: (ad) {
              // WidgetsBinding.instance.addObserver(this);
              // widget.remoteController.dashboardNativeClicked(true);
              // callEvent("flight_no_native_ad_clicked_flight");
            }
        )
    );
    nativeAd!.load();
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


