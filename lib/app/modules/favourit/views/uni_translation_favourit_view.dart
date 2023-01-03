import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/modules/favourit/views/favourite_uni_card.dart';

class UniTranslationFavouriteView extends GetView {
  const UniTranslationFavouriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(

        children: [
          FavouriteUniCardView(),
          FavouriteUniCardView(),
        ],
    );
  }
}
