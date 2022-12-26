import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/views/search_bar.dart';

import '../controllers/languages_controller.dart';

class LanguagesView extends GetView<LanguagesController> {
  final String? type;
   LanguagesView({Key? key, this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LanguagesController controller=Get.put(LanguagesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Languages',style: appBar,),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height*0.1,
            width: Get.width*0.96,
            child: const SearchBarLanguages(

            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: languages.length,
            itemBuilder: (_,index){
              return Obx(
                  ()=>InkWell(
                    highlightColor: Colors.transparent,
                    onTap: (){
                      controller.setIndex(index,type);
                      Navigator.pop(context);
                    },
                    child: Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18.0,top:12.0,bottom: 12.0),
                    child: Container(
                      height: Get.height*0.073,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: controller.selectedIndex.value==index?AppColors.secondaryColor:Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 0.1,
                            blurRadius: 0.1,

                          ),
                        ]
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(languages[index],style: languageTitle,),
                              Container(
                                height: 18,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.selectedIndex.value==index?Colors.grey.shade700:Colors.transparent,
                                  border: Border.all(color: Colors.grey.shade700,width: 2)
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ),
                  ),
              );
            },

          ))
        ],
      )
    );
  }

  List languages=[
    "English",
    "Spanish",
    "German",
    "Arabic",
    "French",
    "Italian",
    "Urdu",
    "Hindi",
        "Dutch",
        "Thai",
    "Russian",
    "Afrikaans",
    "Chinese",
    "Bengali",
    "Czech",
    "Danish",
    "Estonian",
    "Finnish",
    "Georgian",
    "Greek",
    "Gujarati",
    "Hungarian",
    "Icelandic",
    "Telugu",
    "Tamil",
    "Ukrainian",
    "Romanian",
    "Japanese",
    "Korean",
    "Irish",
    "Indonesian",
    "Hebrew",
    "Kannada",
    "Korean",
    "Swedish",
    "Polish",
    "Farsi",
    "Norwegian",
    "Portuguese",
    "Belarusian",
    "Bulgarian",
    "Catalan",
    "Haitian Creole",
    "Latvian",
    "Lithuanian",
    "Macedonian",
    "Malay",
    "Maltese",
    "Slovak",
    "Slovenian",
    "Swahili",
    "Vietnamese",
  ];
}
