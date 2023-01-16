import 'package:get/get.dart';

class RemoteConfigController extends GetxController {
  //TODO: Implement RemoteConfigController
  String splashInterID="";
  final count = 0.obs;
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

  void assignRemoteValue(jsonFile){
    splashInterID=jsonFile["splash_admob_inter_id"]["value"];
  }
}
