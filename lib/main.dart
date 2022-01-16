import 'package:flutter/material.dart';
import 'package:onboarding_screen/routs.dart';
import 'package:onboarding_screen/theme.dart';

import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplasScreen.routeName,
      routes: routes,
    );
  }
}
