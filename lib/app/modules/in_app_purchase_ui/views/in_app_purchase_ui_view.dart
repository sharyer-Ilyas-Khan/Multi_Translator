import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';

import '../controllers/in_app_purchase_ui_controller.dart';

class InAppPurchaseUiView extends GetView<InAppPurchaseUiController> {
  const InAppPurchaseUiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Get.close(1);
                }, icon: Icon(Icons.close,color: Colors.grey.shade300,)),
                Container(
                  height: Get.height*0.04,
                  width: Get.width*0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: const Center(
                    child: Text("PREMIUM",style: fromHintStyle,),
                  ),
                ),
              ],
            ),
          ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(left: Get.width*0.1),
              child: Text("Go Beyond Experience",style: inTitleHeading,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: Get.width*0.1,bottom: Get.height*0.04),
              child: Text("Get Unlimited Access",style: inTitleHeading,),
            ),
            Center(
              child: Container(
                height: Get.height*0.13,
                width: Get.width*0.85,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(

                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.red.withOpacity(0.3),
                                        Colors.pink.withOpacity(0.1),
                                        Colors.purple.withOpacity(0.01),

                                      ]
                                    )
                                  ),
                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Transform.rotate(
                                  angle: -0.2,
                                  child: Container(
                                    height: Get.height*0.055,
                                    width: Get.width*0.15,
                                    decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffE35671),
                                              Color(0xffE88A5A),
                                              // Colors.red.shade300,
                                              // Colors.red.shade300,
                                              // Colors.amber.shade700


                                            ]
                                        )
                                    ),
                                    child: Transform.rotate(angle:0.2,child: Icon(Icons.notifications_rounded,color: Colors.white,size: 30,)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(width: 20,),
                    Expanded(
                        flex: 4,
                        child: Container(
                      color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text("Remove Ads",style: inAppHeading,),
                              SizedBox(height: 10,),
                              Text("Removing annoying ads and enjoy ad free experience",style: inAppSubHeading,),
                              Spacer(),
                            ],
                          ),
                    ))
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: Get.height*0.13,
                width: Get.width*0.85,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(

                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff8156EC).withOpacity(0.4),
                                        Color(0xffB77AF8).withOpacity(0.01),
                                        // Colors.purple.withOpacity(0.7),
                                        // Colors.purple.withOpacity(0.2),
                                        // Colors.purple.withOpacity(0.01),

                                      ]
                                    )
                                  ),
                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Transform.rotate(
                                  angle: 0.2,
                                  child: Container(
                                    height: Get.height*0.055,
                                    width: Get.width*0.15,
                                    decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.purple.shade500,
                                              Colors.purple.shade400,
                                              Colors.purple.shade300


                                            ]
                                        )
                                    ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Transform.rotate(angle:-0.2,child: SvgPicture.asset("Assets/svg/photo_translator.svg",)),
                                      ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(width: 20,),
                    Expanded(
                        flex: 4,
                        child: Container(
                      color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text("Photo Translator",style: inAppHeading,),
                          SizedBox(height: 10,),
                              Text("Get translated text of your images directly without even typing.",style: inAppSubHeading,),
                              Spacer(),
                            ],
                          ),
                    ))
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: Get.height*0.13,
                width: Get.width*0.85,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  decoration: BoxDecoration(

                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      colors: [
                                        // Colors.green.withOpacity(0.3),
                                        // Colors.lightGreen.withOpacity(0.2),
                                        // Colors.green.withOpacity(0.01),
                                        Color(0xff52B6AB).withOpacity(0.4),
                                        Color(0xff6BE3A0).withOpacity(0.01),

                                      ]
                                    )
                                  ),
                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Transform.rotate(
                                  angle: -0.1,
                                  child: Container(
                                    height: Get.height*0.055,
                                    width: Get.width*0.15,
                                    decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.green.shade700,
                                              Colors.green.shade500,
                                              Colors.green.shade300


                                            ]
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Transform.rotate(angle:0.1 ,
                                          child: SvgPicture.asset("Assets/svg/Multi_translator.svg",)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(width: 20,),
                    Expanded(
                        flex: 4,
                        child: Container(
                      color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text("Multi language Translator (100+Languages supported)",style: inAppHeading,),
                              SizedBox(height: 10,),
                              Text("Translate your text into multiple languages by one click.",style: inAppSubHeading,),
                              Spacer(),
                            ],
                          ),
                    ))
                  ],
                ),
              ),
            ),
            Spacer(),
            Center(child: Text("One time payment",style: oneTime,)),
            Center(child: Text("12.66/Life time access of premium feature",style: toolTipStyle,)),
            SizedBox(height: 5,),
            InkWell(
              onTap: (){
                controller.requestPurchase();
              },
              child: Center(
        child: Container(
          height: Get.height*0.07,
          width: Get.width*0.8,

          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text("Continue",style: toHintStyle,),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                  ),
                  SizedBox(width: 10,)
                ],
              ),
          ),
        ),
      ),
            ),
            Spacer(),
            Center(child: Text("All language translator Terms and Privacy policy",style: policy,)),

          ],
        ),
      ),
    );
  }
}
