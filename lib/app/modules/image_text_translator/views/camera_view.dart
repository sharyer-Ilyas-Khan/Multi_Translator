import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:translator/app/modules/image_text_translator/controllers/camera_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CameraControllers controllers=Get.put(CameraControllers());
    return Obx(()=>
       controllers.isInitialized.value?
       CameraPreview(

        controllers.controller,

      ):Container(),);
  }
}
