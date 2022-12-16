import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostPage extends StatefulWidget {
  // const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasil = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HTTP POST')),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
              controller: nameC,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              )),
          SizedBox(
            height: 20,
          ),
          TextField(
              controller: jobC,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Job",
              )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var response = await http.post(
                Uri.parse('https://reqres.in/api/users'),
                body: {"name": nameC.text, "job": jobC.text},
              );
              if (response.statusCode == 201) {
                Map<String, dynamic> data =
                    json.decode(response.body) as Map<String, dynamic>;
                setState(() {
                  hasil = "${data['name']}";
                });
              } else{
                setState(() {
                    json.decode(response)                  
                });
              }
            },
            child: Text("Submit"),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 20),
          Text(hasil),
        ],
      ),
    );
  }
}
