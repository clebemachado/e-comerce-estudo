import 'package:flutter/material.dart';
import 'package:onboarding_screen/constants.dart';
import 'package:onboarding_screen/screens/otp/components/otp_form.dart';
import 'package:onboarding_screen/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text("OTP Verification", style: headingStyle),
              const Text("We sent your code to +1 898 860 ***"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              const OtpForm(),
              GestureDetector(
                  child: SizedBox(height: SizeConfig.screenHeight * 0.1)),
              const Text(
                "Resend OTP Code",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
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
    );
  }
}
