import 'dart:convert';
import 'dart:html';

import 'package:cobain/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final baseurl = 'https://pos.karyaoptima.com/api';

  Future<UserModel> login({
    String email = '',
    String password = '',
  }) async {
    var url = '$baseurl/auth/login';
    var headers = <String, String>{'Content-Type': 'application/json'};
    var body = jsonEncode(<String, String>{
      'email': email,
      'password': password,
    });
    var response = await http.post(
      Uri.parse(url),
      // encoding: Encoding.getByName('utf8'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET, POST, PATCH, DELETE, OPTIONS",
        "Content-Type": "application/json",
      },
      body: body,
    );
    // ignore: avoid_print
    (response.body);

    // final response = await http.post(
    //   Uri.parse('$baseurl/auth/login'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'email': email,
    //     'password': password,
    //   }),
    // );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];
      UserModel user = UserModel.fromJson(data['user']);
      // user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      print('Gagall!');
      throw Exception('Error');
    }
  }
}
