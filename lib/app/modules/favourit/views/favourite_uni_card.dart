import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';

class FavouriteUniCardView extends GetView {
  const FavouriteUniCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
      child: Container(
        height: Get.height*0.35,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12,spreadRadius: 1,blurRadius: 3)
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),

                ),

                height: Get.height*0.04,
                width: Get.width*0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Form : ENGLISH",style: toTextStyle,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: Get.height*0.1,
                  width: Get.width*0.85,
                  child: SingleChildScrollView(child: Text("How are you my friend. How are you my friend. How are you my friend. How are you my friend. How are you my friend. How are you my friend. How are you my friend. How are you my friend. How are you my friend. How are you my friend. v How are you my friend.How are you my friend. How are you my friend. How are you my friend.",
                    overflow: TextOverflow.fade,style: fromHintStyle,)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: Divider(thickness: 2,color: Colors.black12,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("To : URDU",style: fromTextStyle,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: Get.height*0.1,
                  width: Get.width*0.85,
                  child: SingleChildScrollView(child: Text(" تم کیسے ھو میرے دوست؟ تم کیسے ھو میرے دوست؟ تم کیسے ھو میرے دوست؟ تم کیسے ھو میرے دوست؟ تم کیسے ھو میرے دوست؟ تم کیسے ھو میرے دوست؟  تم کیسے ھو میرے دوست؟ تم کیسے ھو میرے دوست؟ تم کیسے ھو میرے دوست؟  تم کیسے ھو میرے دوست؟تم کیسے ھو میرے دوست؟تم کیسے ھو میرے دوست؟",
                    overflow:TextOverflow.fade,style: fromHintStyle,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}