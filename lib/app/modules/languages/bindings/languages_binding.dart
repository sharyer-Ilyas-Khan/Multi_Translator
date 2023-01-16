import 'package:get/get.dart';

import 'package:translator/app/modules/languages/controllers/language_ad_controller.dart';

import '../controllers/languages_controller.dart';

class LanguagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( LanguageAdController(),
    );
    Get.put(
      LanguagesController(),
    );
  }
}
