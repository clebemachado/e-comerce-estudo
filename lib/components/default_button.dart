import 'package:flutter/material.dart';
import 'package:onboarding_screen/constants.dart';

import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(64),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          // padding:
          //     MaterialStateProperty.all(const EdgeInsets.all(5)),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18), color: Colors.white),
        ),
      ),
    );
  }
}
