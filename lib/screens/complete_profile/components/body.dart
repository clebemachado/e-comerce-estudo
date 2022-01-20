import 'package:flutter/material.dart';
import 'package:onboarding_screen/components/custom_surfix_icon.dart';
import 'package:onboarding_screen/constants.dart';
import 'package:onboarding_screen/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Complete Prodigle",
              style: headingStyle,
            ),
            const Text(
              "Complete your details or continue \nwith social media",
              textAlign: TextAlign.center,
            ),
            CompleteProfileForm(),
          ],
        ),
      ),
    );
  }
}

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
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => firstName = newValue!,
              decoration: const InputDecoration(
                labelText: "First Name",
                hintText: "Enter your Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSufixIcon(svgIcon: "assets/icons/User.svg"),
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
            ),
          ],
        ),
      ),
    );
  }
}
