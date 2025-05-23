import Flutter
import UIKit
import flutter_local_notifications
import FirebaseCore
import FirebaseMessaging  
import FirebaseAuth
import GoogleSignIn

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
       FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
        GeneratedPluginRegistrant.register(with: registry)
    }

  
      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    
    FirebaseApp.configure()
    application.registerForRemoteNotifications()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken:Data){
      Messaging.messaging().apnsToken = deviceToken
      print("Token: \(deviceToken)")
      
      super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
      
  }
  
}

