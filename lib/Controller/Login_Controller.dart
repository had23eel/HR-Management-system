import 'dart:convert';
import 'package:employeee/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/LoginModel.dart';

class LoginController {
   LogInModel? logInModel;
  Future<LogInModel?> login(email,  password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'tokenfcm';
    final fcm_token = prefs.get(key)??0;
    var status ;
    print(fcm_token);
    var response = await http.post(
      Uri.parse("http://192.168.1.108:8000/api/user/login"),
      headers: {'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{"email": email, "password": password,"fcm_token":fcm_token.toString()}),
    );

    if(response.body.contains('error')){
      print(response.body);
    }
    final object = response.body;
    var data = json.decode(response.body);
    status = response.body.contains('error');
    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["access_token"]}');
      _save(data["access_token"]);
      //navigatorkey.currentState?.pushNamed('/homepage');
      LogInModel Login= LogInModel.fromJson(jsonDecode(response.body));
      logInModel=Login;
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${Login.userModel.first_name})') ;

    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      //var Login= LogInModel.fromJson(jsonDecode(object));
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString('token',Login.token.toString());
      // prefs.setInt('status_code',response.statusCode.toInt());
      read();
    }

    return logInModel;
  }
_save(String token)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = token;
  prefs.setString(key, value);
}
read()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final key = 'token';
  final value = prefs.get(key)??0;
  print('read : $value');
  return value ;
}

}
readfcm()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final key = 'tokenfcm';
  final value = prefs.get(key)??0;
  print(value);
  return value ;
}