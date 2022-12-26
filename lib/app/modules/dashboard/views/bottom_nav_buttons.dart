import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';

import '../../multi_translator/views/from_text_area.dart';
import '../../multi_translator/views/to_text_area.dart';
class BottomNavButtons extends StatelessWidget {
  final icon;
  final index;
  const BottomNavButtons({Key? key,this.icon,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller=Get.put(DashboardController());
    MultiTranslatorController multiTranslatorController=Get.put(MultiTranslatorController());
    return  InkWell(
        onTap: (){
          if(index==4){
            multiTranslatorController.clearList();
          }
            controller.selectedOption(index);

        },
        child: Obx(()=> Container(
            height:60,
            width: 60,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: controller.selectedIndex.value==index?
              AppColors.secondaryColor:Colors.transparent
            ),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
        ),
    );
  }
}
