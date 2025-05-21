import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class Suggestions_Controller{

 void Suggsetions(String text) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   final value = prefs.get('token')??0;

   var token = read();

   var headers = {
     'Accept': 'application/json',
     'Authorization':'Bearer $value'  };
   var request = http.MultipartRequest(
       'POST', Uri.parse('http://192.168.1.108:8000/api/suggestion/store'));
   request.fields.addAll({
     'suggestion': '$text '
   });

   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
     print(await response.stream.bytesToString());
   }
   else {
   print(response.reasonPhrase);
   }

 }
 read()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   final key = 'token';
   final value = prefs.get(key)??0;
   print(value);
   return value ;
 }
}