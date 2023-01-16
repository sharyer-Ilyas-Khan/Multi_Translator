import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoiceTranslationHistoryView extends GetView {
  const VoiceTranslationHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'VoiceTranslationHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
