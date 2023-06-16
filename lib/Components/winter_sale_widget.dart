import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class WinterSaleBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Stack(
      children: [
        FadedScaleAnimation(child: Image.asset(
          'assets/imgs/Layer 1458.png',
          height: 140,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        )),
        Positioned.directional(
            end: 15,
            top: 25,
            textDirection: Directionality.of(context),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  locale.winterSale!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(letterSpacing: 2),
                ),
                Text(
                  locale.flat50Off!,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      locale.shopNow!.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: blackColor),
                    ))
              ],
            ))
      ],
    );
  }
}
