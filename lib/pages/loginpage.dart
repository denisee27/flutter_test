import 'package:cobain/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Halaman Login')),
      body: Container(
          child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          ElevatedButton(
              onPressed: () {
                handleSignIn();
              },
              child: Text('Submit'))
        ],
      )),
    );
  }
}
