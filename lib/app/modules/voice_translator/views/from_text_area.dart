import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/voice_translator/controllers/voice_translator_controller.dart';

import '../../languages/views/languages_view.dart';
class FromTextArea extends StatelessWidget {
  const FromTextArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController=Get.put(LanguagesController());
    VoiceTranslatorController controller=Get.put(VoiceTranslatorController());
    return Container(
      height: Get.height*0.24,
      width: Get.width,
      color: AppColors.scaffoldColor,
      child: Padding(
        padding:  EdgeInsets.only(left: Get.width*0.08,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Obx(
              ()=> SizedBox(
                height: Get.height*0.13,
                width: Get.width*0.9,
                child: SingleChildScrollView(
                  child: Text(controller.inputText.value,style:textInputStyle ,),
                )

              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(2.0),
              child: Text("From:",style: fromTextStyle,),
            ),
            InkWell(
                onTap: (){
                  // Get.to(()=>LanguagesView(type: "from"));
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text(languagesController.languages
                        [0]
                        // [languagesController.selectedFromIndex.value]
                          ,style: fromDropStyle,),
                        // const RotatedBox(
                        //   quarterTurns: 1,
                        // child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 15,))
                      ],
                    )
                )

              ),
            )
          ],
        ),
      ),
    );
  }
}
