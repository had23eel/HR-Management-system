


import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class AdminLeaveConteroller {

  Future<void> adminLeaveConteroller(String start , String end) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    var token = prefs.get(key)??0;
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'    };
    var request = http.MultipartRequest('POST', Uri.parse('http://192.168.6.48:8000/api/leave/store'));
    request.fields.addAll({
      'type_of_leave_id': '3',
      'date_of_leave': '$start',
      'ending_date_of_leave': '$end'
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
