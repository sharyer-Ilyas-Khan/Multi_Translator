import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/text_font_controller.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';

import '../../../controllers/menu_items_controller.dart';
import '../../../controllers/speaker_controller.dart';
import '../../languages/views/languages_view.dart';
class FromTextArea extends StatelessWidget {
  final text;
   FromTextArea({Key? key,this.text}) : super(key: key);
   String inputText="";
TextEditingController fromController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController=Get.put(LanguagesController());
    UniTranslatorController uniController=Get.put(UniTranslatorController());
    TextFontController fontController=Get.put(TextFontController());
    MenuItemsController menuItemsController = Get.put(MenuItemsController());

    SpeakerController speakerController=Get.put(SpeakerController());
    fromController.text=text??"...";
    print(text);
    text!=""?translate(uniController, languagesController, text):{};
    text!=""?speakerController.checkAvailableFrom(languagesController.languagesPrefix
    [languagesController.selectedFromIndex.value]):{};
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12,width: 0.5)
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 15,top: 5),
        child: Stack(
          children: [
            Positioned(
                right: 0,
                top: 0,
                child: IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.close,color: Colors.black45,size: 18,),
            )),
            SizedBox(
              height: Get.height*0.13,
              width: Get.width*0.8,
              child:  Obx(()=> TextField(
                controller: fromController,
                  focusNode: uniController.myFocusNode,
                  maxLines: 5,
                  minLines: 5,
                  style: fontController.inputTextStyle(fontController.inputFont.value),
                  keyboardType: TextInputType.emailAddress,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Text Here",
                    hintStyle:fontController.inputTextHintStyle(fontController.inputFont.value),
                  ),
                  onChanged: (value) async {
                  inputText=value;
                  speakerController.checkAvailableFrom(languagesController.languagesPrefix
                  [languagesController.selectedFromIndex.value]);
                    if(value.length>=40){
                      fontController.setInputTextFont(18.0);
                    }
                    if(value.length<40){
                      fontController.setInputTextFont(25.0);
                    }
                    int getIndex=await uniController.detectLanguage(value);
                    languagesController.selectedFromIndex.value=getIndex;
                    String translatedText=
                    await uniController.getTranslateUrl(languagesController.languagesPrefix[
                      getIndex
                    ], languagesController.languagesPrefix[
                    languagesController.selectedToIndex.value
                    ], value);

                    uniController.setText(translatedText);
                    if(value.isEmpty){
                      languagesController.selectedFromIndex.value=0;
                    }
                  },
                ),
              ),
            ),
            Positioned(right:0,bottom: 0,left: 0,
                  child: Row(
                    children: [
                      IconButton(
                        padding:EdgeInsets.only(right: 25),
                        onPressed: () {
                          menuItemsController.addToFav(
                              languagesController.languages[
                              languagesController.selectedFromIndex.value]
                                  .toString(),
                              uniController.textContent.toString(),
                              languagesController.languages[
                              languagesController.selectedToIndex.value]
                                  .toString(),
                              uniController.translatedText.value.toString(),
                              "uni"); },
                        icon: Icon(Icons.favorite_border),
                        color: Colors.grey.shade400,
                        iconSize: 20,
                      ),
                      Spacer(),
                       IconButton(onPressed: (){
                              print(speakerController.isAvailableFrom.value);
                              if(speakerController.isAvailableFrom.value){
                                inputText!=""?speakerController.speakFrom(inputText):speakerController.speakFrom(text);

                              }else{
                                Get.snackbar("Sorry!", "Speaker is unAvailable.",snackPosition:SnackPosition.TOP,
                                    backgroundColor: Colors.black54,colorText: Colors.white );
                              }

                            }, icon: SvgPicture.asset("Assets/svg/pronouncer.svg",),

                      ),
                      IconButton(onPressed: (){


                      }, icon: SvgPicture.asset("Assets/svg/full_screen.svg")),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
  Future<void> translate(uniController,languagesController,text) async {
    int getIndex=await uniController.detectLanguage(text);
    languagesController.selectedFromIndex.value=getIndex;
    String translatedText=await uniController.getTranslateUrl(languagesController.languagesPrefix[
    getIndex
    ], languagesController.languagesPrefix[
    languagesController.selectedToIndex.value
    ], text);
    uniController.setText(translatedText);
  }
}
