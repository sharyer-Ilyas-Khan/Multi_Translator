import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/voice_translator/views/from_text_area.dart';
import 'package:translator/app/modules/voice_translator/views/to_text_area.dart';

import '../controllers/voice_translator_controller.dart';

class VoiceTranslatorView extends GetView<VoiceTranslatorController> {
  const VoiceTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:  [
          Column(
            children: [
              Expanded(child: FromTextArea()),
              Expanded(child: ToTextArea()),
            ],
          ),
         Positioned(
           right: 30,
           top: 0,
           bottom: 0,
           child: InkWell(
             onTap: (){
             },
             child: Container(
               height: 70,
               width: 60,
               decoration: const BoxDecoration(
                 color: Colors.white,
                 shape: BoxShape.circle,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black12,
                     blurRadius: 3,
                     spreadRadius: 3
                   )
                 ]
               ),
               child: Center(
                 child: SvgPicture.asset("Assets/svg/voice.svg",color: AppColors.primaryColor,),
               ),
             ),
           ),
         )
        ],
      )
    );
  }
}
