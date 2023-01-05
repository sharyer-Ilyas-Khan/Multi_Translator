import 'dart:io';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:translator/app/controllers/favourite_database_controller.dart';
import 'package:translator/app/controllers/history_database_controller.dart';
import 'package:home_widget/home_widget.dart';
import 'package:workmanager/workmanager.dart';

import '../../../data/text_style.dart';



class DashboardController extends GetxController {

  FavouriteDatabaseController favouriteDatabaseController=Get.put(FavouriteDatabaseController());
  HistoryDatabaseController historyDatabaseController=Get.put(HistoryDatabaseController());
  final  selectedIndex = 0.obs;
  final  extractedText = "".obs;



  TextEditingController _titleController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  void onInit() {
    HomeWidget.setAppGroupId('group.appwudgets');
    HomeWidget.registerBackgroundCallback(backgroundCallback);
    AwesomeNotifications().initialize(
        'resource://drawable/notification_icon',
        [
          // notification icon
          NotificationChannel(
            channelGroupKey: 'basic_test',
            channelKey: 'basic',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            channelShowBadge: false,
            importance: NotificationImportance.High,
          ),
          //add more notification type with different configuration

        ]
    );

    super.onInit();
  }

  @override
  void onReady() {
print("On ready on Ready");
    //on changed
    checkForWidgetLaunch();
    HomeWidget.widgetClicked.listen(launchedFromWidget);
    super.onReady();
  }

  @override
  void onClose() {
    _titleController.dispose();
    _messageController.dispose();
    super.onClose();
  }

 void selectedOption(index){
    selectedIndex.value=index;
 }
 void setText(text){
    extractedText.value=text;
 }
 void showExitDialog(){
    Get.defaultDialog(
      title: "Quit",
      titlePadding: EdgeInsets.only(right: Get.width*0.64,top: 20,left: 20),
      content: Padding(
        padding:  EdgeInsets.only(right: 15,left: 15),
        child: SizedBox(
          height: Get.height*0.12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Are you sure you want to quit? After quit you'll go outside of app.",style: fromHintStyle,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    Get.close(1);
                  }, child:Text("Cancel",style: fromTextStyle,)),
                  SizedBox(width: 10,),
                  TextButton(onPressed: (){
                    if(GetPlatform.isIOS){
                      exit(1);
                    }
                    else{
                      SystemNavigator.pop();
                    }
                  }, child:Text("Okay",style: fromTextStyle)),
                ],
              )
            ],
          ),
        ),
      ),
    );
 }


  /// Called when Doing Background Work initiated from Widget
  @pragma("vm:entry-point")
  void backgroundCallback(Uri? data) async {
    print(data);

    if (data!.host == 'titleclicked') {
      final greetings = [
        'Hello',
        'Hallo',
        'Bonjour',
        'Hola',
        'Ciao',
        '哈洛',
        '안녕하세요',
        'xin chào'
      ];
      final selectedGreeting = greetings[Random().nextInt(greetings.length)];

      await HomeWidget.saveWidgetData<String>('title', selectedGreeting);
      await HomeWidget.updateWidget(
          name: 'HomeWidgetExampleProvider', iOSName: 'HomeWidgetExample');
    }
  }

  sendData() async {
    try {
      return Future.wait([
        HomeWidget.saveWidgetData<String>('title', _titleController.text),
        HomeWidget.saveWidgetData<String>('message', _messageController.text),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
  }

  updateWidget() async {
    try {
      return HomeWidget.updateWidget(
          name: 'HomeWidgetExampleProvider', iOSName: 'HomeWidgetExample');
    } on PlatformException catch (exception) {
      debugPrint('Error Updating Widget. $exception');
    }
  }

  loadData() async {
    try {
      return Future.wait([
        HomeWidget.getWidgetData<String>('title', defaultValue: 'Default Title')
            .then((value) => _titleController.text = value!),
        HomeWidget.getWidgetData<String>('message',
            defaultValue: 'Default Message')
            .then((value) => _messageController.text = value!),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Getting Data. $exception');
    }
  }

  sendAndUpdate() async {
    await sendData();
    await updateWidget();
  }
  void checkForWidgetLaunch() {
    print("checking");
    HomeWidget.initiallyLaunchedFromHomeWidget().then(launchedFromWidget);
  }
  void launchedFromWidget(Uri? uri) {
    if (uri != null) {
      Get.defaultDialog(
        title: 'App started from HomeScreenWidget',
              content: Text('Here is the URI: $uri'),
      );
    }
  }

  void startBackgroundUpdate() {
    Workmanager().registerPeriodicTask('1', 'widgetBackgroundUpdate',
        frequency: Duration(minutes: 15));
  }

  void stopBackgroundUpdate() {
    Workmanager().cancelByUniqueName('1');
  }
}
