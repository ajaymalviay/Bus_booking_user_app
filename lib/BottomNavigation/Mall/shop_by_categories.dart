import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/style.dart';

class ShopByCategories extends StatefulWidget {
  @override
  _ShopByCategoriesState createState() => _ShopByCategoriesState();
}

class _ShopByCategoriesState extends State<ShopByCategories> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: linearGrad),
            // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              title: Text(
                locale.shopByCategories!,
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
                    text: locale.fashion,
                  ),
                  Tab(
                    text: locale.electronics,
                  ),
                  Tab(
                    text: locale.phones,
                  ),
                  Tab(
                    text: locale.devices,
                  ),
                  Tab(
                    text: locale.appliances,
                  ),
                  Tab(
                    text: locale.beauty,
                  ),
                  Tab(
                    text: locale.sports,
                  ),
                  Tab(
                    text: locale.more,
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
            FashionCategory(),
            FashionCategory(),
            FashionCategory(),
            FashionCategory(),
            FashionCategory(),
            FashionCategory(),
            FashionCategory(),
            FashionCategory(),
          ],
        ),
      ),
    );
  }
}

class Category {
  String image;
  String? title;
  String? subtitle;

  Category(this.image, this.title, this.subtitle);
}

class FashionCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Category> _categories = [
      Category('assets/imgs/ecommerce/New folder/Layer 1412.png',
          locale.mensClothing, locale.cat1),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-1.png',
          locale.womensClothing, locale.cat2),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-2.png',
          locale.kidsClothing, locale.cat3),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-3.png',
          locale.footwear, locale.cat4),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-4.png',
          locale.accessories, locale.cat5),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-5.png',
          locale.jewellery, locale.cat6),
      Category('assets/imgs/ecommerce/New folder/Layer 1412.png',
          locale.mensClothing, locale.cat1),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-1.png',
          locale.womensClothing, locale.cat2),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-2.png',
          locale.kidsClothing, locale.cat3),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-3.png',
          locale.footwear, locale.cat4),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-4.png',
          locale.accessories, locale.cat5),
      Category('assets/imgs/ecommerce/New folder/Layer 1412-5.png',
          locale.jewellery, locale.cat6),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FadedSlideAnimation(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 8),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                elevation: 0.2,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.mensClothing);
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  leading: Image.asset(
                    _categories[index].image,
                    scale: 3,
                  ),
                  title: Text(
                    _categories[index].title!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_categories[index].subtitle!),
                ),
              );
            }),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
