import 'package:flutter/material.dart';

import 'package:onboarding_screen/models/product_.dart';
import 'package:onboarding_screen/screens/details/components/body.dart';
import 'components/custom_app_bar.dart';
import 'components/row_custom_appbar.dart';

class DetailScreen extends StatelessWidget {
  static String routeName = "/detail";
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsArgurments argurments =
        ModalRoute.of(context)!.settings.arguments as ProductsArgurments;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        child: RowCustomAppBar(
          rating: argurments.product.rating,
        ),
      ),
      body: const Body(),
    );
  }
}

class ProductsArgurments {
  final Product product;
  ProductsArgurments({required this.product});
}
