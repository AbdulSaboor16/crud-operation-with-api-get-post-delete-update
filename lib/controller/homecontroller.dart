import 'dart:convert';

import 'package:apiworking/model/homemodel.dart';
import 'package:http/http.dart' as http;


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


deleteUser({required id}) async {
  await http.delete(
    Uri.parse('https://maaz-api.tga-edu.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}


updateUser(id, data) async {
  var url = "https://maaz-api.tga-edu.com/api/users/$id";
  var baseURL = Uri.parse(url);
  final response = await http.put(baseURL,
      body: jsonEncode(data), headers: {'content-type': 'application/json'});
  print(response.body);
  return response;
}