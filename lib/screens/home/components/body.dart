import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_screen/screens/home/components/categories.dart';

import 'package:onboarding_screen/screens/home/components/discount_banner.dart';
import 'package:onboarding_screen/screens/home/components/home_header.dart';
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
              SizedBox(height: getProportionateScreenWidth(5)),
              const HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(10)),
              const DiscountBanner(),
              SizedBox(height: getProportionateScreenWidth(10)),
              Categories(),
            ],
          ),
        ),
      ),
    );
  }
}



/*
...List.generate(
            categories.length,
            (index) => CateroryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {},
            ),
          ),


Row(
      children: categories
          .map(
            (e) => CateroryCard(
              icon: e["icon"],
              text: e["text"],
              press: () => () {},
            ),
          )
          .toList(),
    );
*/
