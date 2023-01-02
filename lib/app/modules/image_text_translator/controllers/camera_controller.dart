

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:translator/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:translator/app/modules/image_text_translator/views/crop_image.dart';
class CameraControllers extends GetxController {
  //TODO: Implement CameraController
   late List<CameraDescription> _cameras;
   late CameraController controller;
   DashboardController dashboardController=Get.put(DashboardController());
   XFile? file;
   RxBool isInitialized=false.obs;
RxBool flashOn=false.obs;
  @override
  void onInit() async{
   dashboardController.selectedIndex.value==2?await getCamera(): {};
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
  void disposeCamera(){
    if(isInitialized.value==true){
      controller.dispose();
      isInitialized.value=false;
    }

  }
  void initializeCamera(){
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      isInitialized.value=true;
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  void capturePicture()async{
   file= await controller.takePicture();
   offFlash();

   Get.to(()=>CropImage(file: file,));
  }
  Future<void> getCamera() async {
    _cameras = await availableCameras();
    initializeCamera();
  }
   void onFlash(){
    controller.setFlashMode(FlashMode.torch);
    flashOn.value=true;
   }
   void offFlash(){
     controller.setFlashMode(FlashMode.off);
     flashOn.value=false;
   }
}
