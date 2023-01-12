import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/voice_translator/controllers/voice_translator_controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../controllers/menu_items_controller.dart';
import '../../../controllers/speaker_controller.dart';
import '../../../controllers/text_font_controller.dart';

class FromTextArea extends StatelessWidget {
  const FromTextArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController = Get.put(LanguagesController());
    VoiceTranslatorController controller = Get.put(VoiceTranslatorController());
    TextFontController fontController = Get.put(TextFontController());
    stt.SpeechToText speechToText = stt.SpeechToText();
    SpeakerController speakerController = Get.put(SpeakerController());
    MenuItemsController menuItemsController=Get.put(MenuItemsController());
    return Container(
      height: Get.height * 0.26,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 0.5)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 5),
        child: Stack(
          children: [
            Obx(
              () => SizedBox(
                  height: Get.height * 0.13,
                  width: Get.width * 0.8,
                  child: SingleChildScrollView(
                    child: Text(
                      controller.inputText.value,
                      style: controller.inputText.value != "Speak"
                          ? fontController
                              .inputTextStyle(fontController.inputFont.value)
                          : fontController.inputTextHintStyle(
                              fontController.inputFont.value),
                    ),
                  )),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                left: 1.5,
                child: Row(
                  children: [
                    Obx(
                      ()=> controller.audioEnabled.value==false
                          ? InkWell(
                              onTap: () async {
                                bool available = await speechToText.initialize();
                                bool permissionAvailable =
                                    await speechToText.hasPermission;
                                print(permissionAvailable);
                                if (permissionAvailable || available) {
                                  if (available) {
                                    controller.audioEnable(true);
                                    speechToText.listen(
                                      onResult: (value) async {
                                        String recognizedText =
                                            value.recognizedWords;
                                        controller.setInputText(recognizedText);
                                        String translation =
                                            await controller.getTranslateUrl(
                                                languagesController
                                                        .languagesPrefix[
                                                    languagesController
                                                        .selectedFromIndex.value],
                                                languagesController
                                                        .languagesPrefix[
                                                    languagesController
                                                        .selectedToIndex.value],
                                                recognizedText);
                                        controller.setText(translation);
                                      },
                                    );
                                  }
                                } else {
                                  PermissionStatus speech =
                                      await Permission.speech.request();
                                  if (speech.isPermanentlyDenied) {
                                    await openAppSettings();
                                  }
                                }
                                // menuItemsController.addToFav(
                                //     languagesController.languages[
                                //     languagesController.selectedFromIndex.value]
                                //         .toString(),
                                //     uniController.textContent.toString(),
                                //     languagesController.languages[
                                //     languagesController.selectedToIndex.value]
                                //         .toString(),
                                //     uniController.translatedText.value.toString(),
                                //     "uni");
                              },
                              child: SvgPicture.asset(
                                "Assets/svg/voice.svg",
                                color: Colors.black,
                              ),
                            )
                          : InkWell(
                              onTap: () async {
                                controller.audioEnable(false);
                                speechToText.stop();
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                   ),
                                child: const Center(
                                    child: Icon(
                                  Icons.stop,
                                  color: Colors.white,
                                  size: 25,
                                )),
                              ),
                            ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     // if(speakerController.isAvailableFrom.value){
                    //     //   inputText!=""?speakerController.speakFrom(inputText):speakerController.speakFrom(text);
                    //     //
                    //     // }else{
                    //     //   Get.snackbar("Sorry!", "Speaker is unAvailable.",snackPosition:SnackPosition.TOP,
                    //     //       backgroundColor: Colors.black54,colorText: Colors.white );
                    //     // }
                    //   },
                    //   icon: SvgPicture.asset(
                    //     "Assets/svg/pronouncer.svg",
                    //   ),
                    // ),

                    Spacer(),
                    Obx(
                      ()=> IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          if(controller.inputText.value!="Speak"){
                            speakerController.speakFrom(controller.inputText.value);

                          }else{
                            Get.snackbar("Sorry!", "Speaker is unAvailable.",snackPosition:SnackPosition.TOP,
                                backgroundColor: Colors.black54,colorText: Colors.white );
                          }
                        },
                        icon: controller.inputText.value!="Speak"?SvgPicture.asset(
                          "Assets/svg/pronouncer.svg",
                          height: 18,
                        ):SvgPicture.asset(
                          "Assets/svg/pronouncer.svg",color: Colors.white,
                          height: 18,
                        ),
                      ),
                    ),
                    IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          menuItemsController.viewFullScreen(
                              controller.translatedText.value.toString());
                        },
                        icon: SvgPicture.asset("Assets/svg/full_screen.svg",height: 18,)),
                  ],
                )),
            Obx(
                  ()=> controller.translatedText.value!="Translation"?Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: (){
                      controller.inputText.value="Speak";
                      controller.translatedText.value="Translation";
                      speakerController.isAvailableFrom.value=false;
                    },
                    icon: Icon(Icons.close,color: Colors.black45,size: 18,),
                  )):Container(),
            ),
          ],
        ),
      ),
    );
  }
}
