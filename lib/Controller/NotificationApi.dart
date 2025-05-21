import 'dart:convert';

import 'package:employeee/View/NotificationScreen.dart';
import 'package:employeee/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
handleMessage(RemoteMessage? message)
{
if(message==null){ return;}

navigatorkey.currentState?.push(MaterialPageRoute(builder: (BuildContext context) {return NotificationScreen(messagebody:message.notification!.body,messagetitle: message.notification!.title.toString(),); }));

}
Future <void> handleBackgroundMessage(RemoteMessage message)async{
  print('title : ${message.notification?.title}');
}
Future initPushNotification()async
{
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage((message) => handleBackgroundMessage(message));

}
class NotificationApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications ()async{
    FirebaseMessaging.onBackgroundMessage((message) => handleMessage(message));
    initPushNotification();
  }
}