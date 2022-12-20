import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
class ToTextArea extends StatelessWidget {
  const ToTextArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: Get.height*0.25,
      width: Get.width,
      color: AppColors.primaryColor,
      child: Padding(
        padding:  EdgeInsets.only(left: Get.width*0.08,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const TextField(
              maxLines: 5,
              minLines: 5,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "....",
                  hintStyle:toHintStyle,
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(2.0),
              child: Text("To:",style: toTextStyle,),
            ),
            Container(
                width: Get.width*0.35,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1),
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Spanish",style: toDropStyle,),
                        RotatedBox(
                            quarterTurns: 1,
                            child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,))
                      ],
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}