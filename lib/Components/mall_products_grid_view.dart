import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/colors.dart';

class Deal {
  String image;
  String? itemName;
  String price;
  Function onTap;

  Deal(this.image, this.itemName, this.price, this.onTap);
}

class MallProductGridView extends StatelessWidget {
  final bool? isFavourite;

  const MallProductGridView({Key? key, this.isFavourite}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Deal> _dealsOfTheDay = [
      Deal('assets/imgs/ecommerce/Layer 1302.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
      Deal('assets/imgs/ecommerce/Layer 1310.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
      Deal('assets/imgs/ecommerce/Layer 1467.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
      Deal('assets/imgs/ecommerce/Layer 1467-1.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
      Deal('assets/imgs/ecommerce/Layer 1302.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
      Deal('assets/imgs/ecommerce/Layer 1310.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
      Deal('assets/imgs/ecommerce/Layer 1467.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
      Deal('assets/imgs/ecommerce/Layer 1467-1.png', locale.spywornCottonShirt,
          '\$9.99', () {}),
    ];
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        shrinkWrap: true,
        itemCount: _dealsOfTheDay.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 6,
            mainAxisSpacing: 8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, PageRoutes.itemInfoPage),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[200]!,
                            spreadRadius: 0.8,
                            blurRadius: 1.5,
                            offset: Offset.fromDirection(1.2, 1.0))
                      ]),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Center(
                        child: FadedScaleAnimation(
                          child: Image.asset(
                            _dealsOfTheDay[index].image,
                            height: 160,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        _dealsOfTheDay[index].itemName!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '\$' + _dealsOfTheDay[index].price,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColorLight),
                      )
                    ],
                  ),
                ),
                isFavourite!
                    ? Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: cartCountBackgroundColor,
                            size: 20,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          );
        });
  }
}
