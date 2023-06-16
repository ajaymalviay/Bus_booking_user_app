import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/BottomNavigation/Home/home.dart';
import 'package:quick_pay/Components/custom_offers_container.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Components/winter_sale_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/colors.dart';

import 'book_ticket.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Payment> _quickPays = [
      Payment('assets/icons/ic_recharge.png', locale.recharge, () {
        Navigator.pushNamed(context, PageRoutes.phoneRechargePage);
      }),
      Payment('assets/icons/ic_electricity.png', locale.electricity, () {}),
      Payment('assets/icons/ic_gasbill.png', locale.trainTicket, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookTicket(
                      initialIndexTab: 0,
                    )));
      }),
      Payment('assets/icons/ic_waterbill.png', locale.flight, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookTicket(
                      initialIndexTab: 1,
                    )));
      }),
      Payment('assets/icons/ic_bus.png', locale.bus, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookTicket(
                      initialIndexTab: 2,
                    )));
      }),
      Payment('assets/icons/ic_dth.png', locale.dth, () {}),
      Payment('assets/icons/ic_broadband.png', locale.broadband, () {}),
      Payment('assets/icons/ic_more.png', locale.more, () {}),
    ];
    List<String?> _searches = [
      locale.trainBooking,
      locale.youBroadband,
      locale.buyShirt,
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: FadedSlideAnimation(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EntryField(locale.whatReYouLookingFor, null),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    locale.recentSearches!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: hintColor),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _searches.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            _searches[index]!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 14.5),
                          ),
                        );
                      }),
                ],
              ),
            ),
            Divider(
              thickness: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Text(
                locale.quickLinks!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: hintColor),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 85,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _quickPays.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: _quickPays[index].onTap as void Function()?,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Image.asset(
                              _quickPays[index].image,
                              scale: 2.5,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              _quickPays[index].title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Stack(
              children: [
                Image.asset(
                  'assets/imgs/Layer 1194.png',
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 18, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale.saveOnBillPayments!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 135,
                        child: ListView.builder(
                            // padding: EdgeInsets.symmetric(horizontal: 8),
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return CustomOffersContainer();
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
              child: WinterSaleBanner(),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
