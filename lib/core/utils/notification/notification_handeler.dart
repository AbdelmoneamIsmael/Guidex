import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationHelper {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<String> init() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await initializeLocalNotificationPlugn();

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage noti) {
      print("noti: $noti");
      RemoteNotification? notification = noti.notification;
      AndroidNotification? android = noti.notification?.android;

      if (notification != null && android != null) {
        log("notification happppen");
        showNotification(
            id: noti.hashCode,
            title: notification.title,
            body: notification.body);
      }
    });

    if (Platform.isAndroid) {
      return await FirebaseMessaging.instance.getToken() ?? "";
    } else if (Platform.isIOS || Platform.isMacOS) {
      var token = await FirebaseMessaging.instance.getAPNSToken();
      // token = await FirebaseMessaging.instance.getToken();
      return token ?? "";
    } else {
      return "";
    }
  }

  static void showNotification(
      {required int id, String? title, String? body, String? payload}) {
    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails(),
        payload: payload);
  }

  static NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static initializeLocalNotificationPlugn() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }
}
