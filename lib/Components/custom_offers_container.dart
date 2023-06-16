import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class CustomOffersContainer extends StatefulWidget {
  @override
  _CustomOffersContainerState createState() => _CustomOffersContainerState();
}

class _CustomOffersContainerState extends State<CustomOffersContainer> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return FadedScaleAnimation(
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 15, 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300]!, spreadRadius: 0.5, blurRadius: 0.5)
            ]),
        width: MediaQuery.of(context).size.width / 1.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locale.cashBackEveryHour!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    locale.getCashbackEveryHour!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Spacer(),
                TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                    onPressed: () {},
                    child: Text(
                      locale.knowMore!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12),
                    ))
              ],
            ),
            Spacer(),
            Text(
              '* ' + locale.tncApply!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: hintColor, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
