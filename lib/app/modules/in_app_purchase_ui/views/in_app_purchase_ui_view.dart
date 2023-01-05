import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/in_app_purchase_ui_controller.dart';

class InAppPurchaseUiView extends GetView<InAppPurchaseUiController> {
  const InAppPurchaseUiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppPurchaseUiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InAppPurchaseUiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
