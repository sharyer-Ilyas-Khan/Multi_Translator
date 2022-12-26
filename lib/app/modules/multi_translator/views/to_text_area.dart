import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';

import '../../languages/views/languages_view.dart';
import '../controllers/multi_translator_controller.dart';
class ToTextArea extends StatelessWidget {
  final id;
  const ToTextArea({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController=Get.put(LanguagesController());
    MultiTranslatorController multiController=Get.put(MultiTranslatorController());
    return  Container(
      height: Get.height*0.25,
      width: Get.width,

      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 6
          )
        ]
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: Get.width*0.08,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Obx(()=> SizedBox(
                height: Get.height*0.13,
                width: Get.width*0.9,
                child: SingleChildScrollView(
                  child: Text(multiController.listOfTranslation[id],style:textInputStyleTo ,),
                )
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(2.0),
              child: Text("To:",style: toTextStyle,),
            ),
            Obx(
                  ()=> InkWell(
                onTap: (){
                  Get.to(()=>LanguagesView(type: "to",id:id));
                },
                child: Container(
                    width: Get.width*0.35,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 1),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text(multiController.listOfLang[id]
                              ,style: toDropStyle,),
                            const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,))
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
