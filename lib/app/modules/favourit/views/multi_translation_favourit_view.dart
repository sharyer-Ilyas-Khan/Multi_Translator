import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MultiTranslationFavouritView extends GetView {
  const MultiTranslationFavouritView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'MultiTranslationFavouritView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
