import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Components/winter_sale_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class PhoneRechargePage extends StatefulWidget {
  @override
  _PhoneRechargePageState createState() => _PhoneRechargePageState();
}

class _PhoneRechargePageState extends State<PhoneRechargePage> {
  bool postpaid = false;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: white),
        title: Text(
          locale.phoneRecharge!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700,color: white),
        ),
      ),
      body: FadedSlideAnimation(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        locale.prepaid!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              activeColor: Theme.of(context).primaryColorLight,
                              trackColor: Theme.of(context).primaryColorLight,
                              value: postpaid,
                              onChanged: (value) {
                                setState(() {
                                  postpaid = !postpaid;
                                });
                              })),
                      Text(
                        locale.postpaid!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: EntryField(
                        locale.enterPhoneNumber,
                        Icon(
                          Icons.perm_contact_cal,
                          color: Theme.of(context).primaryColorLight,
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: EntryField(
                        locale.selectOperator, Icon(Icons.keyboard_arrow_down)),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: EntryField(
                        locale.amount! + '(\₹)',
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
                          child: Text(
                            "View plans",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Theme.of(context).primaryColorLight),
                          ),
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: EntryField("CashBack", null),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 12),
                    child: CustomButton(locale.payViaQuickpay),
                  ),
                  // WinterSaleBanner(),
                  Spacer(
                    flex: 5,
                  ),
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
