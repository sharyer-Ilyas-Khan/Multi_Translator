import UIKit
import Flutter
import workmanager
import google_mobile_ads
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      //ads factories

      GeneratedPluginRegistrant.register(with: self)
      // TODO: Register largeNativeAdFactory
          let largeFactory = LargeNativeAdFactory()
          FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
              self, factoryId: "largeNative", nativeAdFactory: largeFactory)
     
    
      
      UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60*15))
          
          WorkmanagerPlugin.setPluginRegistrantCallback { registry in
              GeneratedPluginRegistrant.register(with: registry)
          }
      
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      
      
  }
    
   
}
