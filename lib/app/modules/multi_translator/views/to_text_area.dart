import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/text_font_controller.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';

import '../../../controllers/menu_items_controller.dart';
import '../../../controllers/speaker_controller.dart';
import '../../languages/views/languages_view.dart';
import '../controllers/multi_translator_controller.dart';

class ToTextArea extends StatelessWidget {
  final id;
  ToTextArea({Key? key, required this.id}) : super(key: key);
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController = Get.put(LanguagesController());
    MultiTranslatorController multiController =
        Get.put(MultiTranslatorController());
    MenuItemsController menuItemsController = Get.put(MenuItemsController());
    TextFontController fontController = Get.put(TextFontController());
    SpeakerController speakerController = Get.put(SpeakerController());
    return id == "zero"
        ? Container()
        : GestureDetector(
            onTap: () {
              multiController.removeFocus();
            },
            child: Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 6)
              ]),
              child: SwipeActionCell(
                key: ObjectKey(id),
                trailingActions: <SwipeAction>[
                  SwipeAction(
                      onTap: (CompletionHandler handler) async {
                        multiController.listOfWidget[id] =
                            ToTextArea(id: "zero");
                        multiController.listOfTranslation[id] = "";
                        multiController.listOfLang[id] = "";
                        multiController.listOfPrefix[id] = "";
                      },
                      // performsFirstActionWithFullSwipe: true,
                      widthSpace: Get.width * 0.4,
                      icon: SizedBox(
                        width: Get.width * 0.26,
                        height: Get.height * 0.1,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.delete_forever,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  "Delete",
                                  style: delete,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      color: Colors.red.shade700),
                ],
                child: Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12, width: 0.5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          child: Obx(
                            () => InkWell(
                              onTap: () {
                                Get.to(() => LanguagesView(type: "to", id: id));
                              },
                              child: Container(
                                  width: Get.width * 0.45,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Spacer(),
                                          Text(
                                            "To:",
                                            style: fromHintStyle,
                                          ),
                                          Spacer(),
                                          Text(
                                            "${multiController.listOfLang[id]}",
                                            style: toDropStyle,
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.blue,
                                            size: 25,
                                          ),
                                          Spacer(),
                                        ],
                                      ))),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          child: Obx(
                            () => SizedBox(
                                height: Get.height * 0.13,
                                width: Get.width * 0.8,
                                child: SingleChildScrollView(
                                  child: Text(
                                    multiController.listOfTranslation[id],
                                    style:
                                        multiController.listOfTranslation[id] !=
                                                "Translation"
                                            ? fontController.outputTextStyle(
                                                fontController.inputFont.value)
                                            : fontController.inputTextHintStyle(
                                                fontController.inputFont.value),
                                  ),
                                )),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          width: Get.width,
                          child: Row(
                            children: [
                              Spacer(),
                              IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  menuItemsController.shareText(multiController
                                      .listOfTranslation[id]
                                      .toString());
                                },
                                icon: SvgPicture.asset("Assets/svg/share.svg",
                                    height: 15),
                                // color: Colors.black,
                                // iconSize: 20,
                              ),
                              IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  menuItemsController.copyText(multiController
                                      .listOfTranslation[id]
                                      .toString());
                                  //
                                },
                                icon: SvgPicture.asset("Assets/svg/copy.svg",
                                    height: 15),
                              ),
                              IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  if (multiController.listOfTranslation[id] !=
                                      "Translation") {
                                    speakerController.speakTo(
                                        multiController.listOfTranslation[id]);
                                  } else {
                                    Get.snackbar(
                                        "Sorry!", "Speaker is unAvailable.",
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.black54,
                                        colorText: Colors.white);
                                  }
                                },
                                icon: SvgPicture.asset(
                                    "Assets/svg/pronouncer.svg",
                                    height: 15),
                              ),
                              IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  menuItemsController.viewFullScreen(
                                      multiController.listOfTranslation[id]
                                          .toString());
                                },
                                icon: SvgPicture.asset(
                                    "Assets/svg/full_screen.svg",
                                    height: 15),
                              ),
                              // SizedBox(width: 14,),
                              // SpeedDial(
                              //
                              //   buttonSize:Size(Get.width*0.1,Get.height*0.04),
                              //   childrenButtonSize: Size(Get.width*0.1,Get.height*0.035),
                              //   activeIcon: Icons.close,
                              //   openCloseDial:isDialOpen,
                              //   activeChild: Container(
                              //       height:Get.height*0.08 ,
                              //       width:Get.width*0.12 ,
                              //       decoration: const BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         color: Colors.white,
                              //       ),
                              //       child: const Icon(Icons.close,color: Colors.black,)),
                              //   backgroundColor: Colors.transparent,
                              //   // activeBackgroundColor: Colors.amber,
                              //   overlayColor: Colors.transparent,
                              //   renderOverlay: false,
                              //   // overlayOpacity: 0.5,
                              //   // spacing: Get.width*0.0,
                              //   // spaceBetweenChildren: Get.width*0.02,
                              //   // closeManually: false,
                              //   childPadding: const EdgeInsets.all(0.0),
                              //   useRotationAnimation: true,
                              //   animationCurve:  Curves.decelerate,
                              //   direction: SpeedDialDirection.left,
                              //   children: [
                              //     SpeedDialChild(
                              //         onTap: (){
                              //           menuItemsController.copyText(multiController.listOfTranslation[id].toString());
                              //         },
                              //         child: const Icon(Icons.copy,size: 13,)
                              //     ),
                              //     SpeedDialChild(
                              //         onTap: (){
                              //           menuItemsController.shareText(multiController.listOfTranslation[id].toString());
                              //         },
                              //         child: const Icon(Icons.share,size: 13)
                              //     ),
                              //     SpeedDialChild(
                              //         onTap: (){
                              //           isDialOpen.value=false;
                              //           menuItemsController.viewFullScreen(multiController.listOfTranslation[id].toString());
                              //         },
                              //         child: const Icon(Icons.aspect_ratio,size: 13)
                              //     ),
                              //     SpeedDialChild(
                              //       onTap: (){
                              //         menuItemsController.addToFav(
                              //             languagesController.languages[languagesController.selectedFromIndex.value].toString(),
                              //             multiController.textContent.toString(),
                              //             multiController.listOfLang.toList(),
                              //             multiController.listOfTranslation.toList(),
                              //             "multi"
                              //
                              //         );
                              //       },
                              //       child: const Icon(Icons.favorite,color: Colors.red,size: 18,),
                              //     )
                              //   ],
                              //   child:  Container(
                              //       height:Get.height*0.08 ,
                              //       width:Get.width*0.12 ,
                              //       decoration: const BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         color: Colors.white,
                              //       ),
                              //       child: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
