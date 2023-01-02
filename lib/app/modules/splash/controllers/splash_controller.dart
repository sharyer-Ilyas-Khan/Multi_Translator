import 'dart:async';

import 'package:get/get.dart';
import 'package:translator/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:translator/app/modules/dashboard/views/dashboard_view.dart';
class SplashController extends GetxController {
  //TODO: Implement SplashController


  @override
  void onInit() {
    gotoDashboard();
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
  void gotoDashboard(){
    Timer(
        const Duration(seconds: 4),(){
      Get.off(()=> DashboardView(), binding: DashboardBinding());
    }
    );
  }
}
