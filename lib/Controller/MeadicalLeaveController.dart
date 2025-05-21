

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class MedicalLeaveController {

  read()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key)??0;
    return value ;
  }
 /* void Medical(String start , String end ,File imageFile)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final token = prefs.get(key) ?? 0;
    var response = http.post(
        Uri.parse('http://192.168.50.56:8000/api/leave/store'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'},
        body: {
          'type_of_leave_id': '1',
          'date_of_leave': '$start',
          'ending_date_of_leave': '$end',
          'medical_report_path': imageFile.readAsBytesSync()
        });
    if (response == 200) {
      print(await response);
      print('asdf');
    }
    else {
      print(response);
    }*/
    Future<void> MedicalLeaves(start,end,imageFile) async {
      print(start);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final key = 'token';
      final token = prefs.get(key) ?? 0;
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'};
      var stream = new http.ByteStream(imageFile!.openRead());
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://192.168.6.48:8000/api/leave/store'));
      request.fields.addAll({
        'type_of_leave_id': '2',
        'date_of_leave': '$start',
        'ending_date_of_leave': '$end'
      });
      // var length = await imageFile!.length();
      request.files.add(await http.MultipartFile.fromPath(
          'medical_report_path', imageFile!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        print('asdf');
        print(response.stream);
      }
      else {
        print(response.reasonPhrase);
      }
    }
  Future<void> MedicalLeavesNo(start,end) async {
    print(start);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final token = prefs.get(key) ?? 0;
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.43.48:8000/api/leave/store'));
    request.fields.addAll({
      'type_of_leave_id': '1',
      'date_of_leave': '$start',
      'ending_date_of_leave': '$end'
    });
    // var length = await imageFile!.length();

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

