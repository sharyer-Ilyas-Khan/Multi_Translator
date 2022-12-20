import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/image_text_translator_controller.dart';
import 'image_from_camera.dart';
import 'image_from_gallery.dart';

class ImageTextTranslatorView extends GetView<ImageTextTranslatorController> {
  const ImageTextTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: ImageFromCamera()),
          SizedBox(height: 30,),
          ImageFromGallery(),
        ],
      )
    );
  }
}
