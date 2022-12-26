import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/data/text_style.dart';
import 'package:translator/app/modules/dictionary/controllers/dictationary_controller.dart';
class SearchBarDictionary extends StatelessWidget {
  const SearchBarDictionary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DictionaryController controller=Get.put(DictionaryController());
    return Padding(
      padding: const EdgeInsets.only(left: 12.0,top: 15.0,bottom: 10.0,right: 12.0),
      child: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(color: Colors.black12,blurRadius: 2,spreadRadius: 0.8)
          ]
        ),
        
        child: Row(
          children: [
            Expanded(child: Container(
              color: Colors.white,
              child:  Padding(
                padding:  const EdgeInsets.only(left: 8.0,right: 8.0),
                child:  TextField(
                  style: dictionaryInput,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search word here",
                    hintStyle: fromHintStyle
                  ),
                  onChanged: (value){
                    if(value.length>1){
                      controller.setText(value);
                    }

                  },
                ),
              ),
            )),
            Obx(()=> InkWell(
                onTap: (){
                  controller.lookUp();
                },
                child: Container(
                  height: Get.height,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topRight:Radius.circular(4.0) ,bottomRight:Radius.circular(4) ),
                    color: controller.inputText.value.length>1?AppColors.primaryColor:Colors.grey.shade700,
                  ),
                  child: const Center(
                    child: Icon(Icons.check,color: Colors.white,size: 30,),
                  ),

                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
