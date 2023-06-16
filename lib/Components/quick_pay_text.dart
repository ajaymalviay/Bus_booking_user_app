import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
class QuickPayText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: locale.quick,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(
                color: white, fontSize: 18,)),
        TextSpan(
            text: locale.pay,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(
                color:white
                , fontSize: 18)),
      ]),
    );
  }
}
