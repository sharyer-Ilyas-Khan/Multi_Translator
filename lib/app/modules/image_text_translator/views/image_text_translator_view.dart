import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/image_text_translator_controller.dart';

class ImageTextTranslatorView extends GetView<ImageTextTranslatorController> {
  const ImageTextTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImageTextTranslatorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ImageTextTranslatorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
