
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/modules/multi_translator/views/from_text_area.dart';
import 'package:translator/app/modules/multi_translator/views/to_text_area.dart';

class MultiTranslatorController extends GetxController {
  //TODO: Implement MultiTranslatorController
    RxList<Widget> listOfWidget=<Widget>[ToTextArea(id:0,)].obs;

    RxList listOfPrefix=["en"].obs;
    RxList listOfLang=["English"].obs;
    RxList listOfTranslation=["Translation"].obs;
   Rx<String> translatedText="Translation".obs;
   String textContent='';
   RxInt translatedIndex=1.obs;
   Rx<TextEditingController> fromTextController=TextEditingController().obs;

   void clearList(){
     listOfPrefix=["en"].obs;
     listOfTranslation=["..."].obs;
     listOfLang=["English"].obs;
     listOfWidget=[ToTextArea(id:0,)].obs;
     textContent="";
     fromTextController.value.clear();
   }
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
void addIntoList(){
    listOfWidget.add(ToTextArea(id:listOfWidget.length));
}
void addPrefix(){
    listOfPrefix.add("en");
}
void addIntoTranslation(){
    listOfTranslation.add("...");
}
   void addLang(){
     listOfLang.add("English");
   }
void updateIdList(){

}

void setTranslations(String sourceLan,content)async{
    for(int i=0;i<listOfPrefix.length;i++){
      String translatedText= await getTranslateUrl(
          sourceLan,
          listOfPrefix[i],
          content
      );
      listOfTranslation[i]=translatedText;
    }



}


   Future<String> getTranslateUrl(String sourceLan, String targetLan, String content)async {
     textContent=content;
     String TRANSLATE_BASE_URL = "https://translate.google.com.hk/";
     try {
       String url="${TRANSLATE_BASE_URL}translate_a/single?client=gtx&sl=${sourceLan}&tl=${targetLan}&dt=t&q=${Uri.encodeFull(content)}";
       Response response=await GetConnect().get(url);
       var result=response.body[0][0];
       return result[0];
     } catch (e) {
       return "....";
     }
   }
   void setText(text){
     translatedText.value=text;
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
    FocusNode myFocusNode=FocusNode();
    void removeFocus() {
      if (myFocusNode.hasFocus) {
        myFocusNode.unfocus();
      }
    }
    void setTranslatedId(id){
      translatedIndex.value=id;
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
