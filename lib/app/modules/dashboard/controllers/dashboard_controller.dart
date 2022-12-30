import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final  selectedIndex = 0.obs;
  final  extractedText = "".obs;
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

 void selectedOption(index){
    selectedIndex.value=index;
 }
 void setText(text){
    extractedText.value=text;
 }
}
