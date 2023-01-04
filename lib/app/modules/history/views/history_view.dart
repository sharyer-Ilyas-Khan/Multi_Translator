import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/favourit/views/tabs/uni_translation_favourit_view.dart';
import 'package:translator/app/modules/history/views/multi_translation_history_view.dart';
import 'package:translator/app/modules/history/views/uni_translation_history_view.dart';
import 'package:translator/app/modules/history/views/voice_translation_history_view.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryView',style: appBar,),
        iconTheme: IconThemeData(
          color: AppColors.appBarIconColor
        ),
        centerTitle: true,
        elevation: 5.0,

        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: controller.tabController,
          indicatorColor: AppColors.primaryColor,
          tabs: [
            Padding(
              padding: EdgeInsets.all(10.0),

              child: Text("Single",style: tabBar,),
            ),
            Text("Voice",style: tabBar,),
            Text("Multi",style: tabBar,),
          ],
        ),
      ),
      body:TabBarView(
        controller: controller.tabController,
        children: const [
         UniTranslationHistoryView(),
          VoiceTranslationHistoryView(),
         MultiTranslationHistoryView()
        ],
      )
    );
  }
}
