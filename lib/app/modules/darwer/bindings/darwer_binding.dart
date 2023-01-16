import 'package:get/get.dart';

import '../controllers/darwer_controller.dart';

class DarwerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DarwerController());
  }
}
