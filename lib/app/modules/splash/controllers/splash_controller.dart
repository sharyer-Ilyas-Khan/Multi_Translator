import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/app/controllers/remote_config_controller.dart';
import 'package:translator/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:translator/app/modules/dashboard/views/dashboard_view.dart';
import 'package:translator/app/modules/in_app_purchase_ui/bindings/in_app_purchase_ui_binding.dart';
import 'package:translator/app/modules/in_app_purchase_ui/views/in_app_purchase_ui_view.dart';
class SplashController extends GetxController {
  //TODO: Implement SplashController
RxBool agree=false.obs;
RxBool isNativeLoaded=false.obs;
NativeAd? nativeAd;
SharedPreferences? prefs;
 FirebaseAnalytics? firebaseAnalytics;
 FirebaseRemoteConfig? remoteConfig;
RemoteConfigController remoteConfigController=Get.put(RemoteConfigController());
  @override
  void onInit() {
    // gotoDashboard();
    // getRemoteData();
    addToSharePreferences();
    initiate();
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
void initiate()async{
  try{
    remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig!.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 0),
      minimumFetchInterval: const Duration(hours: 0),
    ));
    remoteConfig!.fetchAndActivate().then((value) => getRemoteData());
  }
  on FormatException catch(e){
    // initiate();
  }
}
Future<void> addToSharePreferences() async {
  prefs = await SharedPreferences.getInstance();
  try{
    if(prefs!.getBool("purchased")==null ||prefs!.getBool("purchased")==false){
      prefs!.setBool("purchased", false);
      remoteConfigController.assignPurchased(false);
    }
    if(prefs!.getBool("purchased")==true){
      remoteConfigController.assignPurchased(true);
    }
    if(prefs!.getInt("LanguageIndex")==null){
      // prefs!.setInt("LanguageIndex",null);
      remoteConfigController.assignLanguageIndex(null);
    }
    if(prefs!.getInt("LanguageIndex")!=null){
      remoteConfigController.assignLanguageIndex(prefs!.getInt("LanguageIndex"));
    }
    // if(prefs!.getBool("country")==null){
    //   prefs!.setBool("country", true);
    //   // _createInterstitialAd();
    // }

  }
  catch(e){
    print(e.toString());
  }
}
void getRemoteData(){
  try{
    dynamic rawData = remoteConfig!.getValue("all_language_translator");
    if(rawData!=null){
      print(rawData);
      var jsonValues=jsonDecode(rawData.asString());
      print(jsonValues);
      // remoteConfigController.assignRemoteValue(jsonValues);
      //Android
      // if(remoteConfigController.purchased==false && source=="Play Store"){
      //test Ios
      // if(remoteConfigController.purchased==false&& source=="App Store"){
      //IOS
      if(remoteConfigController.purchased==false){
        remoteConfigController.assignRemoteValue(jsonValues);
        // (_interstitialAd==null && remoteConfigController.splashInterID!=""&&remoteConfigController.splashInter=="on")?
        // _createInterstitialAd():{};
        // if(nativeAd==null && remoteConfigController.splashNativeID!="" && remoteConfigController.splashNative=="on"){
        //   loadNativeAd();
        // }
        // if(nativeAdTwo==null && remoteConfigController.dashboardNativeID!="" && remoteConfigController.dashboardNative=="on"){
        //   loadNativeAdTwo();
        // }
      }
    }
  }
  on FormatException catch(e){
    // initiate();
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
