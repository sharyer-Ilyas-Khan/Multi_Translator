import 'package:get/get.dart';

import '../controllers/dictationary_controller.dart';

class DictionaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( DictionaryController(),
    );
  }
}
