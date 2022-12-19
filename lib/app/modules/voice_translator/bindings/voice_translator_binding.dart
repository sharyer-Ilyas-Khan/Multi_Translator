import 'package:get/get.dart';

import '../controllers/voice_translator_controller.dart';

class VoiceTranslatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoiceTranslatorController>(
      () => VoiceTranslatorController(),
    );
  }
}
