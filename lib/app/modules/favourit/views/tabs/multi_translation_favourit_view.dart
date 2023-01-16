import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/favourite_database_controller.dart';
import '../cards/favouite_multi_card.dart';

class MultiTranslationFavouriteView extends GetView {
  const MultiTranslationFavouriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavouriteDatabaseController favouriteDatabaseController =
        Get.put(FavouriteDatabaseController());
    favouriteDatabaseController.getRecordFromMultiFavourite();
    return Obx(
      () => favouriteDatabaseController.multiRecords.isEmpty
          ? const Center(
              child: Text("No Data Found"),
            )
          : ListView.builder(
              itemCount: favouriteDatabaseController.multiRecords.length,
              itemBuilder: (_, index) {
                return FavouriteMultiCardView(
                    data: favouriteDatabaseController.multiRecords[index]);
              },
            ),
    );
  }
}
