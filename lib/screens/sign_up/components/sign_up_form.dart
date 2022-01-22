import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/custom_surfix_icon.dart';
import 'package:onboarding_screen/components/default_button.dart';
import 'package:onboarding_screen/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _keyForm = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;
  List<String> erros = [];

  void addError({required String error}) {
    if (!erros.contains(error)) {
      setState(() {
        erros.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (erros.contains(error)) {
      setState(() {
        erros.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
              press: () {
                if (_keyForm.currentState!.validate()) {
                  Navigator.pushNamed(context, CompleteProfile.routeName);
                }
              },
              text: "Continue"),
        ],
      ),
    );
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => confirmPassword = newValue!,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      onChanged: (value) {
        if (password == value) {
          removeError(error: kMatchPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty && !erros.contains(kPassNullError)) {
          return "";
        } else if (password != confirmPassword) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
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
        password = value;
        if (value.isNotEmpty && erros.contains(kPassNullError)) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8 && erros.contains(kShortPassError)) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty && !erros.contains(kPassNullError)) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8 && !erros.contains(kShortPassError)) {
          addError(error: kShortPassError);
          return "";
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
        if (value.isNotEmpty && erros.contains(kEmailNullError)) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            erros.contains(kInvalidEmailError)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty && !erros.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !erros.contains(kInvalidEmailError)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
    );
  }
}
