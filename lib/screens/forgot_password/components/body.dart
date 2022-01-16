import 'package:flutter/material.dart';

import '../../../components/no_account_text.dart';
import '../../login_success/login_success_screen.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../size_config.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your  email and we will send \nyou a link to return to your caccount",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              const ForgotPassForm()
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formkey = GlobalKey<FormState>();
  List<String> erros = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            FormError(erros: erros),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            DefaultButton(
                press: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    Navigator.pushNamed(context, LoginSucessScreen.routeName);
                  }
                },
                text: "Continue"),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            const NoAccountText(),
          ],
        ),
      ),
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
