import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'login_interactor.dart';
import 'login_ui.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  Widget build(BuildContext context) {
    return LoginUI();
  }

  @override
  void loginWithMobile(String isoCode, String mobileNumber) {
    Navigator.pushNamed(context, LoginRoutes.verification);
  }

  @override
  void signUp() {
    Navigator.pushNamed(context, LoginRoutes.registration);
  }

  @override
  void forgotPassword() {
    Navigator.pushNamed(context, LoginRoutes.forgotPassword);
  }

}
