import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';

class MenuItemsController extends GetxController {
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
void copyText(text){
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar("Success", "Your text is successfully copied",snackPosition:SnackPosition.TOP,
        backgroundColor: Colors.black54,colorText: Colors.white );
}
void shareText(text){
    Share.share(text);
}
void addToFav(text){
  Get.snackbar("Success", "Your text is successfully added to favourite",snackPosition:SnackPosition.TOP,
      backgroundColor: Colors.black54,colorText: Colors.white );
}
void viewFullScreen(text){
    print(text);
Get.defaultDialog(
  title: "Translated Text",
radius: 10,
content: Container(
  height: Get.height*0.4,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    // border: Border.all(color: AppColors.primaryColor,width: 1),
  ),
  child:   Padding(
    padding: const EdgeInsets.all(10.0),
    child:   SingleChildScrollView(
        child: Text(text,softWrap: true,style: textFullScreenStyle,)),
  ),
)
);
}

}
