import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';

import '../../../../controllers/favourite_database_controller.dart';

class FavouriteUniCardView extends GetView {
  final data;
  final type;
  const FavouriteUniCardView({Key? key,this.data,this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FavouriteDatabaseController favouriteDatabaseController=Get.put(FavouriteDatabaseController());
    return  Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 15.0),
      child: Container(
        height: Get.height*0.36,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black12,spreadRadius: 1,blurRadius: 3)
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        Get.defaultDialog(
                            title: "Warning",
                            radius: 12,
                            titlePadding: EdgeInsets.only(right: Get.width*0.55,top: 20,left: 20),
                            content: Padding(
                              padding:  EdgeInsets.only(right: 15,left: 15),
                              child: SizedBox(
                                height: Get.height*0.1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   const  Text("Are you sure you want to Delete? This action is not revers able.",style: fromHintStyle,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(onPressed: (){
                                          Get.close(1);
                                        }, child:Text("Cancel",style: fromTextStyle,)),
                                        SizedBox(width: 10,),
                                        TextButton(onPressed: (){
                                          if(type=='uni'){
                                            favouriteDatabaseController.removeFromUniFavourite(data['id']);
                                          }
                                          if(type=='voice'){
                                            favouriteDatabaseController.removeFromVoiceFavourite(data['id']);
                                          }
                                          Get.close(1);
                                        }, child:Text("Okay",style: fromTextStyle)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                           );

                      }, icon: Icon(Icons.delete,color: Colors.white,),padding: EdgeInsets.zero,)
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

              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: Divider(thickness: 2,color: Colors.black12,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("To : ${data['to']}",style: fromTextStyle,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: Get.height*0.1,
                  width: Get.width*0.85,
                  child: SingleChildScrollView(child: Text(data['to_data'],
                    overflow:TextOverflow.fade,style: fromHintStyle,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}