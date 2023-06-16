import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/Registration/UI/registration_ui.dart';
import '../../login_navigator.dart';
import 'register_interactor.dart';

class RegistrationPage extends StatefulWidget {
  final String? phoneNumber;

  RegistrationPage(this.phoneNumber);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    implements RegistrationInteractor {
  @override
  Widget build(BuildContext context) {
    return RegistrationUI();
  }

  @override
  void register(String phoneNumber, String name, String email) {
    Navigator.pushNamed(context, LoginRoutes.verification);
  }

}
