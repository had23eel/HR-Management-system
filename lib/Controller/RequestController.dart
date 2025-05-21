

import 'dart:convert';

import 'package:employeee/Model/RequestModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
Future<Requests> RequestController()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final value = prefs.get('token') ?? 0;
  var response = await http.get(
    Uri.parse('http://192.168.1.108:8000/api/allrequests'),
    headers: {'Authorization': 'Bearer $value'
    },

  );


  if (response.statusCode == 200) {
    print(await response.body);


    final responsedata = jsonDecode(response.body);
    final Requests list = Requests.fromJson(responsedata);

    return list;
  }
  else {
    throw Exception(' alan and fadi ');
  }


}