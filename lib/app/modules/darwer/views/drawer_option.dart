import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/text_style.dart';

import '../controllers/darwer_controller.dart';


class DrawerOption extends StatelessWidget {
  final String? icon;
  final String? text;
  final int? index;
  const DrawerOption({Key? key,this.icon,this.text,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DarwerController controller=Get.put(DarwerController());
    return InkWell(
      onTap: (){
        if(index==1){
          controller.removeAd();
        }
        if(index==2){
          controller.favourite();
        }
        if(index==3){
          controller.history();
        }
        if(index==4){
          controller.feedback();
        }
        if(index==5){
          controller.rateUs();
        }
        if(index==6){
          controller.share();
        }
        if(index==7){
          controller.privacy();
        }
        if(index==8){
          controller.exit();
        }
      },
      child: Padding(
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
      ),
    );
  }
}
