import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/complete_profile/components/body.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = "/completeProfile";
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
