import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement FavouritController

  final count = 0.obs;
  late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
