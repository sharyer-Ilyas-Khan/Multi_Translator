
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/modules/dashboard/views/bottom_nav_bar.dart';
import 'package:translator/app/modules/image_text_translator/views/image_text_translator_view.dart';
import 'package:translator/app/modules/multi_translator/views/multi_translator_view.dart';
import 'package:translator/app/modules/uni_translator/views/uni_translator_view.dart';
import 'package:translator/app/modules/voice_translator/views/voice_translator_view.dart';

import '../../dictionary/views/dictionary_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final text;
   DashboardView({Key? key,this.text}) : super(key: key);
  List title=["Translator","Voice Translator","Image Translator","Dictionary","Multi Translator"];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        controller.showExitDialog();
        return Future(() => false);
      },
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavBar(),
        body: SafeArea(
          child: Obx(
            ()=> IndexedStack(
              index: controller.selectedIndex.value,
              children:  [
                 UniTranslatorView(text:controller.extractedText.value??""),
                 VoiceTranslatorView(),
                  const ImageTextTranslatorView(),
                const DictionaryView(),
                MultiTranslatorView(ad:true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
