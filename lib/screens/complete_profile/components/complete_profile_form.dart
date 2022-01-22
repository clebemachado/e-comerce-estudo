import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/custom_surfix_icon.dart';
import 'package:onboarding_screen/components/default_button.dart';
import 'package:onboarding_screen/components/form_error.dart';
import 'package:onboarding_screen/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> erros = [];
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;

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
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAdressFormField(),
          FormError(erros: erros),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushNamed(OtpScreen.routeName);
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildAdressFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => address = newValue!,
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressPassError);
          return "";
        }
        return null;
      },
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue!,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhonePassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhonePassError);
          return "";
        }
        return null;
      },
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,
      decoration: const InputDecoration(
        labelText: "Lasta Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      decoration: const InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/User.svg"),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
    );
  }
}
