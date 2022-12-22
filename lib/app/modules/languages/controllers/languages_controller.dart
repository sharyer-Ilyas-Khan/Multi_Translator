import 'package:get/get.dart';

class LanguagesController extends GetxController {
  //TODO: Implement LanguagesController

  final selectedIndex = 0.obs;
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

void setIndex(index){
    selectedIndex.value=index;
}

  List languages=[
    "English",
    "Spanish",
    "German",
    "Arabic",
    "Italian",
    "Urdu",
    "Hindi"
  ];

}
