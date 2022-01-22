import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onboarding_screen/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text("OTP Verification", style: headingStyle),
          const Text("We sent your code to +1 898 860 ***"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("This code will expired in "),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 30, end: 0),
                duration: const Duration(
                  seconds: 30,
                ),
                builder: (context, value, child) {
                  return Text(
                    "00:${value.toInt()}",
                    style: const TextStyle(color: kPrimaryColor),
                  );
                },
                onEnd: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
