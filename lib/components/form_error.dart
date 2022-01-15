import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.erros,
  }) : super(key: key);

  final List<String> erros;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            erros.length, (idx) => formErrorText(error: erros[idx])));
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenHeight(14),
          width: getProportionateScreenHeight(14),
        ),
        SizedBox(width: getProportionateScreenHeight(10)),
        Text(error),
      ],
    );
  }
}
