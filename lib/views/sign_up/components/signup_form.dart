import 'package:flutter/material.dart';
import 'package:nectar/Utils/size_config.dart';
import 'package:nectar/Utils/string_constants.dart';
import 'package:nectar/components/form_error.dart';
import 'package:nectar/views/sign_in/components/default_button.dart';

import '../sign_up_screen.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignupForm> {
  String name;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool _obscurePassword = true;
  var _nameFocus = FocusNode();
  var _emailFocus = FocusNode();
  var _passwordFocus = FocusNode();
  final List<String> errors = [];

  var emailValidatorRegExp =
  RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),

            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: StringConstants.signUp,
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      focusNode: _nameFocus,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
      onFieldSubmitted: (value){
        _nameFocus.unfocus();
        FocusScope.of(context).requestFocus(_emailFocus);
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(StringConstants.nameNullError)) {
          setState(() {
            errors.remove(StringConstants.nameNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(StringConstants.nameNullError)) {
          setState(() {
            errors.add(StringConstants.nameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: StringConstants.name,
        hintText: StringConstants.enterName,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left:15.0, right: 10.0),
          child: Icon(Icons.account_circle),
        ),
      ),
    );
  }


  TextFormField buildEmailFormField() {
    return TextFormField(
      focusNode: _emailFocus,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onFieldSubmitted: (value){
        _emailFocus.unfocus();
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(StringConstants.emailNullError)) {
          setState(() {
            errors.remove(StringConstants.emailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(StringConstants.invalidEmailError)) {
          setState(() {
            errors.remove(StringConstants.invalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(StringConstants.emailNullError)) {
          setState(() {
            errors.add(StringConstants.emailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(StringConstants.invalidEmailError)) {
          setState(() {
            errors.add(StringConstants.invalidEmailError);
          });
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
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left:15.0, right: 10.0),
          child: Icon(Icons.mail_outline),
        ),
      ),
    );
  }


  TextFormField buildPasswordFormField() {
    return TextFormField(
      focusNode: _passwordFocus,
      obscureText: _obscurePassword,
      onSaved: (newValue) => password = newValue,
      onFieldSubmitted: (value){
        _passwordFocus.unfocus();

      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(StringConstants.passwordNullError)) {
          setState(() {
            errors.remove(StringConstants.passwordNullError);
          });
        } else if (value.length >= 8 && errors.contains(StringConstants.shortPasswordError)) {
          setState(() {
            errors.remove(StringConstants.shortPasswordError);
          });
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(StringConstants.passwordNullError)) {
          setState(() {
            errors.add(StringConstants.passwordNullError);
          });
          return "";
        } else if (value.length < 8 && !errors.contains(StringConstants.shortPasswordError)) {
          setState(() {
            errors.add(StringConstants.shortPasswordError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: StringConstants.password,
        hintText: StringConstants.enterPassword,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left:15.0, right: 10.0),
          child: Icon(Icons.lock_open),
        ),
        suffixIcon: IconButton(
          onPressed: () => _togglePasswordVisibility(),
          icon: Icon(
            Icons.remove_red_eye,
            color: this._obscurePassword ? Colors.redAccent : Colors.grey,
          ),
        ),
      ),
    );
  }

}
