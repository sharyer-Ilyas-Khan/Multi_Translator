
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';
class DictionaryController extends GetxController {

RxString inputText="".obs;
RxString partOfSpeech="".obs;
RxString word="".obs;
RxString meaningFirst="".obs;
RxString meaningSecond="".obs;
RxString meaningThird="".obs;
RxBool isLoading=false.obs;
RxString audioUrl="".obs;
RxString pronounceText="".obs;
RxList synonyms=[].obs;
RxList antonyms=[].obs;
FlutterTts? flutterTts;
  @override
  void onInit() {
     flutterTts= FlutterTts();
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
  void setText(value){
    inputText.value=value;
  }
  void speak(){
    flutterTts!.speak(inputText.value);
  }
void load(status){
    if(status==true){
      meaningFirst.value="";
    }
    isLoading.value=status;
}
  Future<void> lookUp() async {
    try {
      String url="https://api.dictionaryapi.dev/api/v2/entries/en/${Uri.encodeFull(inputText.value)}";
      Response response=await GetConnect().get(url);
      if(response.body[0]["title"]=="No Definitions Found"){
        load(false);
      }
      else{
        load(false);
        // word
        word.value=response.body[0]["word"].toString();
        //api response word phonetics
        audioUrl.value=response.body[0]["phonetics"][0]["audio"].toString();
        pronounceText.value=response.body[0]["phonetics"][0]["text"].toString();
        // word meanings
        partOfSpeech.value=response.body[0]["meanings"][0]["partOfSpeech"].toString();
        meaningFirst.value=response.body[0]["meanings"][0]["definitions"][0]["definition"].toString();
        synonyms.value=response.body[0]["meanings"][0]["synonyms"];
        antonyms.value=response.body[0]["meanings"][0]["antonyms"];

        meaningSecond.value=response.body[0]["meanings"][0]["definitions"][1]["definition"].toString();
        meaningThird.value=response.body[0]["meanings"][0]["definitions"][2]["definition"].toString();
        // print(response.body[0]["meanings"][0]["definitions"][2]["definition"].toString());

      }




    } catch (e) {
     print(e.toString());
    }
  }
  }


