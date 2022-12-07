import 'dart:convert';

import 'package:cobain/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final baseurl = 'https://pos.karyaoptima.com/api';

  Future<UserModel> login({
    String email = '',
    String password = '',
  }) async {
    // var url = '$baseurl/auth/login';
    // var headers = <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8'
    // };
    // var body = jsonEncode(<String, String>{
    //   'email': email,
    //   'password': password,
    // });
    // var response = await http.post(
    //   Uri.parse(url),
    //   headers: headers,
    //   body: body,
    // );

    final response = await http.post(
      Uri.parse('$baseurl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];
      UserModel user = UserModel.fromJson(data['user']);
      // user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
