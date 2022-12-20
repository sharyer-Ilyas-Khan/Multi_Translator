import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/modules/dictionary/views/search_bar.dart';

import '../controllers/dictationary_controller.dart';

class DictionaryView extends GetView<DictionaryController> {
  const DictionaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    body: Column(
      children: [
       SizedBox(
         height: Get.height*0.1,
         width: Get.width,
         child: const SearchBarDictionary(

         ),
       ),
        Expanded(child: Container(color: Colors.transparent,))
      ],
    ),
    );
  }
}
