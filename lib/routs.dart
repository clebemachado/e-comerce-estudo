import 'dart:js';

import "package:flutter/widgets.dart";
import 'package:onboarding_screen/screens/splash/splash_screen.dart';

// Para adicionar todas as rotas

final Map<String, WidgetBuilder> routes = {
  SplasScreen.routeName: (context) => const SplasScreen(),
};
