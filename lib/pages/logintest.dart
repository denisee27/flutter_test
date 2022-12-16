import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<UserModel> createUserModel(String email, String password) async {
  final response = await http.post(
    Uri.parse('https://pos.karyaoptima.com/api/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to login.');
  }
}

class UserModel {
  final int id;
  final String email;
  final String password;
  final String token;

  const UserModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }
}

void main() {
  runApp(LoginTest());
}

class LoginTest extends StatefulWidget {
  const LoginTest({Key? key}) : super(key: key);

  @override
  State<LoginTest> createState() {
    return _LoginTestState();
  }
}

class _LoginTestState extends State<LoginTest> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<UserModel>? futureEmail;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: buildColumn(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: emailController,
          decoration: const InputDecoration(hintText: 'Enter Email'),
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(hintText: 'Enter Password'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // handleLogin()
              futureEmail = createUserModel(
                  emailController.text, passwordController.text);
              // futurePassword = createUserModel(passwordController.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }
}
