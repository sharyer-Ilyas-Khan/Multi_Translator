import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/darwer/views/drawer_option.dart';

import '../controllers/darwer_controller.dart';

class DarwerView extends GetView<DarwerController> {
  const DarwerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black87,
            size: 19,
          ),
          title: const  Text("All languages translator",style: appBarDrawer,),
        ),
      body: ListView(
        children:  [
        Padding(
          padding: const EdgeInsets.only(left: 35.0,right: 18.0,top: 10.0),
          child: SizedBox(
            height: Get.height*0.06,
            child: Row(
              children: [
                Container(
                  height: 12,width: 12,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle
                  ),
                ),
                const SizedBox(width: 30),
                Text("App Languages",style: drawerLangOptions,)
              ],
            ),
          ),
        ),
          DrawerOption(icon: "removeads",text: "Remove Ads"),
             DrawerOption(icon: "fav",text: "Favourite"),
             DrawerOption(icon: "history",text: "History"),
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text("App section",style: appBarDrawer,),
          ),
          DrawerOption(icon: "feedback",text: "Feedback"),
          DrawerOption(icon: "rateus",text: "Rate us"),
          DrawerOption(icon: "share",text: "Share"),
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text("Privacy section",style: appBarDrawer,),
          ),
          DrawerOption(icon: "privacy",text: "Privacy policy"),
          DrawerOption(icon: "quit",text: "Quit"),


        ],
      )
    );
  }
}
