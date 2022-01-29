import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/login_success/login_success_screen.dart';
import '../../forgot_password/forgot_password.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> erros = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value as bool;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(erros: erros),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.of(context).pushNamed(LoginSucessScreen.routeName);
                }
              },
              text: "Continue"),
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
          return "";
        } else if (value.length < 8 && !erros.contains(kShortPassError)) {
          setState(() {
            erros.add(kShortPassError);
          });
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
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !erros.contains(kInvalidEmailError)) {
          setState(() {
            erros.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
    );
  }
}
