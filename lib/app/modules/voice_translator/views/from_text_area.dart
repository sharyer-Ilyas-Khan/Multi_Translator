import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/voice_translator/controllers/voice_translator_controller.dart';

import '../../../controllers/text_font_controller.dart';
class FromTextArea extends StatelessWidget {
  const FromTextArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController=Get.put(LanguagesController());
    VoiceTranslatorController controller=Get.put(VoiceTranslatorController());
    TextFontController fontController=Get.put(TextFontController());
    return Container(
      height: Get.height*0.26,
      width: Get.width,

      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12,width: 0.5)
      ),
      child: Padding(
        padding:  const EdgeInsets.only(left: 15,top: 5),
        child: Stack(
          children:  [
            Obx(
              ()=> SizedBox(
                height: Get.height*0.13,
                width: Get.width*0.9,
                child: SingleChildScrollView(
                  child: Text(controller.inputText.value,style:fontController.inputTextStyle(fontController.inputFont.value),),
                )

              ),
            ),
            Positioned(right:0,bottom: 0,left: 0,
                child: Row(
                  children: [
                    IconButton(
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
                      icon: Icon(Icons.mic),
                      color: Colors.black,
                      iconSize: 20,
                    ),
                    IconButton(onPressed: (){
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
                      // if(speakerController.isAvailableFrom.value){
                      //   inputText!=""?speakerController.speakFrom(inputText):speakerController.speakFrom(text);
                      //
                      // }else{
                      //   Get.snackbar("Sorry!", "Speaker is unAvailable.",snackPosition:SnackPosition.TOP,
                      //       backgroundColor: Colors.black54,colorText: Colors.white );
                      // }

                    }, icon: SvgPicture.asset("Assets/svg/pronouncer.svg",),

                    ),
                    Spacer(),
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
