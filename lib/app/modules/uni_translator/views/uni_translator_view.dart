import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/modules/uni_translator/views/from_text_area.dart';
import 'package:translator/app/modules/uni_translator/views/to_text_area.dart';

import '../controllers/uni_translator_controller.dart';

class UniTranslatorView extends GetView<UniTranslatorController> {
  final text;
   UniTranslatorView({Key? key,this.text}) : super(key: key);
  UniTranslatorController controller=Get.put(UniTranslatorController());
  @override

  Widget build(BuildContext context) {
    print(text);
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Column(
        children:  [
          FromTextArea(text:text??""),
          GestureDetector(
              onTap: (){
                controller.removeFocus();
              },
              child: ToTextArea()),
          Container(
            height: Get.height*0.2,
            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/images/small ad.png"),
                    // fit: BoxFit.fill
                )
            ),
          ),
        ],
      )
    );
  }
}
