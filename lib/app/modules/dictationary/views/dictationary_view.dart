import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dictationary_controller.dart';

class DictationaryView extends GetView<DictationaryController> {
  const DictationaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DictationaryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DictationaryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
