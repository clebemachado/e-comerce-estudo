import 'package:flutter/material.dart';
import './components/body.dart';

class LoginSucessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSucessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: Body(),
    );
  }
}
