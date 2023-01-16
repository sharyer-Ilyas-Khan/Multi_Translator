import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:translator/app/data/color_code.dart';

import '../../../data/text_style.dart';

class TextViewer extends StatelessWidget {
  final text;
  const TextViewer({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.close(1);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ))),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                text,
                style: textFullScreenStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
