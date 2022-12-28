import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/modules/uni_translator/views/from_text_area.dart';
import 'package:translator/app/modules/uni_translator/views/to_text_area.dart';

import '../controllers/uni_translator_controller.dart';

class UniTranslatorView extends GetView<UniTranslatorController> {
  const UniTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Column(
        children:  [
          FromTextArea(),
          ToTextArea()
        ],
      )
    );
  }
}
