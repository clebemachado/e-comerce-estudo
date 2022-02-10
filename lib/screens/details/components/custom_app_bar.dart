import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  const CustomAppBar(
      {Size preferredSize = const Size.fromHeight(kToolbarHeight),
      Key? key,
      required Widget child})
      : super(key: key, child: child, preferredSize: preferredSize);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}