import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';


class CropImage extends StatelessWidget {
  final file;
  const CropImage({Key? key,this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey.shade700
        ),
        title: const Text("Crop Image",style: appBar,),backgroundColor: Colors.white,),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(file.path),),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
          Container(
            height: Get.height*0.15,
            width: Get.width,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      height: Get.height*0.05,
                      width: Get.width*0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.refresh,color: Colors.black,),
                      ),

                    ),
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                        height: Get.height*0.06,
                        width: Get.width*0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: Text("Translate",style: toTextStyle,),
                        ),

                      ),
                    ),

                  ),
                  InkWell(
                    child: Container(
                      height: Get.height*0.05,
                      width: Get.width*0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.close,color: Colors.black,),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
