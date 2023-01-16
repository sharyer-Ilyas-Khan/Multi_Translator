import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteConfigController extends GetxController {
  //TODO: Implement RemoteConfigController
  String splashInterID = "";
  bool purchased = false;
  final count = 0.obs;
  dynamic languageIndex;
  SharedPreferences? prefs;
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

  void assignRemoteValue(jsonFile) {
    splashInterID = jsonFile["splash_admob_inter_id"]["value"];
  }

  void assignPurchased(status) {
    purchased = status;
  }

  void assignLanguageIndex(index) {
    languageIndex = index;
  }
}
