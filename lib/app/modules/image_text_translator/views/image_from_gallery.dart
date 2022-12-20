import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';

class ImageFromGallery extends StatelessWidget {
  const ImageFromGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: Get.height*0.08,
        width: Get.width*0.7,
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [

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
            SvgPicture.asset("Assets/svg/gallery.svg"),
            const Text("Image From Gallery",style: picker,)
          ],
        ),
      ),
    );
  }
}
