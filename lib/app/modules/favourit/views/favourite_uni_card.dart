import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FavouriteUniCardView extends GetView {
  const FavouriteUniCardView({Key? key}) : super(key: key);
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