import 'package:get/get.dart';

import '../controllers/multi_translator_controller.dart';

class MultiTranslatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MultiTranslatorController>(
      () => MultiTranslatorController(),
    );
  }
}
