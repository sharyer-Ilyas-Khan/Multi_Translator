import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:translator/app/modules/splash/bindings/splash_binding.dart';
import 'package:workmanager/workmanager.dart';
import 'app/routes/app_pages.dart';

Future<void>subscribe() async {
  await FirebaseMessaging.instance.subscribeToTopic("com.translator.max.appWidgets");
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase initialization
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseRemoteConfig.instance.ensureInitialized();
  FirebaseMessaging.instance.requestPermission();
  subscribe();
  // print( await FirebaseMessaging.instance.getToken());
  FirebaseMessaging.onMessage.listen(firebaseBackgroundMessage);




  //firebase Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  runApp(
    RestartWidget(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialBinding: SplashBinding(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
Future<void> firebaseBackgroundMessage(RemoteMessage message) async {
// GetBackgroundMessage().firebaseBackgroundMessage(message);

  // print("this is datata-------------");
  // print(message.data);
  // print(message.notification!.apple!.imageUrl);
  // print(message.notification!.apple!.subtitle);
  // print(message.notification!.apple);
}
/// Used for Background Updates using Workmanager Plugin
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    final now = DateTime.now();
    return Future.wait<bool?>([
      HomeWidget.saveWidgetData(
        '',
        '',
      ),
      HomeWidget.saveWidgetData(
        '',
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
      ),
      HomeWidget.updateWidget(
        name: 'HomeWidgetExampleProvider',
        iOSName: 'HomeWidgetExample',
      ),
    ]).then((value) {
      return !value.contains(false);
    });
  });
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget? child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<StatefulWidget> createState() {
    return _RestartWidgetState();
  }
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }


  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child ?? Container (

      ),
    );
  }
}

