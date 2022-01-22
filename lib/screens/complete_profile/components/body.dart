import 'package:flutter/material.dart';
import 'package:onboarding_screen/constants.dart';
import 'package:onboarding_screen/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Text(
                "Complete Prodigle",
                style: headingStyle,
              ),
              const Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              const CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              const Text(
                "By continuing yout confirm that you agree \nwith our Term and Condition",
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
