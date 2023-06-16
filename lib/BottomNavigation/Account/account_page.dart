import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:buy_this_app/buy_this_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/winter_sale_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/style.dart';

import '../../Config/app_config.dart';

class AccountTile {
  String image;
  String? title;
  Function onTap;

  AccountTile(this.image, this.title, this.onTap);
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<AccountTile> accountOptions = [
      AccountTile('assets/icons/account/ic_settings.png', locale.favorites, () {
        Navigator.pushNamed(context, PageRoutes.favouritesPage);
      }),
      AccountTile('assets/icons/account/ic_invite.png', locale.notifications,
          () {
        Navigator.pushNamed(context, PageRoutes.notificationsPage);
      }),
      AccountTile('assets/icons/account/ic_help.png', locale.needHelp, () {
        Navigator.pushNamed(context, PageRoutes.helpPage);
      }),
      AccountTile('assets/icons/account/ic_rate.png', locale.rateUs, () {}),
      AccountTile('assets/icons/account/ic_guideline.png', locale.tnc, () {
        Navigator.pushNamed(context, PageRoutes.tncPage);
      }),
      AccountTile('assets/icons/account/ic_language.png', locale.language, () {
        Navigator.pushNamed(context, PageRoutes.chooseLanguage);
      }),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
              gradient: linearGrad),
          // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              AppBar(
                title: Text(
                  locale.account!,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 20),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.myProfilePage);
                },
                child: Row(
                  children: [
                    Spacer(),
                    Hero(
                      tag: 'dp',
                      child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/imgs/Layer 1032.png')),
                    ),
                    Spacer(),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Sam Smith\n\n',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 22, height: 0.7)),
                      TextSpan(
                          text: locale.viewProfile,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 0.5)),
                    ])),
                    Spacer(
                      flex: 8,
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 170.0),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey[300]!)]),
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: accountOptions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    onTap: accountOptions[index].onTap as void Function()?,
                    leading: FadedScaleAnimation(
                      child: Image.asset(
                        accountOptions[index].image,
                        scale: 2.8,
                      ),
                    ),
                    title: Text(accountOptions[index].title!),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: WinterSaleBanner(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      // floatingActionButton: AppConfig.isDemoMode
      //     ? BuyThisApp.button(
      //         AppConfig.appName,
      //         'https://dashboard.vtlabs.dev/projects/envato-referral-buy-link?project_slug=quickpay_flutter',
      //       )
      //     : null,
      // bottomNavigationBar: AppConfig.isDemoMode
      //     ? Container(
      //         padding: const EdgeInsets.all(2),
      //         child: BuyThisApp.developerRowOpus(
      //             Colors.transparent, Theme.of(context).primaryColor),
      //       )
      //     : const SizedBox.shrink(),
    );
  }
}
