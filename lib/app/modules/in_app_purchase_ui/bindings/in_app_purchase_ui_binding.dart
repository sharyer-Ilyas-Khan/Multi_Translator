import 'package:get/get.dart';

import '../controllers/in_app_purchase_ui_controller.dart';

class InAppPurchaseUiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InAppPurchaseUiController>(
      () => InAppPurchaseUiController(),
    );
  }
}
