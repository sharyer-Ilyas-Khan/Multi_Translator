

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/multi_translator/views/from_text_area.dart';

import '../../../data/text_style.dart';
import '../../languages/controllers/languages_controller.dart';
import '../../languages/views/languages_view.dart';
import '../controllers/multi_translator_controller.dart';

class MultiTranslatorView extends GetView<MultiTranslatorController> {
  final ad;
   MultiTranslatorView({Key? key,this.ad}) : super(key: key);
   late ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    scrollController=ScrollController(initialScrollOffset: 0.0);
    MultiTranslatorController controller=Get.put(MultiTranslatorController());
    LanguagesController languagesController = Get.put(LanguagesController());
   return Scaffold(
        resizeToAvoidBottomInset: false,

      floatingActionButton: Obx(
          ()=> Padding(
          padding:  EdgeInsets.only(bottom: controller.listOfWidget.length==1?Get.height*0.48:Get.height*0.48,right: 12),
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
      ),

      body:Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height:65,

              width: Get.width,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(()=>LanguagesView(type: "from"));
                    },
                    child: Obx(
                          ()=> Text(
                        "${languagesController.languages
                        [languagesController.selectedFromIndex.value]
                        }",style: fromDropStyle,),
                    ),
                  ),
                  Icon(Icons.swap_horiz),
                  InkWell(
                    onTap: (){
                      Get.to(()=>LanguagesView(type: "to"));
                    },
                    child: Obx(
                          ()=> Text(
                        "${languagesController.languages
                        [languagesController.selectedToIndex.value]
                        }",style: fromDropStyle,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex:3,child: FromTextArea()),
          Obx(
                ()=>Expanded(
                  flex: controller.listOfWidget.length==1?3:7,
                  child: SizedBox(
                    height: controller.listOfWidget.length==1?Get.height*0.3:Get.height*0.5,
                    child: ListView.builder(
                    itemCount:controller.listOfWidget.length,
                    controller: scrollController,
                    addRepaintBoundaries: true,
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (_,index){
                      return controller.listOfWidget[index];
            }),
                  ),
                ),
    ),
          Obx(
                ()=>controller.listOfWidget.length<2? Expanded(
              flex: 4,
              child: Container(
                height: Get.height*0.2,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/images/large ad.png"),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ):Container(),
          ),
        ],
      )
    );
  }

}
