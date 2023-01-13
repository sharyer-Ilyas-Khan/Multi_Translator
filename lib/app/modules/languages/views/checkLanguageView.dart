import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/views/search_bar.dart';

import '../../multi_translator/controllers/multi_translator_controller.dart';
import '../controllers/languages_controller.dart';

class LanguagesCheckView extends GetView<LanguagesController> {
  final String? type;
  final id;
  LanguagesCheckView({Key? key, this.type,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LanguagesController controller=Get.put(LanguagesController());
    MultiTranslatorController multiController=Get.put(MultiTranslatorController());
    // languages.sort((a, b) => a.compareTo(b));
    print(languages);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
      Get.close(1);
      },
      child: Icon(Icons.check_rounded,color: Colors.white,),),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: Get.height*0.01,
                width: Get.width*0.96,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("All language",style: languageTitleHeading,),
            ),

            Expanded(
                child: Obx(()=>
                    ListView.builder(
                    itemCount: controller.languagesValue.length,
                    itemBuilder: (_,index){
                      return Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 2),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  checkboxTheme: CheckboxThemeData(
                                    side: BorderSide.none,
                                    checkColor: MaterialStateProperty.all(Colors.transparent),
                                  )
                                ),
                                child: CheckboxListTile(
                                  title: Text(languages[index],style: languageTitle,),
                                    value: controller.languagesValue[index],
                                    controlAffinity: ListTileControlAffinity.leading,
                                    side: BorderSide.none,
                                    activeColor: Colors.transparent,
                                    checkColor: Colors.grey,
                                    onChanged: (value){
                                      controller.languagesValue[index]=value!;
                                      if(value==true){
                                        multiController.listOfLang.add(languages[index]);
                                        multiController.listOfPrefix.add(multiController.languagesPrefix[index]);
                                        multiController.addIntoList();
                                        multiController.addIntoTranslation();

                                      }else{
                                          multiController.listOfLang.remove(languages[index]);
                                          multiController.listOfPrefix.remove(multiController.languagesPrefix[index]);
                                      }
                                      // multiController.addPrefix();
                                      // multiController.addLang();
                                      // multiController.addIntoTranslation();
                                      // multiController.addIntoList();
                                      //         scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
                                      //
                                      }
                                ),
                              ),
                      );
                    },

                  ),
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
