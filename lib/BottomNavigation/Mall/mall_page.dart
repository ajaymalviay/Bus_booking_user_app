import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_options_grid_view.dart';
import 'package:quick_pay/Components/mall_products_grid_view.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/style.dart';

class MallPage extends StatefulWidget {
  @override
  _MallPageState createState() => _MallPageState();
}

class Category {
  String image;
  String? title;
  Function onTap;
  Category(this.image, this.title, this.onTap);
}

class _MallPageState extends State<MallPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Category> _shopCategories = [
      Category('assets/imgs/ecommerce/Layer 1297.png', locale.fashion, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
      Category('assets/imgs/ecommerce/Layer 1298.png', locale.electronics, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
      Category('assets/imgs/ecommerce/Layer 1299.png', locale.phones, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
      Category('assets/imgs/ecommerce/Layer 1300.png', locale.devices, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
      Category('assets/imgs/ecommerce/Layer 1301.png', locale.appliances, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
      Category('assets/imgs/ecommerce/Layer 130o.png', locale.beauty, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
      Category('assets/imgs/ecommerce/Layer 1303.png', locale.sports, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
      Category('assets/imgs/ecommerce/Layer 1304.png', locale.more, () {
        Navigator.pushNamed(context, PageRoutes.shopByCategories);
      }),
    ];
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 16.0, bottom: 4.0),
            decoration: BoxDecoration(
                gradient: linearGrad,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: Image.asset(
                        'assets/icons/ic_cart.png',
                        scale: 2.5,
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: locale.searchProduct,
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
                  child: Text(
                    locale.shopByCategories!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                CustomGridView(_shopCategories)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Image.asset('assets/imgs/Layer 1194.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
                    child: Text(
                      locale.dealsOfTheDay!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  MallProductGridView(isFavourite: false,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}