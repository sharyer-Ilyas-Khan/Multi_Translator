

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/languages/views/checkLanguageView.dart';
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
      body:Column(
        children: [
          FromTextArea(),
          Padding(
            padding: const EdgeInsets.only(top: 6.0,bottom: 6),
            child: Container(
              height: Get.height*0.085,
              width: Get.width,

              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5)
              ),
              child: ListTile(
                minVerticalPadding: 7,
                dense: false,
                title: Text("Translation lnaguage's"),
                trailing: IconButton(
                  onPressed: (){
                    Get.to(LanguagesCheckView());
                    // controller.addPrefix();
                    //         controller.addLang();
                    //         controller.addIntoTranslation();
                    //         controller.addIntoList();
                    //         scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
                    //
                  },
                  icon: Icon(Icons.add,color: AppColors.primaryColor,size: 30,),
                ),
                subtitle: Obx(
                  ()=> ListView.builder(
                        scrollDirection: Axis.horizontal,
                      itemCount: controller.listOfLang.length,
                      itemBuilder: (_,index){
                        return controller.listOfLang[index]!=""?Padding(
                          padding:  EdgeInsets.only(bottom:Get.height*0.045,right: 2.5,left: 2.5,top:Get.height*0.015 ),
                          child: Container(
                            width: Get.width*0.2,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                             color: Colors.grey.shade200
                           ),
                            child: Center(
                              child: Text(controller.listOfLang[index],overflow: TextOverflow.ellipsis,),
                            ),
                          ),
                        ):Container();

                  }),
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     InkWell(
              //       onTap: (){
              //         Get.to(()=>LanguagesView(type: "from"));
              //       },
              //       child: Obx(
              //             ()=> Row(
              //           children: [
              //             Text(
              //               "${languagesController.languages
              //               [languagesController.selectedFromIndex.value]
              //               }",style: fromDropStyle,),
              //             Icon(Icons.arrow_drop_down,color: AppColors.primaryColor,)
              //           ],
              //         ),
              //       ),
              //     ),
              //     Icon(Icons.swap_horiz),
              //     InkWell(
              //       onTap: (){
              //         Get.to(()=>LanguagesView(type: "to"));
              //       },
              //       child: Obx(
              //             ()=> Row(
              //           children: [
              //             Text(
              //               "${languagesController.languages
              //               [languagesController.selectedToIndex.value]
              //               }",style: fromDropStyle,),
              //             Icon(Icons.arrow_drop_down,color: AppColors.primaryColor,)
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
          Obx(
                ()=>controller.showList.value?Expanded(
                  flex: 3,
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
                ):Container(),
    ),
        ],
      )
    );
  }

}
