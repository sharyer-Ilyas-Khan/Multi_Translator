import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
class BottomNavButtons extends StatelessWidget {
  final icon;
  final index;
  const BottomNavButtons({Key? key,this.icon,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller=DashboardController();
    return Obx(
      ()=> InkWell(
        onTap: (){
          controller.selectedOption(index);
        },
        child: Container(
          height:60,
          width: 60,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: controller.selectedIndex.value==index?
            AppColors.secondaryColor:Colors.transparent
          ),
          child: Center(
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
