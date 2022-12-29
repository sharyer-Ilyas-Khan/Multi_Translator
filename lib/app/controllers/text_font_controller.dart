import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFontController extends GetxController {
 RxDouble inputFont=40.0.obs;
 RxDouble outputFont=40.0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setInputTextFont(font){
    inputFont.value=font;
  }
  TextStyle inputTextStyle(font){
    return TextStyle(
        fontSize: font,
        color:Colors.black87,
        fontFamily: "robor",
        fontWeight: FontWeight.w900,
        letterSpacing: 0.0
    );
  }
  void setOutputTextFont(font){
outputFont.value=font;
  }
  TextStyle outputTextStyle(font){
    return TextStyle(
        fontSize: font,
        color:Colors.white,
        fontFamily: "robor",
        fontWeight: FontWeight.w900,
        letterSpacing: 1.0
    );
  }

}
