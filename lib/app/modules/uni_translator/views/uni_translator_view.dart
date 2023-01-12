import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:translator/app/modules/uni_translator/views/from_text_area.dart';
import 'package:translator/app/modules/uni_translator/views/to_text_area.dart';

import '../../../data/text_style.dart';
import '../../darwer/views/darwer_view.dart';
import '../../languages/controllers/languages_controller.dart';
import '../../languages/views/languages_view.dart';
import '../controllers/uni_translator_controller.dart';

class UniTranslatorView extends GetView<UniTranslatorController> {
  final text;
   UniTranslatorView({Key? key,this.text}) : super(key: key);

  LanguagesController languagesController=Get.put(LanguagesController());
  @override

  Widget build(BuildContext context) {
    UniTranslatorController controller=Get.put(UniTranslatorController());
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
          InkWell(
            onTap: (){
              Get.to(()=>DarwerView(),transition:Transition.zoom,duration: const Duration(milliseconds: 400));
            },
            child: Container(
              height: Get.height*0.05,
              width: Get.width*0.9,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                   Text(
                    "Preferences",style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                      fontSize: 12
                  ),
                  ),
                  SizedBox(width: 10,),
                  Icon(Icons.settings,color: Colors.grey,size: 20,),

                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: controller.isNativeLoaded.value?Container(
              height: Get.height*0.24,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black

                  )
                ]
              ),
              child: AdWidget(
                ad: controller.nativeAd!,
              ),
            ):Container(),
          ),
        ],
      )
    );
  }
}
