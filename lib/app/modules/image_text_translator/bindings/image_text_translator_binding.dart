import 'package:get/get.dart';

import '../controllers/image_text_translator_controller.dart';

class ImageTextTranslatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageTextTranslatorController>(
      () => ImageTextTranslatorController(),
    );
  }
}
