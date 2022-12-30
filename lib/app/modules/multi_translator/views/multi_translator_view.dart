import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/multi_translator/views/from_text_area.dart';
import 'package:translator/app/modules/multi_translator/views/to_text_area.dart';

import '../controllers/multi_translator_controller.dart';

class MultiTranslatorView extends GetView<MultiTranslatorController> {
  final ad;
   MultiTranslatorView({Key? key,this.ad}) : super(key: key);
   late ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    scrollController=ScrollController(initialScrollOffset: 0.0);
    MultiTranslatorController controller=Get.put(MultiTranslatorController());
   return Scaffold(
        resizeToAvoidBottomInset: false,

      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: ad?Get.height*0.55:Get.height*0.55,right: 10),
        child: FloatingActionButton(

          onPressed: (){
            controller.addPrefix();
            controller.addLang();
            controller.addIntoTranslation();
            controller.addIntoList();
            scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);

          },
          elevation: 10,
          backgroundColor: Colors.white,
          child: const Center(
            child: Icon(Icons.add,color: AppColors.primaryColor,),
          ),
        ),
      ),

      body:Obx(
            ()=>SizedBox(
              height: Get.height*0.76,
              child: ListView.builder(
              itemCount:controller.listOfWidget.length,
              controller: scrollController,
              addRepaintBoundaries: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (_,index){

                  return controller.listOfWidget[index];


        }),
            ),
    )
    );
  }

}
