import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/text_font_controller.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';

import '../../languages/views/languages_view.dart';
class FromTextArea extends StatelessWidget {
  final text;
   FromTextArea({Key? key,this.text}) : super(key: key);
TextEditingController fromController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController=Get.put(LanguagesController());
    UniTranslatorController uniController=Get.put(UniTranslatorController());
    TextFontController fontController=Get.put(TextFontController());
    fromController.text=text??"...";
    text!=""?translate(uniController, languagesController, text):{};
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
              width: Get.width*0.9,
              child:  Obx(()=> TextField(
                controller: fromController,
                  maxLines: 5,
                  minLines: 5,
                  style: fontController.inputTextStyle(fontController.inputFont.value),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Text Here",
                    hintStyle:fromHintStyle
                  ),
                  onChanged: (value) async {
                    if(value.length>=40){
                      fontController.setInputTextFont(20.0);
                    }
                    if(value.length<40){
                      fontController.setInputTextFont(40.0);
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
            const Padding(
              padding:  EdgeInsets.all(2.0),
              child: Text("From:",style: fromTextStyle,),
            ),
            Obx(
              ()=> InkWell(
                onTap: (){
                  Get.to(()=>LanguagesView(type: "from"));
                },              child: Container(
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
                        Text(
                          languagesController.languages
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
