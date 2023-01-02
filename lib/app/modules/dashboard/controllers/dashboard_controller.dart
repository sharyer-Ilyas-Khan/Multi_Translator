import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final  selectedIndex = 0.obs;
  final  extractedText = "".obs;
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

 void selectedOption(index){
    selectedIndex.value=index;
 }
 void setText(text){
    extractedText.value=text;
 }
 void showExitDialog(){
    Get.defaultDialog(
      title: "Warning",
      content: Column(
        children: [
          Text("Are you sure to quit")
        ],
      ),
      actions: [
        TextButton(onPressed: (){
          if(GetPlatform.isIOS){
            exit(1);
          }
          else{
            SystemNavigator.pop();
          }
        }, child: Text("Yes",style: TextStyle(color: Colors.grey.shade500),)),
        TextButton(onPressed: (){
          Get.close(1);
        }, child: Text("No")),
      ]
    );
 }
}
