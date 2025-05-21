import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogOutController {
static var statuscode;
  void logout () async {
    var status ;
    var token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.get('token');
    var response = await http.get(
      Uri.parse("http://192.168.6.48:8000/api/user/logout"),
      headers: {'Content-Type': 'application/json',
        'Authorization':'Bearer $token'
      },
    );

    var data = json.decode(response.body);
    status = response.body.contains('error');
    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${response.body}');
      prefs.remove('token');
      print('bye');
    }
    }

  }
