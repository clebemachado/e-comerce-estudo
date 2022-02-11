import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/default_button.dart';

import 'package:onboarding_screen/constants.dart';
import 'package:onboarding_screen/models/product_.dart';
import 'package:onboarding_screen/screens/details/components/colors_dots.dart';
import 'package:onboarding_screen/screens/details/components/product_description.dart';
import 'package:onboarding_screen/screens/details/components/product_image.dart';
import 'package:onboarding_screen/size_config.dart';

import 'top_roundedContainer.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ProductImages(product: product),
            TopRoundedContainer(
              color: Colors.white,
              child: ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
            ),
            TopRoundedContainer(
              color: const Color(0xFFF6F7F9),
              child: Column(
                children: [
                  ColorsDots(product: product),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.15,
                        right: SizeConfig.screenWidth * 0.15,
                        top: getProportionateScreenWidth(10),
                        bottom: getProportionateScreenWidth(40),
                      ),
                      child: DefaultButton(
                        text: ("Add to Cart"),
                        press: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
