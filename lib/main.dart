import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:quick_pay/Auth/Login/UI/login_page.dart';
import 'Locale/language_cubit.dart';
import 'Theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
  runApp(
      Phoenix(
      child: BlocProvider<LanguageCubit>(
    create: (context) => LanguageCubit(),
    child: QuickPay(),
  )));
}

class QuickPay extends StatefulWidget {
  @override
  State<QuickPay> createState() => _QuickPayState();
}

class _QuickPayState extends State<QuickPay> {


  @override
  void initState() {
    // TODO: implement initState
    // Timer(Duration(seconds: 3), () {
    //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));}
    // );
    super.initState();


  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(builder: (context, appLocale) {
      return MaterialApp(
        /*localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],*/
        /*supportedLocales: AppLocalizations.getSupportedLocales(),
        locale: appLocale,*/
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home:LoginPage()
        // id == null ||  id == "" ? LoginNavigator() : AppNavigation(),
        // routes: PageRoutes().routes(),
      );
    });
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_phoenix/flutter_phoenix.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'Auth/login_navigator.dart';
// import 'Locale/language_cubit.dart';
// import 'Locale/locales.dart';
// import 'Routes/routes.dart';
// import 'Theme/style.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   MobileAds.instance.initialize();
//   runApp(Phoenix(
//       child: BlocProvider<LanguageCubit>(
//         create: (context) => LanguageCubit(),
//         child: QuickPay(),
//       )));
// }
// class QuickPay extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LanguageCubit, Locale>(builder: (context, appLocale) {
//       return MaterialApp(
//         localizationsDelegates: [
//           const AppLocalizationsDelegate(),
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: AppLocalizations.getSupportedLocales(),
//         locale: appLocale,
//         debugShowCheckedModeBanner: false,
//         theme: appTheme,
//         home: LoginNavigator(),
//         routes: PageRoutes().routes(),
//       );
//     });
//   }
// }
