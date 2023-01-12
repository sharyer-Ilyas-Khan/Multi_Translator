import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../controllers/speaker_controller.dart';
import '../../../controllers/text_font_controller.dart';

class VoiceTranslatorController extends GetxController {
  //TODO: Implement VoiceTranslatorController
  Rx<String> translatedText="Translation".obs;
  Rx<String> inputText="Speak".obs;
  RxBool audioEnabled=false.obs;
  RxBool isNativeLoaded=false.obs;
  NativeAd? nativeAd;
  TextFontController fontController=Get.put(TextFontController());
  SpeakerController speakerController=Get.put(SpeakerController());
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
    super.onClose();
  }

    void audioEnable(status){
    audioEnabled.value=status;
  }
  void setText(text){
    translatedText.value=text;
  }
  void setInputText(text){
    inputText.value=text;
    if(inputText.value.length>40){
      fontController.inputFont.value=20.0;
    }
    if(inputText.value.length<40){
      fontController.inputFont.value=40.0;
    }
  }
  void getFont(){

  }

  Future<String> getTranslateUrl(String sourceLan, String targetLan, String content)async {
    String TRANSLATE_BASE_URL = "https://translate.google.com.hk/";
    try {
      String url="${TRANSLATE_BASE_URL}translate_a/single?client=gtx&sl=${sourceLan}&tl=${targetLan}&dt=t&q=${Uri.encodeFull(content)}";
      Response response=await GetConnect().get(url);
      speakerController.checkAvailableTo(targetLan);
      var result=response.body[0][0];
      return result[0];
    } catch (e) {
      return "....";
    }
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

