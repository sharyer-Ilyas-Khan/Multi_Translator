import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/speaker_controller.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/languages/views/languages_view.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';

import '../../../controllers/text_font_controller.dart';
class FromTextArea extends StatelessWidget {
   FromTextArea({Key? key}) : super(key: key);
String inputText="";
  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController=Get.put(LanguagesController());
    MultiTranslatorController controller=Get.put(MultiTranslatorController());
    TextFontController fontController=Get.put(TextFontController());
    SpeakerController speakerController=Get.put(SpeakerController());
    return Container(
      height: Get.height*0.26,
      width: Get.width,
      color: AppColors.scaffoldColor,
      child: Padding(
        padding:  EdgeInsets.only(left: Get.width*0.08,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(
              height: Get.height*0.13,
              width: Get.width,
              child: Obx(
                ()=> SizedBox(
                  height: Get.height*0.13,
                  width: Get.width*0.8,
                  child:  TextField(
                    maxLines: 5,
                    minLines: 5,
                    focusNode: controller.myFocusNode,
                    controller: controller.fromTextController.value,
                    style: fontController.inputTextStyle(fontController.inputFont.value),
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Text Here",
                      hintStyle:fontController.inputTextHintStyle(fontController.inputFont.value),
                    ),
                    onChanged: (value) async {
                      inputText=value;

                      if(value.length>=40){
                        fontController.setInputTextFont(20.0);
                      }
                      if(value.length<40){
                        fontController.setInputTextFont(40.0);
                      }
                      int getIndex=await controller.detectLanguage(value);
                      languagesController.selectedFromIndex.value=getIndex;
                      if(value.isEmpty){
                        languagesController.selectedFromIndex.value=0;
                      }
                      controller.setTranslations(
                          languagesController.languagesPrefix[languagesController.selectedFromIndex.value],
                          value);

                    },
                  ),
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(2.0),
              child: Text("From:",style: fromTextStyle,),
            ),
            Obx(
                  ()=> InkWell(
                onTap: (){
                  Get.to(()=>LanguagesView(type: "from") );
                },
                child: Container(
                  width: Get.width*0.35,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54,width: 2),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text( languagesController.languages
                        [languagesController.selectedFromIndex.value],style: fromDropStyle,),
                        const RotatedBox(
                          quarterTurns: 1,
                        child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 15,))
                      ],
                    )
                )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
