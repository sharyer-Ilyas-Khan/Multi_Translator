import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/favourite_database_controller.dart';
import '../cards/favourite_uni_card.dart';

class VoiceTranslationFavouritView extends GetView {
  const VoiceTranslationFavouritView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavouriteDatabaseController favouriteDatabaseController =
        Get.put(FavouriteDatabaseController());
    favouriteDatabaseController.getRecordFromVoiceFavourite();
    return Obx(
      () => favouriteDatabaseController.voiceRecords.isEmpty
          ? const Center(
              child: Text("No Data Found"),
            )
          : ListView.builder(
              itemCount: favouriteDatabaseController.voiceRecords.length,
              itemBuilder: (_, index) {
                return FavouriteUniCardView(
                  data: favouriteDatabaseController.voiceRecords[index],
                  type: 'voice',
                );
              },
            ),
    );
  }
}
