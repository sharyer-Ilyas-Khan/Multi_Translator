import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:translator/app/modules/multi_translator/views/from_text_area.dart';
import 'package:translator/app/modules/multi_translator/views/to_text_area.dart';

class MultiTranslatorController extends GetxController {
  //TODO: Implement MultiTranslatorController
   final RxList listOfWidget=[FromTextArea(),ToTextArea(id:1,)].obs;
   final RxList listOfPrefix=["en","en"].obs;
   final RxList listOfLang=["English","English"].obs;
   final RxList listOfTranslation=["...","..."].obs;
   Rx<String> translatedText="...".obs;
   String textContent='';
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
/// todo: need an index of prefix
   ///
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
       print(response.body);
       var result=response.body[0][0];
       return result[0];
     } catch (e) {
       return "....";
     }
   }
   void setText(text){
     translatedText.value=text;
   }
}
