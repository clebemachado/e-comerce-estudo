import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:onboarding_screen/models/Cart.dart';
import 'package:onboarding_screen/size_config.dart';

import 'cart_item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(10),
            ),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0XFFFFE66E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg")
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              child: CartItemCart(
                cart: demoCarts[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
