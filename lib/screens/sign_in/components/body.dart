import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_screen/components/default_button.dart';
import 'package:onboarding_screen/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'custom_surfix_icon.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SignForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  final List<String> erros = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(erros: erros),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
            text: "Continue",
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => password = newValue!,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      onChanged: (value) {
        if (value.isNotEmpty && erros.contains(kPassNullError)) {
          setState(() {
            erros.remove(kPassNullError);
          });
        } else if (value.length >= 8 && erros.contains(kShortPassError)) {
          setState(() {
            erros.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !erros.contains(kPassNullError)) {
          setState(() {
            erros.add(kPassNullError);
          });
        } else if (value.length < 8 && !erros.contains(kShortPassError)) {
          setState(() {
            erros.add(kShortPassError);
          });
        }
        return null;
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your e-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
      onChanged: (value) {
        log(value);
        if (value.isNotEmpty && erros.contains(kEmailNullError)) {
          setState(() {
            erros.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            erros.contains(kInvalidEmailError)) {
          setState(() {
            erros.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !erros.contains(kEmailNullError)) {
          setState(() {
            erros.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !erros.contains(kInvalidEmailError)) {
          setState(() {
            erros.add(kInvalidEmailError);
          });
        }
        return null;
      },
    );
  }
}
