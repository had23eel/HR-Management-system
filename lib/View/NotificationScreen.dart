import 'dart:convert';

import 'package:employeee/Model/LeaveModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationScreen extends StatelessWidget {
  final String messagetitle ;
  final messagebody;
  const NotificationScreen({Key? key, required this.messagetitle, required this.messagebody}) : super(key: key);
static const route = '/notification_screen' ;

  @override
  Widget build(BuildContext context) {

    LeaveModel leaveModel = LeaveModel.fromJson(jsonDecode(messagebody));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notification'),

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$messagetitle'),
            SizedBox(height: 20,),
            Text('The start date of leave is :\n ${leaveModel.start_date}'),
            SizedBox(height: 20,),

            Text('The start end of leave is :\n ${leaveModel.end_date}'),
            SizedBox(height: 20,),

            if(leaveModel.reason!="")(Text('the reason for the leave is :\n ${leaveModel.reason}'))
            ,
            SizedBox(height: 20,),

            if(leaveModel.medicalreport!="") (Image.network('http://192.168.43.237:8000/${leaveModel.medicalreport}'))
            ,
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                    color: Colors.greenAccent,
                    width: MediaQuery.of(context).size.width/2.5,

                    child: GestureDetector(

                      onTap: (){

                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(Icons.gpp_good_outlined,size: 24,color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    
                    color: Colors.redAccent,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Icon(Icons.not_interested_rounded,size: 24,color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
