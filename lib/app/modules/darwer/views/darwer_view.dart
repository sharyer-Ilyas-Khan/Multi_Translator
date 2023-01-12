import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/darwer/views/drawer_option.dart';

import '../controllers/darwer_controller.dart';

class DarwerView extends GetView<DarwerController> {
  const DarwerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
        body: CustomScrollView(
            slivers: [
              const CupertinoSliverNavigationBar(
               stretch: true,
                largeTitle: Text('Settings'),
                automaticallyImplyLeading: false,
                backgroundColor: CupertinoColors.extraLightBackgroundGray,
                // trailing: Icon(CupertinoIcons.add_circled),

              ),
      SliverList(
          delegate: SliverChildListDelegate(
        [
          const DrawerOption(icon: "removeads", text: "Remove Ads", index: 1,color: Colors.blue),

         DrawerOption(icon: "fav", text: "Favourite", index: 2,color: Colors.red.shade600),
         const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Review section",
                    style: appBarDrawer,
                  ),
                ),
          const DrawerOption(icon: "feedback", text: "Feedback", index: 4,color: Colors.blue),
          const DrawerOption(icon: "rateus", text: "Rate us", index: 5,color: Colors.blue),
          const DrawerOption(icon: "share", text: "Share", index: 6,color: Colors.amber),

          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Privacy section",
              style: appBarDrawer,
            ),
          ),
          const DrawerOption(icon: "privacy", text: "Privacy policy", index: 7,color: Colors.purple),
          const DrawerOption(icon: "quit", text: "Quit", index: 8,color: Colors.grey),

        ]
      ))


    ]));
  }
}
