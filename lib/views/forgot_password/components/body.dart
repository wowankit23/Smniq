import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:nectar/Utils/size_config.dart';
import 'package:nectar/Utils/string_constants.dart';
import 'package:nectar/components/custom_suffix_icon.dart';
import 'package:nectar/components/form_error.dart';
import 'package:nectar/views/sign_in/components/default_button.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call it to initialize MediaQuery
    SizeConfig().init(context);

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: ClipPath(
            child: Container(
              color: Colors.redAccent,
              height: 150,
              width: MediaQuery.of(context).size.width,
            ),
            clipper: WaveClipperTwo(reverse: true),
          ),
        ),

        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    StringConstants.forgotPassword,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    StringConstants.forgotPasswordMessage,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  ForgotPassForm(),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  var _emailFocus = FocusNode();
  var _emailController = TextEditingController();

  var emailValidatorRegExp =
  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            focusNode: _emailFocus,
            controller:  _emailController,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: StringConstants.emailNullError);
              } else if (this.emailValidatorRegExp.hasMatch(value)) {
                removeError(error:StringConstants. invalidEmailError);
              }
              return null;
            },
            validator: (value) {
              if (value.isEmpty) {
                addError(error: StringConstants.emailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: StringConstants.invalidEmailError);
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: StringConstants.email,
              hintText: StringConstants.enterEmail,
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: StringConstants.continuee,
            press: () {

              if (_formKey.currentState.validate()) {
                // show success alert
                _emailController.clear();
                _emailFocus.unfocus();
                showSuccessAlertDialog(context);
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
        ],
      ),
    );
  }

  void showSuccessAlertDialog(BuildContext mContext) {

    Alert(
      context: mContext,
      type: AlertType.success,
      title: StringConstants.success,
      desc: StringConstants.successMessage,
      image: Image.asset("assets/images/success.png"),
      buttons: [
        DialogButton(
          child: Text(
            StringConstants.close,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(mContext);
          },
          width: 120,
        )
      ],
    ).show();
  }


}


