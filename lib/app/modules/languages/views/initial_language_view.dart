import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:translator/app/modules/dashboard/views/dashboard_view.dart';
import 'package:translator/app/modules/languages/views/search_bar.dart';
import 'package:translator/app/modules/languages/controllers/language_ad_controller.dart';
import '../../multi_translator/controllers/multi_translator_controller.dart';
import '../controllers/languages_controller.dart';

class InitialLanguagesCheckView extends GetView<LanguageAdController> {
  final String? type;
  final id;
  InitialLanguagesCheckView({Key? key, this.type,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LanguagesController languageController=Get.find<LanguagesController>();
    print(languages);
    return Scaffold(
        floatingActionButton: Padding(
          padding:  EdgeInsets.only(bottom: Get.height*0.23),
          child: FloatingActionButton(onPressed: (){
            Get.off(()=>DashboardView(),binding: DashboardBinding());
          },
            child: Icon(Icons.check_rounded,color: Colors.white,),),
        ),
        appBar: AppBar(
          title: const Text('Select your native language',style: appBar,),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
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
                flex:3,
                  child: Obx(()=>
                      ListView.builder(
                        itemCount: languageController.languagesValue.length,
                        itemBuilder: (_,index){
                          return Obx(
                                ()=>InkWell(
                              highlightColor: Colors.transparent,
                              onTap: (){
                                languageController.setIndex(index,"To",null);
                                print(languageController.languages
                                [languageController.selectedToIndex.value]);
                                // Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18.0,top:0.0,bottom: 0.0),
                                child: SizedBox(
                                  height: Get.height*0.06,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.check_rounded,
                                            size: 20,
                                            color: languageController.selectedIndex.value==index?Colors.grey.shade700:Colors.transparent,),
                                          const SizedBox(width: 25,),
                                          Text(languages[index],style: languageTitle,),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },

                      ),
                  )),
              Expanded(
                child: Obx(
                  ()=> controller.isNativeLoaded.value?Container(
                  height: Get.height*0.24,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black

                        )
                      ]
                  ),
                  child: Center(
                    child: AdWidget(
                      ad: controller.nativeAd!,
                    ),
                  ),
              ):Container(),
                ),)
            ],
          ),
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
