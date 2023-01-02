import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/dictionary/views/search_bar.dart';

import '../controllers/dictationary_controller.dart';

class DictionaryView extends GetView<DictionaryController> {
  const DictionaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DictionaryController controller=Get.put(DictionaryController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SizedBox(
         height: Get.height*0.09,
         width: Get.width,
         child: const SearchBarDictionary(),
       ),
        Obx(
          ()=> controller.errorText.value==""?Expanded(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(()=> controller.meaningFirst.value!=""?
            ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Row(
                    children: [
                      Text(controller.word.value,style: dictionaryTitle,),
                      IconButton(
                            onPressed: (){
                                controller.speak();
                        }, icon:const Icon(Icons.volume_up,size: 30,color: AppColors.primaryColor,),
                      )
                    ],
                  ),
                  Text(controller.pronounceText.value,style: dictionaryDef,),
                   Text("${controller.meaningFirst.value}:",style: dictionaryMean,),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 10),
                    child: Text(controller.meaningSecond.value,style: dictionaryDef,),
                  ),
                  const Padding(
                    padding:  EdgeInsets.only(top: 8.0),
                    child:  Text("More Details",style: dictionaryExample,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RichText(text:TextSpan(
                      children: [
                        const TextSpan(text: "Part Of Speech:\t\t",style:dictionaryDef ),
                        TextSpan(text: controller.partOfSpeech.value.toString().toUpperCase(),style:dictionaryMoreResult ),
                      ]
                    )),
                  ),
                  RichText(text:TextSpan(
                      children: [
                        const TextSpan(text: "Synonyms:\t\t",style:dictionaryDef ),
                        TextSpan(text: controller.synonyms.isEmpty?"No data":controller.synonyms.toString().toUpperCase(),style:dictionaryMoreResult ),
                      ]
                  )),
                  RichText(text:TextSpan(
                      children: [
                        const TextSpan(text: "Antonyms:\t\t",style:dictionaryDef ),
                        TextSpan(text: controller.antonyms.isEmpty?"No data":controller.antonyms.toString().toUpperCase(),style:dictionaryMoreResult ),
                      ]
                  )),
                 Padding(
                   padding: const EdgeInsets.only(left: 18.0,top: 10),
                   child: Text("ex:${controller.meaningThird.value}",style: dictionaryExampleText,),
                 ),
                ],
              ):controller.isLoading.value?
           const  SpinKitFadingCircle(color: AppColors.primaryColor,):Container(),
            ),
          )):Expanded(child: Center(
            child: Text(controller.errorText.value),
          )),
        )
      ],
    ),
    );
  }
}
