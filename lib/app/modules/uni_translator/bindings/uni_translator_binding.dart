import 'package:get/get.dart';

import '../controllers/uni_translator_controller.dart';

class UniTranslatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UniTranslatorController>(
      () => UniTranslatorController(),
    );
  }
}
