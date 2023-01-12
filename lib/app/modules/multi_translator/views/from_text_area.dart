import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/speaker_controller.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/languages/controllers/languages_controller.dart';
import 'package:translator/app/modules/languages/views/languages_view.dart';
import 'package:translator/app/modules/multi_translator/controllers/multi_translator_controller.dart';

import '../../../controllers/menu_items_controller.dart';
import '../../../controllers/text_font_controller.dart';
class FromTextArea extends StatelessWidget {
   FromTextArea({Key? key}) : super(key: key);
String inputText="";
  @override
  Widget build(BuildContext context) {
    LanguagesController languagesController=Get.put(LanguagesController());
    MultiTranslatorController controller=Get.put(MultiTranslatorController());
    TextFontController fontController=Get.put(TextFontController());
    MenuItemsController menuItemsController=Get.put(MenuItemsController());
    SpeakerController speakerController=Get.put(SpeakerController());
    return Container(
      height: Get.height*0.2,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
            border: Border.all(color: Colors.black12,width: 0.5)
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 15.0,top: 8),
        child: Stack(
          children:  [
            Obx(
                  ()=> InkWell(
                onTap: (){
                  Get.to(()=>LanguagesView(type: "from") );
                },
                child: Container(
                    width: Get.width*0.45,
                    height: 35,
                    decoration: BoxDecoration(
                       color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Spacer(),
                            Text( "From:",style: fromHintStyle,),
                            Spacer(),
                            Text( "${languagesController.languages
                            [languagesController.selectedFromIndex.value
                            ]
                            }",style: fromDropStyle,overflow: TextOverflow.ellipsis,),
                            Icon(Icons.arrow_drop_down_sharp,color: Colors.blue,size: 20,),
                            Spacer(),
                          ],
                        )
                    )
                ),
              ),
            ),

            Positioned(
              bottom: Get.height*0.04,
              child: Container(
                height: Get.height*0.12,
                width: Get.width*0.85,
                child: Obx(
                  ()=> SizedBox(
                    height: Get.height*0.13,
                    width: Get.width*0.8,
                    child:  TextField(
                      maxLines: 5,
                      minLines: 5,
                      focusNode: controller.myFocusNode,
                      controller: controller.fromTextController.value,
                      style: fontController.inputTextStyle(fontController.inputFont.value),
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Text Here",
                        hintStyle:fontController.inputTextHintStyle(fontController.inputFont.value),
                      ),
                      onChanged: (value) async {
                        inputText=value;

                        if(value.length>=40){
                          fontController.setInputTextFont(18.0);
                        }
                        if(value.length<40){
                          fontController.setInputTextFont(25.0);
                        }
                        int getIndex=await controller.detectLanguage(value);
                        speakerController.checkAvailableFrom(languagesController.languagesPrefix
                        [languagesController.selectedFromIndex.value]);
                        languagesController.selectedFromIndex.value=getIndex;
                        if(value.isEmpty){
                          languagesController.selectedFromIndex.value=0;
                        }
                        controller.setTranslations(
                            languagesController.languagesPrefix[languagesController.selectedFromIndex.value],
                            value);

                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(right:0,bottom: 0,left: 0,
                child: Row(
                  children: [
                    Obx(
                      ()=> IconButton(
                        padding:EdgeInsets.only(right: 0),
                        onPressed: () {
                          menuItemsController.colorHeart.value!=true?
                          menuItemsController.addToFav(
                                          languagesController.languages[languagesController.selectedFromIndex.value].toString(),
                                          controller.textContent.toString(),
                                          controller.listOfLang.toList(),
                                          controller.listOfTranslation.toList(),
                                          "multi"

                                      ):
                          menuItemsController.removeFav("multi",  controller.textContent.toString());
                          },
                        icon: menuItemsController.colorHeart.value?Icon(Icons.favorite_outlined,color: Colors.red.shade600,):
                        Icon(Icons.favorite_border,color: Colors.grey.shade600,),
                        iconSize: 20,
                      ),
                    ),
                    IconButton(onPressed: (){
                      if(speakerController.isAvailableFrom.value){
                        inputText!=""?speakerController.speakFrom(inputText):{};
                      }else{
                        Get.snackbar("Sorry!", "Speaker is unAvailable.",snackPosition:SnackPosition.TOP,
                          backgroundColor: Colors.black54,colorText: Colors.white,
                          duration: Duration(milliseconds: 1500),);
                      }




                    }, icon: SvgPicture.asset("Assets/svg/pronouncer.svg",height: 15),


                    ),
                    IconButton(onPressed: (){
                      menuItemsController.viewFullScreen(controller.fromTextController.value.text.toString());


                    }, icon: SvgPicture.asset("Assets/svg/full_screen.svg",height: 15)),
                    Spacer(),
                    InkWell(onTap: (){


                    }, child: Container(
                      width: Get.width*0.25,
                      height: Get.height*0.04,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text("Translate",style: translateButton,),
                      ),
                    ),),
                    SizedBox(width: 15,)
                  ],
                )),
            Obx(
                  ()=>
                  Positioned(
                  right: 0,
                  top: 0,
                  child: controller.fromTextController.value.text!=""?IconButton(
                    splashColor: Colors.transparent,
                    onPressed: (){
                      controller.fromTextController.value.clear();
                      controller.textContent="";
                    },
                    icon: Icon(Icons.close,color: Colors.black45,size: 18,),
                  ):Container()),
            ),

          ],
        ),
      ),
    );
  }
}
