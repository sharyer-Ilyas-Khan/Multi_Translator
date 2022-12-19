import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeedbackView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FeedbackView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
