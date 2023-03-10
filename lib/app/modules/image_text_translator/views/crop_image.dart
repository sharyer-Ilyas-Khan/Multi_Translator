import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/image_text_translator/controllers/image_text_translator_controller.dart';

class CropImage extends StatelessWidget {
  final file;

  CropImage({Key? key, this.file}) : super(key: key);
  late ImageTextTranslatorController controller;
  @override
  Widget build(BuildContext context) {
    controller = Get.put(ImageTextTranslatorController());
    controller.cropImage(File(file.path));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.grey.shade700),
        title: const Text(
          "Translate Image",
          style: appBar,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: controller.file.value.path != ""
                  ? Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  // controller.imageReady.value?
                                  FileImage(
                                File(controller.file.value.path),
                              ),
                              fit: BoxFit.fitWidth)),
                    )
                  : Container(),
            ),
          ),
          Container(
            height: Get.height * 0.15,
            width: Get.width,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.cropImage(File(file.path));
                    },
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.crop,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        controller.getTextFromImage(
                            File(controller.file.value.path), context);
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Translate",
                            style: toTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
