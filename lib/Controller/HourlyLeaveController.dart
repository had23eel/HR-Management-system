import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:employeee/Controller/Login_Controller.dart';
class HourlyLeaveConteroller {

  Future<void> hourlyLeaveConteroller(String start , String end, String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    var token = prefs.get(key)??0;
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'    };
    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.6.48:8000/api/leave/store'));
    request.fields.addAll({
      'type_of_leave_id': '9',
      'date_of_leave': '$start',
      'ending_date_of_leave': '$end',
      'reason_for_leave':'$text'
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print('asdf');
    }
    else {
      print(response.reasonPhrase);
    }
  }
}
