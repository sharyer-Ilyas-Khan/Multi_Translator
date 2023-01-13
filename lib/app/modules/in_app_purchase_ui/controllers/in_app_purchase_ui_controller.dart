import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class InAppPurchaseUiController extends GetxController {



  static  String iapId = "ios.test.purchased";
  List<IAPItem> _items = [];
  bool button=true;
  String _platformVersion = 'Unknown';
  late StreamController<int> _events;
  dynamic _timer;
  bool showDialoge=false;
  int _counter = 0;
  double width=Get.width;
  double height=Get.height;
  late StreamSubscription _purchaseUpdatedSubscription;
  late StreamSubscription _purchaseErrorSubscription;
  late StreamSubscription _conectionSubscription;
  @override
  void onInit() {
    loadPurchase(Get.context);
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

  void loadPurchase(context){
    if(kReleaseMode){ //
      if(Platform.isAndroid){
        iapId = "com.flight.tracker.flight.radar.live";
      }
      if(Platform.isIOS){
        iapId = "widget.productId";
      }
    }
    if(kReleaseMode!=true && Platform.isAndroid){
      iapId = 'android.test.purchased';
      // iapId = 'ios.test.purchased';

    }
    if(kReleaseMode!=true && Platform.isIOS){
      // iapId = 'android.test.purchased';
      iapId = 'ios.test.purchased';

    }
    _events = StreamController<int>();
    _events.add(10);
    initPlatformState(context);
  }
  Future<Null> _getProduct() async {
    try{
      List<IAPItem> items = await FlutterInappPurchase.instance.getProducts([iapId]);
      if(items.isNotEmpty){
        for (var item in items) {
          print(item.toString());
          _items.add(item);
        }

          _items = items;
      }
      else{
        print("list is empty");
      }
    }
    catch(e){
      print(e.toString());
    }


  }
  Future<void> requestPurchase() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getBool("purchased")==false){

        try{
          FlutterInappPurchase.instance.requestPurchase(iapId);
        }
        catch(e){
          print(e.toString());
        }
      }
      else{
        print("Already Purchased");
        FlutterInappPurchase.instance.requestPurchase(iapId);
      }

    } catch (error) {
      print('$error');
    }
    // callEvent("requesting_purchase_white_flight");


  }
  Future<void> initPlatformState(context) async {
    String platformVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   platformVersion = (await FlutterInappPurchase.instance)!;
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }

    // prepare
    var result = await FlutterInappPurchase.instance.initialize();
    print('result: $result');
    await _getProduct();

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;


    // refresh items for android
    try {
      String msg = await FlutterInappPurchase.instance.consumeAll();
      print('consumeAllItems: $msg');
    } catch (err) {
      print('consumeAllItems error: $err');
    }

    _conectionSubscription =
        FlutterInappPurchase.connectionUpdated.listen((connected) {
          print('connected: $connected');
        });

    _purchaseUpdatedSubscription =
        FlutterInappPurchase.purchaseUpdated.listen((productItem) async {
          print('purchase-updated: $productItem');
          if(productItem!.purchaseStateAndroid==PurchaseState.purchased){
            // callEvent("success_purchased_white_flight");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool("purchased", true);
            _startTimer(context);
            showDialog(
                barrierDismissible: false,
                context: context, builder: (_){
              return abortDialog(context);
            });
          }
          if(productItem.transactionStateIOS==TransactionState.purchased){
            // callEvent("success_purchased_white_flight");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool("purchased", true);
            _startTimer(context);
            showDialog(
                barrierDismissible: false,
                context: context, builder: (_){
              return abortDialog(context);
            });
          }
        });

    _purchaseErrorSubscription =
        FlutterInappPurchase.purchaseError.listen((purchaseError) {
          print('purchase-error: $purchaseError');
          // setState((){
          //   fadeButton=false;
          // });
        });



    // requestPurchase("id");
  }

  Widget abortDialog(context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Congratulations",
          style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w900)),
      content: Text(
          "Please restart the app to apply new changes.",
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w900)),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _events.stream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                print(snapshot.data.toString());
                return Text(
                    "Restarting App in ${snapshot.data.toString()} Sec",
                    style: TextStyle(

                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w900));
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextButton(
                onPressed: () {
                  RestartWidget.restartApp(context);
                },
                child: Text("Restart Now")),
          ],
        )
      ],
    );
  }
  void _startTimer(context) {
    _counter = 10;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //setState(() {
      (_counter > 0) ? _counter-- : {
        _timer.cancel(),
        RestartWidget.restartApp(context)
      };
      //});
      print(_counter);
      _events.add(_counter);
    });
  }
}
