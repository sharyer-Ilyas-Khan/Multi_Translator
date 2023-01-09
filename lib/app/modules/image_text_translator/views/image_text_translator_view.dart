import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:translator/app/data/color_code.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/image_text_translator/views/camera_view.dart';

import '../controllers/camera_controller.dart';
import '../controllers/image_text_translator_controller.dart';

class ImageTextTranslatorView extends GetView<ImageTextTranslatorController> {
  const ImageTextTranslatorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ImageTextTranslatorController controller=Get.put(ImageTextTranslatorController());
    CameraControllers controllers=Get.put(CameraControllers());
    DashboardController dashboardController=Get.put(DashboardController());
    return  Stack(
          children: [
            Obx(()=> dashboardController.selectedIndex.value==2?CameraView():Center(child: CircularProgressIndicator(),)),
            Positioned(
              bottom: Get.height*0.05,
              // left: 0,
              right: Get.width*0.4,
              child: InkWell(
                onTap: (){
                  controllers.capturePicture();
                },
                child: Container(
                  height: Get.height*0.08,
                  width: Get.width*0.2,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                      border: Border.all(color: Colors.white,width: 3),
                    shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color:AppColors.primaryColor,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Get.height*0.065,
              right:  Get.width*0.25,
              child: Obx(()=>controllers.flashOn.value==false?
              InkWell(
                  onTap: (){
                      controllers.onFlash();

                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                        padding:  const EdgeInsets.all(5.0),
                        child: SvgPicture.asset("Assets/svg/torch_ic.svg",color: Colors.blue,height: 30,)
                    ),
                  ),
                ):InkWell(
                  onTap: (){
            controllers.offFlash();

            },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle
                ),
                child: Padding(
                    padding:  const EdgeInsets.all(5.0),
                    child: SvgPicture.asset("Assets/svg/torch_ic.svg",color: Colors.white,height: 30,)
                ),
              ),
            ),
              ),
            ),
            Positioned(
              bottom: Get.height*0.065,
              left: Get.width*0.25,
              child: InkWell(
                onTap: (){
                  controller.pickImage();

                },
                child:Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset("Assets/svg/pickGallery.svg",color: AppColors.primaryColor,height: 20,)
                  ),
                ),
              ),
            ),
          ],
        


    );
  }
}
