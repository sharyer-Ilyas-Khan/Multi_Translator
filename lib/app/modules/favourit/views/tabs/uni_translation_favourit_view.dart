import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/controllers/favourite_database_controller.dart';
import 'package:translator/app/modules/favourit/views/cards/favourite_uni_card.dart';

class UniTranslationFavouriteView extends GetView {
  const UniTranslationFavouriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavouriteDatabaseController favouriteDatabaseController=Get.put(FavouriteDatabaseController());
    favouriteDatabaseController.getRecordFromUniFavourite();
    return Obx(
        ()=>favouriteDatabaseController.uniRecords.isEmpty?
          const Center(
            child: Text("No Data Found"),
          )
          :ListView.builder(
            itemCount: favouriteDatabaseController.uniRecords.length,
          itemBuilder: (_,index){
              return FavouriteUniCardView(data:favouriteDatabaseController.uniRecords[index],type:'uni');
          },
      ),
    );
  }
}
