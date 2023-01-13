
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/voice_translator/views/from_text_area.dart';
import 'package:translator/app/modules/voice_translator/views/to_text_area.dart';
import '../../../data/text_style.dart';
import '../../darwer/views/darwer_view.dart';
import '../../languages/views/languages_view.dart';
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
                Expanded(
                  flex: 1,
                  child: Container(
                    height: Get.height*0.1,
                    width: Get.width,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(()=>LanguagesView(type: "from"));
                          },
                          child: Obx(
                                ()=> Row(
                                  children: [
                                    Text(
                              "${languagesController.languages
                              [languagesController.selectedFromIndex.value]
                              }",style: fromDropStyle,),
                                    Icon(Icons.arrow_drop_down,color: AppColors.primaryColor,)
                                  ],
                                ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            controller.swipe();
                            int newIndex=languagesController.selectedFromIndex.value;
                            languagesController.selectedFromIndex.value=languagesController.selectedToIndex.value;
                            languagesController.selectedToIndex.value=newIndex;

                          },
                            child: Icon(Icons.swap_horiz)),
                        InkWell(
                          onTap: (){
                            Get.to(()=>LanguagesView(type: "to"));
                          },
                          child: Obx(
                                ()=> Row(
                                  children: [
                                    Text(
                              "${languagesController.languages
                              [languagesController.selectedToIndex.value]
                              }",style: fromDropStyle,),
                                    Icon(Icons.arrow_drop_down,color: AppColors.primaryColor,)
                                  ],
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded( flex: 3,child: FromTextArea()),
                Expanded( flex: 3,child: ToTextArea()),
                Padding(
                  padding:  EdgeInsets.only(left: Get.width*0.7,right: 15),
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: (){
                      Get.to(()=>DarwerView(),transition:Transition.fade,duration: const Duration(milliseconds: 400));
                    },
                    child: Container(
                      height: Get.height*0.05,
                      width: Get.width*0.9,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Preferences",style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black54,
                              fontSize: 12
                          ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.settings,color: Colors.grey,size: 20,),

                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: controller.isNativeLoaded.value?Container(
                    height: Get.height*0.24,
                    width: Get.width,
                   child: AdWidget(
                     ad: controller.nativeAd!,
                   ),
                  ):Container(),
                ),
              ],
            ),
            // Obx(
            //   () => Positioned(
            //     right: controller.audioEnabled.value?0:30,
            //     top: controller.audioEnabled.value?Get.height*0.23:Get.height*0.26,
            //     child: controller.audioEnabled.value
            //         ? AvatarGlow(
            //
            //           repeat: true,
            //           endRadius: 60.0,
            //           showTwoGlows: true,
            //           glowColor: Colors.black87,
            //
            //           child: InkWell(
            //             onTap: () async {
            //               controller.audioEnable(false);
            //               speechToText.stop();
            //
            //             },
            //             child: Container(
            //               height: 70,
            //               width: 60,
            //               decoration: const BoxDecoration(
            //                   color: Colors.white,
            //                   shape: BoxShape.circle,
            //                   boxShadow: [
            //                     BoxShadow(
            //                         color: Colors.black12,
            //                         blurRadius: 3,
            //                         spreadRadius: 3)
            //                   ]),
            //               child:const  Center(
            //                 child: Icon(Icons.stop_circle_outlined,color: Colors.red,size: 30,)
            //               ),
            //             ),
            //           ),
            //         )
            //         : Container(
            //           height: 70,
            //           width: 60,
            //           decoration: const BoxDecoration(
            //               color: Colors.white,
            //               shape: BoxShape.circle,
            //               boxShadow: [
            //                 BoxShadow(
            //                     color: Colors.black12,
            //                     blurRadius: 3,
            //                     spreadRadius: 3)
            //               ]),
            //           child: InkWell(
            //             radius:80 ,
            //             onTap: () async {
            //               bool available = await speechToText.initialize();
            //                 bool permissionAvailable = await speechToText.hasPermission;
            //                 print(permissionAvailable);
            //                 if (permissionAvailable || available) {
            //                   if(available){
            //                       controller.audioEnable(true);
            //                       speechToText.listen(onResult: (value) async {
            //                       String recognizedText=value.recognizedWords;
            //                       controller.setInputText(recognizedText);
            //                       String translation=await controller.getTranslateUrl(languagesController.languagesPrefix[
            //                       languagesController.selectedFromIndex.value
            //                       ], languagesController.languagesPrefix[
            //                       languagesController.selectedToIndex.value
            //                       ], recognizedText);
            //                       controller.setText(translation);
            //                       },);
            //                   }
            //                 }
            //                   else{
            //                     PermissionStatus speech=await Permission.speech.request();
            //                     if(speech.isPermanentlyDenied){
            //                       await openAppSettings();
            //                     }
            //
            //                 }
            //
            //
            //
            //
            //             },
            //             child: Center(
            //               child: SvgPicture.asset(
            //                 "Assets/svg/voice.svg",
            //                 color: AppColors.primaryColor,
            //               ),
            //             ),
            //           ),
            //         ),
            //   ),
            // )
          ],
        ));
  }
}
