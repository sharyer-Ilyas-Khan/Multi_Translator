import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'favouite_multi_card.dart';

class MultiTranslationFavouriteView extends GetView {
  const MultiTranslationFavouriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FavouriteMultiCardView(),
        FavouriteMultiCardView(),
        FavouriteMultiCardView(),
      ],
    );
  }
}
