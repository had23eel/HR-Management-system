import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
Future<void> UpdateCarRequest(String id , String reason ,String from , String to ,String Stime,String Etime)
async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final key = 'token';
  var token = prefs.get(key)??0;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.108:8000/api/task/update/$id'));
  request.fields.addAll({

    'from': '$from',
    'destination': '$to',
    'reason': '$reason',
    'start': '$Stime',
    'end': '$Etime'
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