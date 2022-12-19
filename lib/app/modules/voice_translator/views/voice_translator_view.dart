import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/voice_translator_controller.dart';

class VoiceTranslatorView extends GetView<VoiceTranslatorController> {
  const VoiceTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoiceTranslatorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VoiceTranslatorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
