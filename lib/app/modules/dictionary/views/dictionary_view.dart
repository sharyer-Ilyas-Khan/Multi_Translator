import 'package:flutter/material.dart';

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
         height: Get.height*0.1,
         width: Get.width,
         child: const SearchBarDictionary(),
       ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(()=> controller.meaningFirst.value!=""||controller.inputText.value.isEmpty?
          ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Row(
                  children: [
                    Text(controller.inputText.value,style: dictionaryTitle,),
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
                const Text("More Details",style: dictionaryExample,),
                RichText(text:TextSpan(
                  children: [
                    const TextSpan(text: "Part Of Speech:\t\t",style:dictionaryDef ),
                    TextSpan(text: controller.partOfSpeech.value.toString().toUpperCase(),style:dictionaryMoreResult ),
                  ]
                )),
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
            ):Container(),
          ),
        ))
      ],
    ),
    );
  }
}
