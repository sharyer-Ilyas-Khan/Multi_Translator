import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/modules/dashboard/views/bottom_nav_buttons.dart';
class BottomNavBar extends StatelessWidget {
   BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:Get.height*0.1,
      width: Get.width,
      // color: AppColors.scaffoldColor,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            BottomNavButtons(icon:"Assets/svg/translator.svg",index: 0,text: "Translator",),
            BottomNavButtons(icon:"Assets/svg/voice.svg",index: 1,text: "Voice"),
            BottomNavButtons(icon:"Assets/svg/camera.svg",index: 2,text: "Camera"),
            BottomNavButtons(icon:"Assets/svg/diary.svg",index: 3,text: "Dictionary"),
            BottomNavButtons(icon: "Assets/svg/multitranslator.svg",index: 4,text: "Multi-Tra.."),
          ],
        ),
      ),
    );
  }

}
