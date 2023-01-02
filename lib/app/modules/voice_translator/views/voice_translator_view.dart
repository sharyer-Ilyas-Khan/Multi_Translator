
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/voice_translator/views/from_text_area.dart';
import 'package:translator/app/modules/voice_translator/views/to_text_area.dart';
import '../controllers/voice_translator_controller.dart';
import 'package:permission_handler/permission_handler.dart';
class VoiceTranslatorView extends GetView<VoiceTranslatorController> {
  VoiceTranslatorView({Key? key}) : super(key: key);
  stt.SpeechToText speechToText = stt.SpeechToText();
  @override
  Widget build(BuildContext context) {
    VoiceTranslatorController controller = Get.put(VoiceTranslatorController());
    LanguagesController languagesController = Get.put(LanguagesController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                FromTextArea(),
                ToTextArea(),
              ],
            ),
            Obx(
              () => Positioned(
                right: controller.audioEnabled.value?0:30,
                top: controller.audioEnabled.value?Get.height*0.19:Get.height*0.22,
                child: controller.audioEnabled.value
                    ? AvatarGlow(

                      repeat: true,
                      endRadius: 60.0,
                      showTwoGlows: true,
                      glowColor: Colors.black87,

                      child: InkWell(
                        onTap: () async {
                          controller.audioEnable(false);
                          speechToText.stop();

                        },
                        child: Container(
                          height: 70,
                          width: 60,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 3,
                                    spreadRadius: 3)
                              ]),
                          child:const  Center(
                            child: Icon(Icons.stop_circle_outlined,color: Colors.red,size: 30,)
                          ),
                        ),
                      ),
                    )
                    : Container(
                      height: 70,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3,
                                spreadRadius: 3)
                          ]),
                      child: InkWell(
                        radius:80 ,
                        onTap: () async {

                          PermissionStatus microphone;
                         microphone=await Permission.microphone.status;
                          print(microphone);
                          if(microphone.isPermanentlyDenied){
                            await openAppSettings();
                          }
                          if(microphone.isDenied){

                            microphone=await Permission.microphone.request();
                          }
                          if(microphone.isGranted){
                            bool available = await speechToText.initialize();
                            if (available) {

                              controller.audioEnable(true);
                              speechToText.listen(onResult: (value) async {
                                String recognizedText=value.recognizedWords;
                                controller.setInputText(recognizedText);
                                String translation=await controller.getTranslateUrl(languagesController.languagesPrefix[
                                languagesController.selectedFromIndex.value
                                ], languagesController.languagesPrefix[
                                languagesController.selectedToIndex.value
                                ], recognizedText);
                                controller.setText(translation);
                              },);




                            }
                          }


                        },
                        child: Center(
                          child: SvgPicture.asset(
                            "Assets/svg/voice.svg",
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
              ),
            )
          ],
        ));
  }
}
