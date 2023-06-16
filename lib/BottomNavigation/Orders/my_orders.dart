import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/Theme/style.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: linearGrad),
            // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              title: Text(
                locale.myOrders!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 20),
              ),
              bottom: TabBar(
                indicatorWeight: 4.0,
                // indicator: ShapeDecoration(
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                // ),
                // labelPadding: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                tabs: [
                  Tab(
                    text: locale.all,
                  ),
                  Tab(
                    text: locale.recharge,
                  ),
                  Tab(
                    text: locale.tickets,
                  ),
                  Tab(
                    text: locale.bill,
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
            AllOrdersPage(),
            AllOrdersPage(),
            AllOrdersPage(),
            AllOrdersPage(),
          ],
        ),
      ),
    );
  }
}

class Order {
  String orderNo;
  String price;
  String image;
  String? title;
  String subtitle;

  Order(this.orderNo, this.price, this.image, this.title, this.subtitle);
}

class AllOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final List<Order> _allOrders = [
      Order('221454', '10.00', 'assets/imgs/Layer 1741.png',
          locale.rechargeDone, 'AT&T +1 987 654 3210'),
      Order('114578', '15.00', 'assets/imgs/Layer 1753.png',
          locale.orderedSuccessful, 'Spyware White cotton Shirt'),
      Order('998745', '9.00', 'assets/imgs/Layer 1773.png',
          locale.electricityBillPaid, 'City Power Electricity Board'),
      Order('221454', '14.00', 'assets/imgs/Layer 1741.png',
          locale.rechargeDone, 'At&T +1 987 654 3210'),
      Order('114578', '20.00', 'assets/imgs/Layer 1753.png',
          locale.orderedSuccessful, 'Spyware White cotton Shirt'),
      Order('998745', '10.00', 'assets/imgs/Layer 1773.png',
          locale.electricityBillPaid, 'City Power Electricity Board'),
    ];
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FadedSlideAnimation(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 8),
            itemCount: _allOrders.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      // contentPadding: EdgeInsets.zero,
                      title: Text(
                        locale.orderNum! + _allOrders[index].orderNo,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        '02 Dec 2018, 03:14 pm',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: hintColor),
                      ),
                      trailing: Text(
                        '\$ ' + _allOrders[index].price,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      // contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(_allOrders[index].image),
                      ),
                      title: Text(
                        _allOrders[index].title!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(_allOrders[index].subtitle),
                    ),
                    // Divider(thickness: 8,),
                  ],
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
