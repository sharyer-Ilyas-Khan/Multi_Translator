import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/multi_translator_controller.dart';

class MultiTranslatorView extends GetView<MultiTranslatorController> {
  const MultiTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiTranslatorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MultiTranslatorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
