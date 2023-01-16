import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiTranslationHistoryView extends GetView {
  const MultiTranslationHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'MultiTranslationHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
