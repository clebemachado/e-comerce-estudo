import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/splash/components/body.dart';
import 'package:onboarding_screen/size_config.dart';

class SplasScreen extends StatelessWidget {
  static String routeName = "/spllash";
  const SplasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
