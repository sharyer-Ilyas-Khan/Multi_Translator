import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/multi_translator/views/from_text_area.dart';
import 'package:translator/app/modules/multi_translator/views/to_text_area.dart';

import '../controllers/multi_translator_controller.dart';

class MultiTranslatorView extends GetView<MultiTranslatorController> {
   MultiTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MultiTranslatorController controller=Get.put(MultiTranslatorController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.addPrefix();
          controller.addLang();
          controller.addIntoTranslation();
          controller.addIntoList();


        },
        backgroundColor: Colors.white,
        child: const Center(
          child: Icon(Icons.add,color: AppColors.primaryColor,),
        ),
      ),

      body:Obx(
            ()=>ListView.builder(
            itemCount:controller.listOfWidget.length,
            itemBuilder: (_,index){
              return controller.listOfWidget.value[index];

        }),
    )
    );
  }

}
