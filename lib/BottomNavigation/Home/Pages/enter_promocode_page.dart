import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Components/heading_container_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class EnterPromoCodePage extends StatefulWidget {
  @override
  _EnterPromoCodePageState createState() => _EnterPromoCodePageState();
}

class _EnterPromoCodePageState extends State<EnterPromoCodePage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: blackColor,
          ),
        ),
      ),
      body: FadedSlideAnimation(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: EntryField(locale.enterPromo, null),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(locale.apply),
            ),
            SizedBox(
              height: 10,
            ),
            CustomHeading(
              heading: locale.offers,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 8),
                        title: Text(
                          'FREECHARGE50',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2.2),
                        ),
                        subtitle: Text(
                          locale.promo! + '\n' + locale.tncApply!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: hintColor, fontSize: 11.5),
                        ),
                      ),
                      Divider(
                        thickness: 6,
                      ),
                    ],
                  );
                })
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
