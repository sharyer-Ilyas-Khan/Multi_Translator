import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/uni_translator_controller.dart';

class UniTranslatorView extends GetView<UniTranslatorController> {
  const UniTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniTranslatorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UniTranslatorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
