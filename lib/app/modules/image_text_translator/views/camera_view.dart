import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/image_text_translator/controllers/camera_controller.dart';

class CameraView extends StatelessWidget {
  CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CameraControllers controllers = Get.put(CameraControllers());
    controllers.onInit();
    return Obx(
      () => controllers.isInitialized.value
          ? SizedBox(
              height: Get.height,
              width: Get.width,
              child: CameraPreview(
                controllers.controller,
              ),
            )
          : Container(
              color: Colors.black,
              height: Get.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                          controllers.errorText.value,
                          style: toTextStyle,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SpinKitFadingCircle(
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
