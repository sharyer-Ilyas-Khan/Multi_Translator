import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/speaker_controller.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';
import 'package:translator/app/modules/uni_translator/controllers/uni_translator_controller.dart';

import '../../dictionary/controllers/dictationary_controller.dart';
import '../../image_text_translator/controllers/camera_controller.dart';
import '../../languages/controllers/languages_controller.dart';
import '../../voice_translator/controllers/voice_translator_controller.dart';

class BottomNavButtons extends StatelessWidget {
  final icon;
  final index;
   BottomNavButtons({Key? key,this.icon,this.index}) : super(key: key);
  late DashboardController controller;
  late LanguagesController languagesController;
  late UniTranslatorController uniTranslatorController;
  late MultiTranslatorController multiTranslatorController;
  late CameraControllers cameraControllers;
  late VoiceTranslatorController voiceTranslatorController;
  late  DictionaryController dictionaryController;
  late  SpeakerController speakerController;
  @override
  Widget build(BuildContext context) {
     controller=Get.put(DashboardController());
     languagesController=Get.put(LanguagesController());
     uniTranslatorController=Get.put(UniTranslatorController());
     multiTranslatorController=Get.put(MultiTranslatorController());
     cameraControllers=Get.put(CameraControllers());
     dictionaryController=Get.put(DictionaryController());
     voiceTranslatorController=Get.put(VoiceTranslatorController());
     speakerController=Get.put(SpeakerController());
    return  InkWell(
        onTap: (){
          if(index==4){
            cameraControllers.disposeCamera();
            clearUniTranslator();
            voiceTranslatorController.translatedText.value="...";
            voiceTranslatorController.audioEnabled.value=false;
            voiceTranslatorController.inputText.value="...";
            dictionaryController.inputController.value.clear();
            dictionaryController.errorText.value="";
            dictionaryController.inputText.value="";
            speakerController.isAvailableTo.value=false;
            speakerController.isAvailableFrom.value=false;

          }
          if(index==3){
            speakerController.isAvailableTo.value=false;
            speakerController.isAvailableFrom.value=false;
            cameraControllers.disposeCamera();
            multiTranslatorController.clearList();
            clearUniTranslator();
            voiceTranslatorController.translatedText.value="...";
            voiceTranslatorController.audioEnabled.value=false;
            voiceTranslatorController.inputText.value="...";
          }
          if(index==2){
            speakerController.isAvailableTo.value=false;
            speakerController.isAvailableFrom.value=false;
            cameraControllers.onInit();
            multiTranslatorController.clearList();
            clearUniTranslator();
            voiceTranslatorController.translatedText.value="...";
            voiceTranslatorController.audioEnabled.value=false;
            voiceTranslatorController.inputText.value="...";
            dictionaryController.inputController.value.clear();
            dictionaryController.errorText.value="";
            dictionaryController.inputText.value="";
          }
          if(index==1){
            speakerController.isAvailableTo.value=false;
            speakerController.isAvailableFrom.value=false;
            cameraControllers.disposeCamera();
            multiTranslatorController.clearList();
            dictionaryController.inputController.value.clear();
            dictionaryController.errorText.value="";
            dictionaryController.inputText.value="";
            clearUniTranslator();
          }
          if(index==0){
            speakerController.isAvailableTo.value=false;
            speakerController.isAvailableFrom.value=false;
            cameraControllers.disposeCamera();
            multiTranslatorController.clearList();
            voiceTranslatorController.translatedText.value="...";
            voiceTranslatorController.audioEnabled.value=false;
            voiceTranslatorController.inputText.value="...";
            dictionaryController.inputController.value.clear();
            dictionaryController.errorText.value="";
            dictionaryController.inputText.value="";
          }

            controller.selectedOption(index);

        },
        child: Obx(()=> Container(
            height:Get.height*0.1,
            width: Get.width*0.13,
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
void clearUniTranslator(){
  uniTranslatorController.translatedText.value="...";
  uniTranslatorController.textContent="";
  languagesController.selectedFromIndex.value=0;
  languagesController.selectedToIndex.value=0;
  controller.extractedText.value="";
}

}
