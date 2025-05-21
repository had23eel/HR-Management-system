import 'package:employeee/Controller/NotificationApi.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void listtonotification()
{
  NotificationApi notificationApi = new NotificationApi();
  FirebaseMessaging.onMessage.listen((event) {
    if(event.notification!=null)
    {
      final title = event.notification!.title;
      final body = event.notification!.body;
      notificationApi.initNotifications();
      print('title : $title '
          'body : $body');
    }
  });
}