import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/dashboard/views/bottom_nav_bar.dart';
import 'package:translator/app/modules/dictationary/views/dictationary_view.dart';
import 'package:translator/app/modules/image_text_translator/views/image_text_translator_view.dart';
import 'package:translator/app/modules/multi_translator/views/multi_translator_view.dart';
import 'package:translator/app/modules/uni_translator/views/uni_translator_view.dart';
import 'package:translator/app/modules/voice_translator/views/voice_translator_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      DashboardController controller=Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Translator',style:appBar,),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            
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
      body: Column(
        
        children: [
          ///Screens toggle
          Expanded(
              flex: 4,
              child:
              Obx(
                ()=> IndexedStack(
                  index: controller.selectedIndex.value,
                  children: const [
                    UniTranslatorView(),
                    VoiceTranslatorView(),
                    ImageTextTranslatorView(),
                    DictationaryView(),
                    MultiTranslatorView()
                  ],
                ),
              )),
          /// ads container
          Expanded(
              flex:2,
              child:
              Container(color: Colors.amber,
              child: Center(child: Text("AD"),),)),
          ///bottom nav bar
           Expanded( child:BottomNavBar()),

        ],
      ),
    );
  }
}
