import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/darwer_controller.dart';

class DarwerView extends GetView<DarwerController> {
  const DarwerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DarwerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DarwerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
