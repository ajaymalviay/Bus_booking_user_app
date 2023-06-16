import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/Verification/UI/verification_interactor.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  @override
  _VerificationUIState createState() => _VerificationUIState();

  VerificationUI(this.verificationInteractor);
}

class _VerificationUIState extends State<VerificationUI> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FadedSlideAnimation(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical -
                  AppBar().preferredSize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    locale.phoneVerification!,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    locale.enter6digitcode! + '\n' + locale.sentOnGivenNum!,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  EntryField(locale.enterCodeHere, null),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8),
                    child:
                        CustomButton(locale.submit!.toUpperCase(), onTap: () {
                      widget.verificationInteractor.verificationDone();
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    locale.codeResend!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  ))
                ],
              ),
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
