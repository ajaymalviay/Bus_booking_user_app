import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/mall_products_grid_view.dart';
import 'package:quick_pay/Components/winter_sale_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/style.dart';

class MensClothing extends StatefulWidget {
  @override
  _MensClothingState createState() => _MensClothingState();
}

class _MensClothingState extends State<MensClothing> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: linearGrad),
            // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              title: Text(
                locale.mensClothing!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
              bottom: TabBar(
                indicatorWeight: 4.0,
                // indicator: ShapeDecoration(
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                // ),
                isScrollable: true,
                // labelPadding: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                tabs: [
                  Tab(
                    text: locale.shirts,
                  ),
                  Tab(
                    text: locale.tShirts,
                  ),
                  Tab(
                    text: locale.jeans,
                  ),
                  Tab(
                    text: locale.trousers,
                  ),
                  Tab(
                    text: locale.pants,
                  ),
                  Tab(
                    text: locale.shorts,
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/ic_search_wt.png',
                      width: 20,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/icons/ic_cart_wt.png',
                        width: 20,
                      )),
                )
              ],
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 110.0),
        ),
        body: TabBarView(
          children: [
            ShirtsCategory(),
            ShirtsCategory(),
            ShirtsCategory(),
            ShirtsCategory(),
            ShirtsCategory(),
            ShirtsCategory(),
          ],
        ),
      ),
    );
  }
}

class ShirtsCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FadedSlideAnimation(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                height: 150,
                child: WinterSaleBanner()),
            MallProductGridView(
              isFavourite: false,
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
