import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UniTranslationFavouritView extends GetView {
  const UniTranslationFavouritView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text(
          'UniTranslationFavouritView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
