import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/ForgotPassword/UI/forgot_password_ui.dart';
import 'package:quick_pay/Routes/routes.dart';
import '../BottomNavigation/Account/language_choose.dart';
import 'Login/UI/login_page.dart';
import 'Registration/UI/registration_page.dart';
import 'Verification/UI/verifiaction_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class LoginRoutes {
  static const String loginRoot = 'login/choose_language';
  static const String loginPage = 'login/login';
  static const String registration = 'login/registration';
  static const String verification = 'login/verification';
  static const String forgotPassword = 'login/forgot';
}

class LoginNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState!.canPop();
        if (canPop) {
          navigatorKey.currentState!.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute:LoginRoutes.loginPage,
        onGenerateRoute: (RouteSettings settings) {
          late WidgetBuilder builder;
          switch (settings.name) {
            // case LoginRoutes.loginRoot:
            //   builder = (BuildContext _) => ChooseLanguage(true);
            //   break;
            case LoginRoutes.loginPage:
              builder = (BuildContext _) => LoginPage();
              break;
            case LoginRoutes.registration:
              builder = (BuildContext _) =>
                  RegistrationPage(settings.arguments as String?);
              break;
            case LoginRoutes.verification:
              builder = (BuildContext _) => VerificationPage(
                    () => Navigator.popAndPushNamed(
                        context, PageRoutes.bottomNavigation),
                  );
              break;
            case LoginRoutes.forgotPassword:
              builder = (BuildContext _) => ForgotPasswordPage(
                    () => Navigator.popAndPushNamed(
                        context, PageRoutes.bottomNavigation),
                  );
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
