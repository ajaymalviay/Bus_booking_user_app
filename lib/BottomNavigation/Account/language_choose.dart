import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

import '../../Config/app_config.dart';
import '../../Locale/language_cubit.dart';
import '../../Routes/routes.dart';

class ChooseLanguage extends StatefulWidget {
  final bool fromRoot;

  ChooseLanguage([this.fromRoot = false]);

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  late LanguageCubit _languageCubit;
  String? selectedLocal;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
        builder: (context, currentLocale) {
      selectedLocal ??= currentLocale.languageCode;
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: blackColor),
          title: Text(
            AppLocalizations.of(context)!.language!,
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
        ),
        body: FadedScaleAnimation(
            child: ListView.builder(
          itemCount: AppConfig.languagesSupported.length,
          itemBuilder: (context, index) => RadioListTile(
            value: AppConfig.languagesSupported.keys.elementAt(index),
            groupValue: selectedLocal,
            title: Text(
              AppConfig
                  .languagesSupported[
                      AppConfig.languagesSupported.keys.elementAt(index)]!
                  .name,
            ),
            onChanged: (langCode) =>
                setState(() => selectedLocal = langCode as String),
          ),
        )),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              _languageCubit.setCurrentLanguage(selectedLocal!, true);
              if (widget.fromRoot)
                Navigator.pushNamed(context, LoginRoutes.loginPage);
              else
                Navigator.pop(context);
            },
            child: FadedScaleAnimation(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                    height: 55,
                    child: FadedScaleAnimation(
                      child: CustomButton(AppLocalizations.of(context)!.submit),
                    )),
              ),
            ),
          ),
        ),
      );
    });
  }
}
