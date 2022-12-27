import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/dashboard/views/bottom_nav_buttons.dart';
class BottomNavBar extends StatelessWidget {
   BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffoldColor,
      child: Center(
        child: Container(
          height:Get.height*0.08,
          width: Get.width*0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(color: Colors.black12,spreadRadius: 3,blurRadius: 3)
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              BottomNavButtons(icon:"Assets/svg/translator.svg",index: 0),
              BottomNavButtons(icon:"Assets/svg/voice.svg",index: 1),
              BottomNavButtons(icon:"Assets/svg/camera.svg",index: 2),
              BottomNavButtons(icon:"Assets/svg/diary.svg",index: 3),
              BottomNavButtons(icon: "Assets/svg/multitranslator.svg",index: 4),
            ],
          )
        ),
      ),
    );
  }

}
