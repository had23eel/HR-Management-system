import 'package:flutter/material.dart';
class AllNotification extends StatefulWidget {
  const AllNotification({Key? key}) : super(key: key);

  @override
  State<AllNotification> createState() => _AllNotificationState();
}

class _AllNotificationState extends State<AllNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification'),
      centerTitle: true ,),

    );
  }
}
