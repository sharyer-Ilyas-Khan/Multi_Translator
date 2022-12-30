import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/clear_controller.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';

import '../../image_text_translator/controllers/camera_controller.dart';
import '../../voice_translator/controllers/voice_translator_controller.dart';

class BottomNavButtons extends StatelessWidget {
  final icon;
  final index;
   BottomNavButtons({Key? key,this.icon,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller=Get.put(DashboardController());
    UniTranslatorController uniTranslatorController=Get.put(UniTranslatorController());
    MultiTranslatorController multiTranslatorController=Get.put(MultiTranslatorController());
    CameraControllers cameraControllers=Get.put(CameraControllers());
    VoiceTranslatorController voiceTranslatorController=Get.put(VoiceTranslatorController());
    return  InkWell(
        onTap: (){
          if(index==4){
            cameraControllers.disposeCamera();
            multiTranslatorController.clearList();
          }
          if(index==3){
            cameraControllers.disposeCamera();
          }
          if(index==2){
            cameraControllers.onInit();
          }
          if(index==1){
            cameraControllers.disposeCamera();
          }
          if(index==0){
            cameraControllers.disposeCamera();
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
