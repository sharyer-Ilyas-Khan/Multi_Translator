import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';

import '../../../controllers/menu_items_controller.dart';
import '../../../controllers/speaker_controller.dart';
import '../../../controllers/text_font_controller.dart';
import '../../languages/views/languages_view.dart';
import '../controllers/voice_translator_controller.dart';
class ToTextArea extends StatelessWidget {
   ToTextArea({Key? key}) : super(key: key);
  ValueNotifier<bool> isDialOpen=ValueNotifier(false);
  @override
  Widget build(BuildContext context) {

    VoiceTranslatorController controller=Get.put(VoiceTranslatorController());
    MenuItemsController menuItemsController=Get.put(MenuItemsController());
    TextFontController fontController=Get.put(TextFontController());
    SpeakerController speakerController = Get.put(SpeakerController());
    return  Container(
      height: Get.height*0.26,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12,width: 0.5)
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 15,top: 12),
        child: Stack(
          children:  [
            Obx(
              ()=> SizedBox(
                height: Get.height*0.13,
                width: Get.width*0.9,
                child: SingleChildScrollView(
                  child: Text(
                    controller.translatedText.value,style:
                    controller.translatedText.value!="Translation"?fontController
                      .outputTextStyle(fontController.inputFont.value):fontController.inputTextHintStyle(fontController.inputFont.value),
                    ),
                )
              ),
            ),

            // const Padding(
            //   padding:  EdgeInsets.all(2.0),
            //   child: Text("To:",style: toTextStyle,),
            // ),
            Obx(
              ()=>  controller.translatedText.value!="Translation"?
              Positioned(
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Row(
                    children: [
                      Spacer(),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          if (speakerController.isAvailableTo.value && controller.translatedText.value!="Translation") {
                            speakerController
                                .speakTo(controller.translatedText.value);
                          } else {
                            Get.snackbar("Sorry!", "Speaker is unAvailable.",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.black54,
                                duration: Duration(milliseconds: 1500),
                                colorText: Colors.white);
                          }
                        },
                        icon: SvgPicture.asset("Assets/svg/pronouncer.svg",height: 18, ),
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          menuItemsController.shareText(
                              controller.translatedText.value.toString());

                        },
                        icon: SvgPicture.asset("Assets/svg/share.svg",height: 18,),
                        // color: Colors.black,
                        // iconSize: 20,
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          menuItemsController.copyText(
                              controller.translatedText.value.toString());
                        },
                        icon: SvgPicture.asset("Assets/svg/copy.svg",height: 18,),
                      ),

                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {

                          menuItemsController.viewFullScreen(
                              controller.translatedText.value.toString());
                        },
                        icon:SvgPicture.asset("Assets/svg/full_screen.svg",height: 18,),
                      ),

                    ],
                  )):Container(),
            ),
            // Row
            //   (
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     // Obx(
            //     //       ()=> InkWell(
            //     //     onTap: (){
            //     //       Get.to(()=>LanguagesView(type: "to",id:"voice"));
            //     //     },
            //     //     child: Container(
            //     //         width: Get.width*0.35,
            //     //         height: 40,
            //     //         decoration: BoxDecoration(
            //     //             border: Border.all(color: Colors.white,width: 1),
            //     //             borderRadius: BorderRadius.circular(25)
            //     //         ),
            //     //         child: Padding(
            //     //             padding: const EdgeInsets.only(left: 15.0,right: 10.0),
            //     //             child: Row(
            //     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //               children:  [
            //     //                 Text( languagesController.languages
            //     //                 [languagesController.selectedToIndex.value],style: toDropStyle,),
            //     //                 const RotatedBox(
            //     //                     quarterTurns: 1,
            //     //                     child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,))
            //     //               ],
            //     //             )
            //     //         )
            //     //     ),
            //     //   ),
            //     // ),
            //     // const Spacer(),
            //     // SizedBox(width: 14,),
            //     // SpeedDial(
            //     //
            //     //   buttonSize:Size(Get.width*0.1,Get.height*0.04),
            //     //   childrenButtonSize: Size(Get.width*0.1,Get.height*0.035),
            //     //   activeIcon: Icons.close,
            //     //   openCloseDial:isDialOpen,
            //     //   activeChild: Container(
            //     //       height:Get.height*0.08 ,
            //     //       width:Get.width*0.12 ,
            //     //       decoration: const BoxDecoration(
            //     //         shape: BoxShape.circle,
            //     //         color: Colors.white,
            //     //       ),
            //     //       child: const Icon(Icons.close,color: Colors.black,)),
            //     //   backgroundColor: Colors.transparent,
            //     //   // activeBackgroundColor: Colors.amber,
            //     //   overlayColor: Colors.transparent,
            //     //   renderOverlay: false,
            //     //   // overlayOpacity: 0.5,
            //     //   // spacing: Get.width*0.0,
            //     //   // spaceBetweenChildren: Get.width*0.02,
            //     //   // closeManually: false,
            //     //   childPadding: const EdgeInsets.all(0.0),
            //     //   useRotationAnimation: true,
            //     //   animationCurve:  Curves.decelerate,
            //     //   direction: SpeedDialDirection.left,
            //     //   children: [
            //     //     SpeedDialChild(
            //     //         onTap: (){
            //     //           menuItemsController.copyText(controller.translatedText.value.toString());
            //     //         },
            //     //         child: const Icon(Icons.copy,size: 13,)
            //     //     ),
            //     //     SpeedDialChild(
            //     //         onTap: (){
            //     //           menuItemsController.shareText(controller.translatedText.value.toString());
            //     //         },
            //     //         child: const Icon(Icons.share,size: 13)
            //     //     ),
            //     //     SpeedDialChild(
            //     //         onTap: (){
            //     //           isDialOpen.value=false;
            //     //           menuItemsController.viewFullScreen(controller.translatedText.value.toString());
            //     //         },
            //     //         child: const Icon(Icons.aspect_ratio,size: 13)
            //     //     ),
            //     //     SpeedDialChild(
            //     //       onTap: (){
            //     //         menuItemsController.addToFav(
            //     //             languagesController.languages[0].toString(),
            //     //             controller.inputText.value.toString(),
            //     //             languagesController.languages[languagesController.selectedToIndex.value].toString(),
            //     //             controller.translatedText.value.toString(),
            //     //             "voice"
            //     //
            //     //         );
            //     //       },
            //     //       child: const Icon(Icons.favorite,color: Colors.red,size: 18,),
            //     //     )
            //     //   ],
            //     //   child:  Container(
            //     //       height:Get.height*0.08 ,
            //     //       width:Get.width*0.12 ,
            //     //       decoration: const BoxDecoration(
            //     //         shape: BoxShape.circle,
            //     //         color: Colors.white,
            //     //       ),
            //     //       child: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
