import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/modules/uni_translator/views/from_text_area.dart';
import 'package:translator/app/modules/uni_translator/views/to_text_area.dart';

import '../../../data/text_style.dart';
import '../../languages/controllers/languages_controller.dart';
import '../../languages/views/languages_view.dart';
import '../controllers/uni_translator_controller.dart';

class UniTranslatorView extends GetView<UniTranslatorController> {
  final text;
   UniTranslatorView({Key? key,this.text}) : super(key: key);
  UniTranslatorController controller=Get.put(UniTranslatorController());
  LanguagesController languagesController=Get.put(LanguagesController());
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Column(
        children:  [
          Expanded(
            flex: 1,
            child: Container(
              height: Get.height*0.1,
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
          Expanded(
              flex: 3,
              child: FromTextArea(text:text??"")),
          Expanded(
            flex: 3,
            child: GestureDetector(
                onTap: (){
                  controller.removeFocus();
                },
                child: ToTextArea()),
          ),
          Expanded(
            flex: 4,
            child: Container(
              height: Get.height*0.2,
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("Assets/images/large ad.png"),
                      // fit: BoxFit.fill
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}
