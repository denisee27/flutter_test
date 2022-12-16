import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cobain/models/http_stateful.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID = $id",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Email = $email",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Name = $name",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            OutlinedButton(
                onPressed: () async {
                  var myresponse = await http
                      .get(Uri.parse('https://reqres.in/api/users/2'));
                  if (myresponse.statusCode == 200) {
                    // print(json.decode(myresponse.body))["data"];
                    Map<String, dynamic> data =
                        json.decode(myresponse.body) as Map<String, dynamic>;
                    print(data);
                    setState(() {
                      id = data['data']['id'].toString();
                      email = data['data']['email'].toString();
                      name = data['data']['first_name'].toString() +
                          " " +
                          data['data']['last_name'].toString();
                    });
                  } else {
                    print("Error");
                    // setState(() {
                    //   hasil = "Data Kosong";
                    // });
                  }
                },
                child: Text('Get Data'))
          ],
        ),
      ),
    );
  }
}
