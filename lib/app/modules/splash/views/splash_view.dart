import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                ()=> controller.isNativeLoaded.value?Container(
                  height: Get.height*0.24,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black

                        )
                      ]
                  ),
                  child: AdWidget(
                    ad: controller.nativeAd!,
                  ),
                ):SizedBox( height: Get.height*0.24,
                  width: Get.width,),
              ),
             Spacer(),
             Container(
               height: 150,
               width: 150,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 image: const DecorationImage(
                   image: AssetImage("Assets/icon/icons.png",),
                 )
               ),
             ),
              const Text("All Languages",style: splashHeading,),
              const Text("Translator",style: splashSubHeading,),

              const Spacer(),
              Obx(
                ()=> Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      controller.agree.value?IconButton(onPressed: (){
                        controller.agreeTerms(false);
                      }, icon: const Icon(Icons.check_circle)
                        ,color: Colors.blueGrey,
                      iconSize: 30,
                      ):
                     IconButton(onPressed: (){
                       controller.agreeTerms(true);
                     }, icon: const Icon(Icons.circle_outlined),
                    iconSize: 30,
                         color: Colors.blueGrey,

                     ),
                     const  Text("I agree to privacy policy & terms of service.",textAlign:TextAlign.center,
                        style: splashPolicy,),
                    ],
                  ),
                ),
              ),

              Obx(
                ()=>controller.agree.value?InkWell(
                  onTap: (){
                    controller.gotoDashboard();
                  },
                  child: Center(
                    child: Container(
                      height: Get.height*0.06,
                      width: Get.width*0.85,

                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Spacer(),
                            Text("Continue",style: splashButtonStyle,),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 1.0),
                              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 16,),
                            ),
                            SizedBox(width: 10,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ):
                Center(
                  child: Container(
                    height: Get.height*0.06,
                    width: Get.width*0.85,

                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade300,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Spacer(),
                          Text("Continue",style: splashButtonStyle,),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 1.0),
                            child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 16,),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(height: Get.height*0.1,),
            ],
          ),
        ),
      ),
    );
  }
}
