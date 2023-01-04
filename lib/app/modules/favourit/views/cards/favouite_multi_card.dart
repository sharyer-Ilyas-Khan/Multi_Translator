import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/controllers/favourite_database_controller.dart';
import 'package:translator/app/modules/favourit/views/favourit_view.dart';
import 'package:translator/app/modules/favourit/views/details/multi_translation_details.dart';

import '../../../../data/color_code.dart';
import '../../../../data/text_style.dart';

class FavouriteMultiCardView extends GetView {
  final data;
  const FavouriteMultiCardView({Key? key,this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavouriteDatabaseController favouriteDatabaseController=Get.put(FavouriteDatabaseController());
    return  InkWell(
      onTap: (){
        List prefixResult = [];
        List dataList = [];
        var preFirst=data['to'].toString().replaceAll("[", "");
        var preLast =preFirst.toString().replaceAll("]", "");
        prefixResult=preLast.toString().split(",");

        var dataFirst=data['to_data'].toString().replaceAll("[", "");
        var dataLast =dataFirst.toString().replaceAll("]", "");
        dataList=dataLast.toString().split(",");
        Get.to(()=>MultiTranslationDetailsView(data:data,prefixList:prefixResult,dataList:dataList));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
        child: Container(
          height: Get.height*0.24,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              const BoxShadow(color: Colors.black12,spreadRadius: 1,blurRadius: 3)
            ]
          ),
          child: Padding(
            padding:  const EdgeInsets.only(top: 8.0,right: 8.0,bottom: 5.0,left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(5),

                  ),

                  height: Get.height*0.04,
                  width: Get.width*0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Form : ${data['from']}",style: toTextStyle,),
                        IconButton(onPressed: (){
                          Get.defaultDialog(title: 'Warning',content: const Text("Are you sure you want to delete. You can not undo this action"),actions: [
                            TextButton(onPressed: (){
                              favouriteDatabaseController.removeFromMultiFavourite(data['id']);
                              Get.close(1);
                            }, child: const Text("Yes",style: TextStyle(color: Colors.grey),)),
                            TextButton(onPressed: (){
                              Get.close(1);
                            }, child: const Text("No",style: TextStyle(color: AppColors.primaryColor),)),
                          ]);

                        }, icon: const Icon(Icons.delete,color: Colors.white,),padding: EdgeInsets.zero,)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: Get.height*0.1,
                    width: Get.width*0.85,
                    child: SingleChildScrollView(child: Text(data['from_data'],
                      overflow: TextOverflow.fade,style: fromHintStyle,)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
                  child: Text("To: ......Tap to see ",overflow: TextOverflow.fade,style: fromHintStyle,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}