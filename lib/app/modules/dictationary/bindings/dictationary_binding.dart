import 'package:get/get.dart';

import '../controllers/dictationary_controller.dart';

class DictationaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DictationaryController>(
      () => DictationaryController(),
    );
  }
}
