import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/default_button.dart';
import 'package:onboarding_screen/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          Text(
            "Login Success",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(30),
                color: Colors.black),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to Home",
              press: () {},
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
