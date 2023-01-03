import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UniTranslationHistoryView extends GetView {
  const UniTranslationHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'UniTranslationHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
