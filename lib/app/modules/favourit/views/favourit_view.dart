import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/favourit/views/multi_translation_favourit_view.dart';
import 'package:translator/app/modules/favourit/views/uni_translation_favourit_view.dart';
import 'package:translator/app/modules/favourit/views/voice_translation_favourit_view.dart';
import '../../../data/color_code.dart';
import '../controllers/favourit_controller.dart';

class FavouriteView extends GetView<FavouritController> {
   const FavouriteView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: AppColors.appBarIconColor
        ),
        title: const Text('Favourite Translation',style: appBar,),

        bottom: TabBar(
          controller: controller.tabController,
          indicatorColor: AppColors.primaryColor,
          tabs: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Single",style: tabBar,),
            ),
            Text("Voice",style: tabBar,),
            Text("Multi",style: tabBar,),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          UniTranslationFavouritView(),
          VoiceTranslationFavouritView(),
          MultiTranslationFavouritView()
        ],
      )
    );
  }
}
