import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';


class DrawerOption extends StatelessWidget {
  final String? icon;
  final String? text;
  const DrawerOption({Key? key,this.icon,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0,right: 18.0,top: 10.0),
      child: SizedBox(
            height: Get.height*0.06,
        child: Row(
          children: [
            SvgPicture.asset("Assets/svg/$icon.svg",height: 20,),
            const SizedBox(width: 30),
            Text(text!,style: drawerOptions,)
          ],
        ),
      ),
    );
  }
}
