import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/favourit/bindings/favourit_binding.dart';
import 'package:translator/app/modules/favourit/views/favourit_view.dart';
import 'package:translator/app/modules/feedback/views/feedbackDialog.dart';
import 'package:translator/app/modules/feedback/views/rateus.dart';
import 'package:translator/app/modules/history/bindings/history_binding.dart';
import 'package:translator/app/modules/history/views/history_view.dart';
import 'package:translator/app/modules/in_app_purchase_ui/controllers/in_app_purchase_ui_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DarwerController extends GetxController {
  DashboardController dashboardController = Get.put(DashboardController());
  InAppPurchaseUiController inAppPurchaseUiController =
      Get.put(InAppPurchaseUiController());
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

  void removeAd() {
    inAppPurchaseUiController.loadPurchase(Get.context);
    // inAppPurchaseUiController.requestPurchase("id");
  }

  void favourite() {
    Get.to(() => FavouriteView(),
        binding: FavouritBinding(), transition: Transition.leftToRight);
  }

  void history() {
    Get.to(() => HistoryView(),
        binding: HistoryBinding(), transition: Transition.leftToRight);
  }

  void feedback() {
    Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        content: const FeedbackDialog(),
        contentPadding: EdgeInsets.zero,
        radius: 20,
        barrierDismissible: true,
        title: "");
  }

  void rateUs() {
    Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        content: const RateUs(),
        contentPadding: EdgeInsets.zero,
        radius: 20,
        barrierDismissible: true,
        title: "");
  }

  void share() {
    Share.share("applink");
  }

  void privacy() {
    launchUniversalLinkIos("https://www.google.com");
  }

  void exit() {
    dashboardController.showExitDialog();
  }

  Future<void> launchUniversalLinkIos(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      final bool nativeAppLaunchSucceeded =
          await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
      if (!nativeAppLaunchSucceeded) {
        await launchUrl(
          Uri.parse(url),
        );
      }
    }
  }
}
