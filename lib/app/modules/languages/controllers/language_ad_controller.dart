import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LanguageAdController extends GetxController {
  //TODO: Implement LanguageAdController
  RxBool isNativeLoaded=false.obs;
  NativeAd? nativeAd;

  @override
  void onInit() {
    loadNativeAd();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    if(nativeAd!=null){
      nativeAd!.dispose();
    }
    super.onClose();
  }
  void loadNativeAd() {
    nativeAd = NativeAd(
        request: const AdRequest(),
        adUnitId: "ca-app-pub-3940256099942544/2247696110",
        factoryId:  (Platform.isIOS)?'noMediaNative':'flightNative',
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
  void setNativeLanguage(index){

  }
  List languagesPrefix=[
    "en",
    "es",
    "de",
    "ar",
    "fr",
    "it",
    "ur",
    "hi",
    "nl",
    "th",
    "ru",
    "af",
    "zh",
    "bn",
    "cs",
    "da",
    "et",
    "fi",
    "ka",
    "el",
    "gu",
    "hu",
    "is",
    "te",
    "ta",
    "uk",
    "ro",
    "ja",
    "kn",
    "ga",
    "id",
    "iw",
    "kn",
    "kn",
    "sv",
    "pl",
    "fa",
    "no",
    "pt",
    "be",
    "bg",
    "ca",
    "gl",
    "ht",
    "lv",
    "lt",
    "mk",
    "ms",
    "mt",
    "sk",
    "sl",
    "sw",
    "vi",
  ];
}
