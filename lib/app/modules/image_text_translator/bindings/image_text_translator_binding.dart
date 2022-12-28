import 'package:get/get.dart';

import 'package:translator/app/modules/image_text_translator/controllers/camera_controller.dart';

import '../controllers/image_text_translator_controller.dart';

class ImageTextTranslatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      () => CameraControllers(),
    );
    Get.lazyPut<ImageTextTranslatorController>(
      () => ImageTextTranslatorController(),
    );
  }
}
