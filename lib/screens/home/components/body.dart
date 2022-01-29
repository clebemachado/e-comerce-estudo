import 'package:flutter/material.dart';

import 'package:onboarding_screen/constants.dart';
import 'package:onboarding_screen/screens/home/components/icons_btn_with_count.dart';
import 'package:onboarding_screen/screens/home/components/seach_field.dart';
import 'package:onboarding_screen/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(10)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SeacherField(),
                    IconBtnWithCounter(
                      svgSrc: "assets/icons/Cart Icon.svg",
                      press: () {},
                    ),
                    IconBtnWithCounter(
                      svgSrc: "assets/icons/Bell.svg",
                      numOfItems: 3,
                      press: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

