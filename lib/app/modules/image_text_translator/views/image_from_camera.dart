import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';

import '../controllers/image_text_translator_controller.dart';

class ImageFromCamera extends StatelessWidget {
  const ImageFromCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageTextTranslatorController controller=Get.put(ImageTextTranslatorController());
    return InkWell(
        onTap: (){
      controller.captureImage();
      },
      child: Container(
        height: Get.height*0.08,
        width: Get.width*0.7,
        decoration:  BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const[

              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0.2,
                  blurRadius: 1
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("Assets/svg/camera.svg",color: Colors.black,),
            const Text("Image From Camera",style: picker,)
          ],
        ),
      ),
    );
  }
}
