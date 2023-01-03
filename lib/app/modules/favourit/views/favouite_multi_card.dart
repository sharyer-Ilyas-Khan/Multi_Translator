import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FavouriteMultiCardView extends GetView {
  const FavouriteMultiCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text(
          'UniTranslationFavouriteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}