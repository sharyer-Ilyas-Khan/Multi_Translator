import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/dashboard/views/bottom_nav_buttons.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffoldColor,
      child: Center(
        child: Container(
          height:Get.height*0.08,
          width: Get.width*0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(color: Colors.black12,spreadRadius: 3,blurRadius: 3)
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              BottomNavButtons(icon: Icons.language,index: 0),
              BottomNavButtons(icon: Icons.mic,index: 1),
              BottomNavButtons(icon: Icons.camera_alt,index: 2),
              BottomNavButtons(icon: Icons.book,index: 3),
              BottomNavButtons(icon: Icons.language,index: 5),

            ],
          )

        ),
      ),
    );
  }
}
