import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const Spacer(),
          SvgPicture.asset("Assets/svg/icon.svg",height: 120,),
          const Text("All Languages",style: splashHeading,),
          const Text("Translator",style: splashSubHeading,),
          const Spacer(),
          SvgPicture.asset("Assets/svg/splash.svg",width: Get.width,),
        ],
      ),
    );
  }
}
