
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/darwer/views/darwer_view.dart';
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
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Obx(()=> Text(title[controller.selectedIndex.value],style:appBar,)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
              Get.to(()=>const DarwerView(),
                  transition: Transition.fadeIn
              );
          },
         child:  Padding(
           padding: const EdgeInsets.all(15.0),
           child: SvgPicture.asset("Assets/svg/nevigationbar.svg"),
         )
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.settings,color: AppColors.appBarIconColor,),
          ),
        ],
      ),
      body: Stack(

        children: [
          ///Screens toggle
          Obx(
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
          // /// ads container
          // Expanded(
          //     flex:2,
          //     child:
          //     Container(color: Colors.white,
          //     child: const Center(child: Text("AD"),),)),
          ///bottom nav bar
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: Get.height*0.14,
              width: Get.width,
              child:  BottomNavBar(),
            ),
          ),
        ],
      ),
    );
  }
}
