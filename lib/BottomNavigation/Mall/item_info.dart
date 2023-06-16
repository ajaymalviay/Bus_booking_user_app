import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

class ItemInfoPage extends StatefulWidget {
  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var _current = 0;
    List<String> carouselImages = [
      'assets/imgs/ecommerce/Layer 1310.png',
      'assets/imgs/ecommerce/Layer 1467.png',
      'assets/imgs/ecommerce/Layer 1467-1.png'
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: blackColor),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/ic_cart.png',
                    scale: 2.6,
                  ),
                ),
                PositionedDirectional(
                  end: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 6.5,
                    backgroundColor: cartCountBackgroundColor,
                    child: Center(
                        child: Text(
                      '1',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 9),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: FadedSlideAnimation(
        child: Stack(
          children: [
            ListView(
              children: [
                Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0.5,
                  child: Stack(
                    children: [
                      CarouselSlider(
                        items: carouselImages.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(child: Image.asset(i)),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        end: 20.0,
                        bottom: 0.0,
                        child: Row(
                          children: carouselImages.map((i) {
                            int index = carouselImages.indexOf(i);
                            return Container(
                              width: 6.0,
                              height: 6.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Theme.of(context)
                                        .primaryColorLight /*.withOpacity(0.9)*/
                                    : Theme.of(context).hintColor,
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
                Material(
                  elevation: 0.5,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Column(
                      children: [
                        Text(
                          locale.product1!,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        buildItemProperty(
                            context,
                            locale.spywornSuits!,
                            Icon(
                              Icons.favorite_border,
                              size: 20,
                            ),
                            Icon(
                              Icons.share,
                              size: 20,
                            ),
                            textColor: Theme.of(context).hintColor),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Material(
                  elevation: 0.5,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: buildItemProperty(
                        context,
                        locale.selectSize!,
                        Text(
                          locale.xl!,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                        )),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Material(
                  elevation: 0.5,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: buildItemProperty(
                        context,
                        locale.selectColor!,
                        Text(locale.lightBlue!,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nlabore et dolore magna aliqua. Ut enim ad minim veniam.',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Material(
                elevation: 20,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  tileColor: Theme.of(context).scaffoldBackgroundColor,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      '\$9.90',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  trailing: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: 160,
                      child: CustomButton(
                        locale.addToCart,
                        onTap: () {},
                      )),
                ),
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
  Row buildItemProperty(
      BuildContext context, String title, Widget trailing1, Widget trailing2,
      {Color? textColor}) {
    return Row(
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.subtitle1!.copyWith(color: textColor),
        ),
        Spacer(
          flex: 12,
        ),
        GestureDetector(child: trailing1, onTap: () {}),
        Spacer(),
        GestureDetector(child: trailing2, onTap: () {}),
      ],
    );
  }
}
