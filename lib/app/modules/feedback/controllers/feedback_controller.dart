import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  //TODO: Implement FeedbackController

  RxDouble rating = 0.0.obs;
  FocusNode myFocusNode=FocusNode();
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
  void requestFocus(){
    myFocusNode.requestFocus();
  }
  void closeFocus(){
    myFocusNode.dispose();
  }
void submit(){
  Get.close(1);
  Get.snackbar("Thanks", "Your review is successfully submitted",duration: Duration(milliseconds: 1500),
      snackPosition:SnackPosition.TOP,
      backgroundColor: Colors.black54,colorText: Colors.white );
}
}
