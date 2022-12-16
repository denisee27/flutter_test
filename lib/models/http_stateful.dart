import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HttpStateful {
  String id, fullname, email, avatar;

  HttpStateful(
      {required this.avatar,
      required this.email,
      required this.fullname,
      required this.id});

  static Future<HttpStateful> connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    var data = (json.decode(hasilResponse.body))["data"];

    print(data);
    return HttpStateful(
        avatar: data['avatar'],
        email: data['email'],
        fullname: data['first_name'] + " " + data['last_name'],
        id: data['id']);
  }
}
