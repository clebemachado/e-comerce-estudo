import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/details/details_screen.dart';
import 'package:onboarding_screen/screens/home/components/section_title.dart';

import '../../../components/product_card.dart';
import '../../../models/product_.dart';
import '../../../size_config.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                ((index) => ProductCard(
                      product: demoProducts[index],
                      press: () => Navigator.pushNamed(
                          context, DetailScreen.routeName,
                          arguments:
                              ProductsArgurments(product: demoProducts[index])),
                    )),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
