import 'package:get/get.dart';

class LanguagesController extends GetxController {
  //TODO: Implement LanguagesController

  final selectedIndex = 0.obs;
  final selectedFromIndex = 0.obs;
  final selectedToIndex = 0.obs;
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

void setIndex(index,from){
  selectedIndex.value=index;
    if(from=="from"){
      selectedFromIndex.value=index;
    }
  if(from=="to"){
    selectedToIndex.value=index;
  }

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
