import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/complete_profile/components/body.dart';

import '../../size_config.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = "/completeProfile";
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: const Body(),
    );
  }
}
