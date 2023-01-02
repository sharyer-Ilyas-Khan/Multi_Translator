import 'package:get/get.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';

class DarwerController extends GetxController {
DashboardController dashboardController=Get.put(DashboardController());
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
void exit(){
    dashboardController.showExitDialog();
}
}
