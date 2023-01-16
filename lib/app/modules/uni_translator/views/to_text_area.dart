import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/menu_items_controller.dart';
import 'package:translator/app/controllers/text_font_controller.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';

import '../../../controllers/speaker_controller.dart';
import '../../languages/views/languages_view.dart';
import '../controllers/uni_translator_controller.dart';

class ToTextArea extends StatelessWidget {
  ToTextArea({Key? key}) : super(key: key);
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController = Get.find<LanguagesController>();
    UniTranslatorController uniController = Get.put(UniTranslatorController());
    MenuItemsController menuItemsController = Get.put(MenuItemsController());
    TextFontController fontController = Get.put(TextFontController());
    SpeakerController speakerController = Get.put(SpeakerController());
    uniController.translatedText.value != "Translation"
        ? speakerController.checkAvailableTo(languagesController
            .languagesPrefix[languagesController.selectedToIndex.value])
        : {};
    return Container(
      height: Get.height * 0.26,
      width: Get.width,

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12,width: 0.5)
      ),
      child: Padding(
        padding: EdgeInsets.only(left:15, top: 10, right: 0),
        child: Stack(
          children: [
            Obx(
              () => SizedBox(
                  height: Get.height * 0.13,
                  width: Get.width * 0.8,
                  child: SingleChildScrollView(
                    child: Text(
                      uniController.translatedText.value,
                      style: uniController.translatedText.value!="Translation"?fontController
                          .outputTextStyle(fontController.inputFont.value):fontController.inputTextHintStyle(fontController.inputFont.value),
                    ),
                  )),
            ),
            Obx(
              ()=> uniController.translatedText.value!="Translation"?
              Positioned(
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Row(
                    children: [
                     SvgPicture.asset("Assets/svg/verified.svg",height: 12,),
                      Spacer(),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          menuItemsController.shareText(
                              uniController.translatedText.value.toString());

                        },
                        icon: SvgPicture.asset("Assets/svg/share.svg",height: 18,),
                        // color: Colors.black,
                        // iconSize: 20,
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          menuItemsController.copyText(
                              uniController.translatedText.value.toString());
                        },
                        icon: SvgPicture.asset("Assets/svg/copy.svg",height: 18,),
                      ),
                  Obx(
                    ()=> IconButton(
                      splashColor: Colors.transparent,
                              onPressed: () {
                                if (speakerController.isAvailableTo.value && uniController.translatedText.value!="Translation") {
                                  speakerController
                                      .speakTo(uniController.translatedText.value);
                                } else {
                                  Get.snackbar("Sorry!", "Speaker is unAvailable.",
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: Colors.black54,
                                      duration: Duration(milliseconds: 1500),
                                      colorText: Colors.white);
                                }
                              },
                              icon: SvgPicture.asset("Assets/svg/pronouncer.svg",height: 18,
                                  color:speakerController.isAvailableFrom.value && uniController.translatedText.value!="Translation"?
                                  Colors.black:Colors.grey  ),
                            ),
                  ),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          menuItemsController.viewFullScreen(
                              uniController.translatedText.value.toString());
                        },
                        icon:SvgPicture.asset("Assets/svg/full_screen.svg",height: 18,),
                      ),

                    ],
                  )):Container(),
            ),
          ],
        ),
      ),
    );
  }
}
