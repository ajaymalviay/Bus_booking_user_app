import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/ForgotPassword/UI/forgot_password_interactor.dart';
import 'package:quick_pay/Routes/routes.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> implements ForgotPasswordInteractor{
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void forgotPassword() {
    Navigator.pushNamed(context, PageRoutes.homePage);
  }

}
