import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/dashboard/views/bottom_nav_bar.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Translator',style:appBar,),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.menu,color: AppColors.appBarIconColor,),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.settings,color: AppColors.appBarIconColor,),
          ),
        ],
      ),
      body: Column(
        
        children: [
          ///Screens toggle
          Expanded(
              flex: 4,
              child:
              Container(color: Colors.black38,)),
          /// ads container
          Expanded(
              flex:2,
              child:
              Container(color: Colors.amber,
              child: Center(child: Text("AD"),),)),
          ///bottom nav bar
          const Expanded( child:BottomNavBar()),

        ],
      ),
    );
  }
}
