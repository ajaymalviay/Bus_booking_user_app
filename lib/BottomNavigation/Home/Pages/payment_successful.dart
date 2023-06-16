import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/colors.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 3,
            ),
            FadedScaleAnimation(child: Image.asset(
              'assets/icons/Successful.png',
              height: 160,
            )),
            Spacer(),
            Text(
              locale.paymentSuccessful!,
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              locale.yourBookingConfirmed! + '\n' + locale.withQuickPay!,
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              locale.shareYourBookingDetails!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Theme.of(context).primaryColorLight),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.bottomNavigation);
              },
              child: Text(
                locale.continuee!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: hintColor),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
