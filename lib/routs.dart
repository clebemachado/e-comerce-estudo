
import "package:flutter/widgets.dart";
import 'package:onboarding_screen/screens/forgot_password/forgot_password.dart';
import 'package:onboarding_screen/screens/login_success/login_success_screen.dart';
import 'package:onboarding_screen/screens/sign_in/sign_in_screen.dart';
import 'package:onboarding_screen/screens/splash/splash_screen.dart';

// Para adicionar todas as rotas

final Map<String, WidgetBuilder> routes = {
  SplasScreen.routeName: (context) => const SplasScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSucessScreen.routeName : (context) => const LoginSucessScreen(),
};
