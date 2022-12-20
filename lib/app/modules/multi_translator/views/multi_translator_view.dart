import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/multi_translator/views/from_text_area.dart';
import 'package:translator/app/modules/multi_translator/views/to_text_area.dart';

import '../controllers/multi_translator_controller.dart';

class MultiTranslatorView extends GetView<MultiTranslatorController> {
  const MultiTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.white,
        child: const Center(
          child: Icon(Icons.add,color: AppColors.primaryColor,),
        ),
      ),

      body: ListView(
        children: [
        FromTextArea(),
          ToTextArea()
        ],
      )
    );
  }
}
