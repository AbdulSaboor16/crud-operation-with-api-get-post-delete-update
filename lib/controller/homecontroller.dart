import 'dart:convert';

import 'package:apiworking/model/homemodel.dart';
import 'package:http/http.dart' as http;

// getUser()async{
//   var link = "https://maaz-api.tga-edu.com/api/users";
//   var url = Uri.parse(link);
//   var response = await http.get(url);
//   var responses = jsonDecode(response.body);
//   var hello = UserDataModel.fromJson(responses);
//   print(hello.data);
//   return hello;
// }

getUsers() async {
  var url = "https://maaz-api.tga-edu.com/api/users";
  var baseURL = Uri.parse(url);
  var response = await http.get(baseURL);
  var responseData = jsonDecode(response.body);
  var user = UserDataModel.fromJson(responseData);
  return user;
}

postUser(Data model) async {
  await http.post(
    Uri.parse('https://maaz-api.tga-edu.com/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(model.toJson()),
  );
}


// deleteUser(String id)async{
//   final http.Response response = await http.delete(
//     Uri.parse('https://maaz-api.tga-edu.com/api/users'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );

//   return response;
// }
// deleteUser(String id) async {
//   var url = "https://maaz-api.tga-edu.com/api/users/$id";
//   Uri uri = Uri.parse(url);
//   final response = await http.delete(uri);
//   print(response.body);
//   return response;
// }

deleteUser({required id}) async {
  await http.delete(
    Uri.parse('https://maaz-api.tga-edu.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

//  updateUser(Data model) async {
//   await http.put(
//     Uri.parse("https://maaz-api.tga-edu.com/api/users"),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(model.toJson()),
//   );
// }


updateUser(id, data) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  var baseURL = Uri.parse(url);
  final response = await http.put(baseURL,
      body: jsonEncode(data), headers: {'content-type': 'application/json'});
  print(response.body);
  return response;
}