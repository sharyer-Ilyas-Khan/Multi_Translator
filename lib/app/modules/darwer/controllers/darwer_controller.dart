import 'package:get/get.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/favourit/bindings/favourit_binding.dart';
import 'package:translator/app/modules/favourit/views/favourit_view.dart';
import 'package:translator/app/modules/feedback/views/feedback_view.dart';
import 'package:translator/app/modules/history/bindings/history_binding.dart';
import 'package:translator/app/modules/history/views/history_view.dart';

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
  void removeAd(){

  }
void favourite(){
  Get.to(()=>FavouriteView(),binding: FavouritBinding(),transition: Transition.leftToRight);
}
void history(){
Get.to(()=>HistoryView(),binding: HistoryBinding(),transition: Transition.leftToRight);
}
      void feedback(){
        Get.to(()=>FeedbackView(),binding: HistoryBinding(),transition: Transition.leftToRight);
      }
      void rateUs(){

      }
      void share(){

      }
      void privacy(){

      }

void exit(){
    dashboardController.showExitDialog();
}
}
