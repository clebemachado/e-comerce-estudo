
import "package:flutter/widgets.dart";
import 'package:onboarding_screen/screens/sign_in/sign_in_screen.dart';
import 'package:onboarding_screen/screens/splash/splash_screen.dart';

// Para adicionar todas as rotas

final Map<String, WidgetBuilder> routes = {
  SplasScreen.routeName: (context) => const SplasScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
};
