import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:translator/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:translator/app/modules/dashboard/views/dashboard_view.dart';
import 'package:translator/app/modules/in_app_purchase_ui/bindings/in_app_purchase_ui_binding.dart';
import 'package:translator/app/modules/in_app_purchase_ui/views/in_app_purchase_ui_view.dart';
class SplashController extends GetxController {
  //TODO: Implement SplashController
RxBool agree=false.obs;
RxBool isNativeLoaded=false.obs;
NativeAd? nativeAd;

  @override
  void onInit() {
    // gotoDashboard();
    loadNativeAd();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    if(nativeAd!=null) {
      nativeAd!.dispose();
    }
    super.onClose();
  }
  void gotoDashboard(){
    // Timer(
        // const Duration(seconds: 4),(){
      // Get.off(()=> DashboardView(), binding: DashboardBinding());
      Get.off(()=> InAppPurchaseUiView(), binding: InAppPurchaseUiBinding());
    // }
    // );
  }
  void agreeTerms(value){
    agree.value=value;
  }
void loadNativeAd() {
  nativeAd = NativeAd(
      request: const AdRequest(),
      adUnitId: "ca-app-pub-3940256099942544/2247696110",
      factoryId:  (Platform.isIOS)?'largeNative':'flightNative',
      listener: NativeAdListener(
          onAdLoaded: (ad) {
            // callEvent("flight_no_native_ad_loaded_flight");
            //   WidgetsBinding.instance.removeObserver(this);
            isNativeLoaded.value = true;
            // widget.remoteController.dashboardNativeClicked(false);

          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            isNativeLoaded.value = false;
            // widget.remoteController.dashboardNativeClicked(false);
            // callEvent("flight_no_native_ad_failed_flight");
            print('failed to load the ad native');
          },
          onAdClicked: (ad) {
            // WidgetsBinding.instance.addObserver(this);
            // widget.remoteController.dashboardNativeClicked(true);
            // callEvent("flight_no_native_ad_clicked_flight");
          }
      )
  );
  nativeAd!.load();
}
}
