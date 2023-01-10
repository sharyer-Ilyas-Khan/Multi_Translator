import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      decoration: BoxDecoration(
          color: Colors.white,
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 15.0,top: 5),
        child: Stack(
          children:  [
            Obx(
                  ()=> InkWell(
                onTap: (){
                  Get.to(()=>LanguagesView(type: "from") );
                },
                child: Container(
                    width: Get.width*0.35,
                    height: 40,
                    decoration: BoxDecoration(
                       color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text( "From: ${languagesController.languages
                                  [languagesController.selectedFromIndex.value
                                   ]
                                    }",style: fromDropStyle,),
                            Icon(Icons.arrow_drop_down_sharp,color: Colors.blue,size: 20,)
                          ],
                        )
                    )
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
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
                          fontController.setInputTextFont(18.0);
                        }
                        if(value.length<40){
                          fontController.setInputTextFont(25.0);
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
            ),
            Positioned(right:0,bottom: 0,left: 0,
                child: Row(
                  children: [
                    IconButton(
                      padding:EdgeInsets.only(right: 0),
                      onPressed: () {
                        // menuItemsController.addToFav(
                        //     languagesController.languages[
                        //     languagesController.selectedFromIndex.value]
                        //         .toString(),
                        //     uniController.textContent.toString(),
                        //     languagesController.languages[
                        //     languagesController.selectedToIndex.value]
                        //         .toString(),
                        //     uniController.translatedText.value.toString(),
                        //     "uni");
                        },
                      icon: Icon(Icons.favorite_border),
                      color: Colors.grey.shade400,
                      iconSize: 20,
                    ),
                    IconButton(onPressed: (){
                      print(speakerController.isAvailableFrom.value);
                      // if(speakerController.isAvailableFrom.value){
                      //   inputText!=""?speakerController.speakFrom(inputText):speakerController.speakFrom(text);
                      //
                      // }else{
                      //   Get.snackbar("Sorry!", "Speaker is unAvailable.",snackPosition:SnackPosition.TOP,
                      //       backgroundColor: Colors.black54,colorText: Colors.white );
                      // }

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
}
