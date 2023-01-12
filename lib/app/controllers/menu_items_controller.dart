import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:translator/app/controllers/favourite_database_controller.dart';
import 'package:translator/app/data/text_style.dart';

class MenuItemsController extends GetxController {
  FavouriteDatabaseController favouriteDatabaseController=Get.put(FavouriteDatabaseController());
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
      void copyText(text){
        print("fromData$text");
          if(text!="Translation"){
            Clipboard.setData(ClipboardData(text: text));
            Get.snackbar("Success", "Your text is successfully copied",
                snackPosition:SnackPosition.TOP,
                duration: Duration(milliseconds: 1500),

                backgroundColor: Colors.black54,colorText: Colors.white );
          }
          else{
            Get.snackbar("Note", "Cannot copy empty text.",snackPosition:SnackPosition.TOP,
                duration: Duration(milliseconds: 1500),

                backgroundColor: Colors.black54,colorText: Colors.white );
          }

      }
            void shareText(text){

          if(text!="Translation"){
            Share.share(text);
          }
          else{
            Get.snackbar("Note", "Cannot share empty text.",duration: Duration(milliseconds: 1500),snackPosition:SnackPosition.TOP,
                backgroundColor: Colors.black54,colorText: Colors.white );
          }
      }
      void addToFav(from,fromData,to,toData,type){


          if(fromData!=""){

            if(type=="uni"){
              favouriteDatabaseController.addToUniFavourite(from, fromData, to, toData);
            }
            if(type=="voice"){
              favouriteDatabaseController.addToVoiceFavourite(from, fromData, to, toData);
            }
            if(type=="multi"){
              favouriteDatabaseController.addToMultiFavourite(from, fromData, to, toData);
            }

            Get.snackbar("Success", "Your text is successfully added to favourite",
                duration: Duration(milliseconds: 1500),
                snackPosition:SnackPosition.TOP,
                backgroundColor: Colors.black54,colorText: Colors.white );

          }
          else{
            Get.snackbar("Note", "Cannot ad empty text to favourite.",snackPosition:SnackPosition.TOP,
                duration: Duration(milliseconds: 1500),
                backgroundColor: Colors.black54,colorText: Colors.white );
          }

      }

      void viewFullScreen(text){

         if(text!="Translation"){
           Get.defaultDialog(
               title: "Translated Text",
               radius: 10,
               content: Container(
                 height: Get.height*0.4,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   // border: Border.all(color: AppColors.primaryColor,width: 1),
                 ),
                 child:   Padding(
                   padding: const EdgeInsets.all(10.0),
                   child:   SingleChildScrollView(
                       child: Text(text,softWrap: true,style: textFullScreenStyle,)),
                 ),
               )
           );
         }
         else{
           Get.snackbar("Note", "Can not view empty text.",snackPosition:SnackPosition.TOP,
               duration: Duration(milliseconds: 1500),
               backgroundColor: Colors.black54,colorText: Colors.white );
         }


      }

}
