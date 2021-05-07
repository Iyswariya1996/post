import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email,String password)async
{
  String url ='http://testapi.pixalive.me/api/login/';
final response=await http.post(url,
    body: {'email':email,'password':password}
  );
var convertedDatatoJson = jsonDecode(response.body);
return convertedDatatoJson;
}