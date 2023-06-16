import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Routes/routes.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/Theme/style.dart';

class BookTicket extends StatefulWidget {
  final int initialIndexTab;

  const BookTicket({Key? key, required this.initialIndexTab}) : super(key: key);
  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return DefaultTabController(
      initialIndex: widget.initialIndexTab,
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                gradient: linearGrad),
            // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              title: Text(
                locale.bookATicket!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
              bottom: TabBar(
                labelPadding: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                tabs: [
                  buildTab(context, Icon(Icons.water, color: Colors.black12, size: 10,), locale.trainTicket!),
                  buildTab(context, Icon(Icons.gas_meter,color: Colors.black12,),
                      locale.flights!),
                  buildTab(
                      context, Icon(Icons.directions_bus_rounded), locale.bus!),
                ],
              ),
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 110.0),
        ),
        body: TabBarView(
          children: [
            FadedSlideAnimation(
              child: BookTrainTicket(),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              child: BookFlightTicket(),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              child: BookBusTicket(),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ],
        ),
      ),
    );
  }

  Row buildTab(BuildContext context, Icon icon, String title) {
    return Row(
      children: [
        icon,
        Spacer(),
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 11.5, fontWeight: FontWeight.w200),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class BookTrainTicket extends StatefulWidget {
  @override
  _BookTrainTicketState createState() => _BookTrainTicketState();
}

class _BookTrainTicketState extends State<BookTrainTicket> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            EntryField(
                locale.from,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Brooklyn',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 20),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            EntryField(
                locale.to,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Smithtown',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 20)),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            EntryField(
              locale.departDate,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    locale.today!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  ),
                  Text(
                    ' | ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: hintColor),
                  ),
                  Text(
                    locale.tomorrow!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: hintColor),
                  )
                ],
              ),
              prefixIcon: Icon(
                Icons.date_range,
                color: hintColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  buildIconButton(
                      Image.asset(
                        'assets/icons/Vector Smart Object-3.png',
                        scale: 2.5,
                      ),
                      locale.ac!),
                  Spacer(),
                  buildIconButton(
                      Image.asset(
                        'assets/icons/Vector Smart Object-2.png',
                        scale: 2.5,
                      ),
                      locale.nonAc!),
                  Spacer(),
                  buildIconButton(
                      Image.asset(
                        'assets/icons/Vector Smart Object-1.png',
                        scale: 2.5,
                      ),
                      locale.seater!),
                  Spacer(),
                  buildIconButton(
                      Image.asset(
                        'assets/icons/Vector Smart Object.png',
                        scale: 2.5,
                      ),
                      locale.sleeper!),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              locale.searchTrains,
              onTap: () => Navigator.pushNamed(
                  context, PageRoutes.paymentSuccessfulPage),
            ),
          ],
        ),
      ),
    );
  }

  Column buildIconButton(Widget icon, String title) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              border: Border.all(width: 0.2),
              borderRadius: BorderRadius.circular(3)),
          child: icon,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style:
              Theme.of(context).textTheme.caption!.copyWith(color: hintColor),
        )
      ],
    );
  }
}

class BookFlightTicket extends StatefulWidget {
  @override
  _BookFlightTicketState createState() => _BookFlightTicketState();
}

class _BookFlightTicketState extends State<BookFlightTicket> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var roundTrip = false;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    locale.oneWay!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                          activeColor: Theme.of(context).primaryColorLight,
                          trackColor: Theme.of(context).primaryColorLight,
                          value: roundTrip,
                          onChanged: (value) {
                            setState(() {
                              roundTrip = !roundTrip;
                            });
                          })),
                  Text(
                    locale.roundTrip!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              EntryField(
                  locale.from,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'New York(JFK)',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 20),
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              EntryField(
                  locale.from,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Toronto(YTZ)',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 20),
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: EntryField(
                      locale.departDate,
                      null,
                      prefixIcon: Icon(Icons.date_range),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: EntryField(
                      locale.returnDate,
                      null,
                      prefixIcon: Icon(Icons.date_range),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: EntryField(locale.adult, null),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: EntryField(locale.child, null),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: EntryField(locale.infant, null),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              EntryField(
                  locale.classs,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        locale.economy!,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 20),
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        PositionedDirectional(
          bottom: 20,
          start: 20,
          end: 20,
          child: CustomButton(
            locale.searchFlights,
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.paymentSuccessfulPage),
          ),
        ),
      ],
    );
  }
}

class BookBusTicket extends StatefulWidget {
  @override
  _BookBusTicketState createState() => _BookBusTicketState();
}

class _BookBusTicketState extends State<BookBusTicket> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: ListView(
              children: [
                EntryField(
                    locale.from,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Brooklyn',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 20),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                EntryField(
                    locale.to,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Smithtown',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 20)),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                EntryField(
                  locale.departDate,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        locale.today!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColorLight),
                      ),
                      Text(
                        ' | ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: hintColor),
                      ),
                      Text(
                        locale.tomorrow!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: hintColor),
                      )
                    ],
                  ),
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: hintColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: EntryField(locale.adult, null),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: EntryField(locale.child, null),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: EntryField(locale.infant, null),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      buildIconButton(
                          Image.asset(
                            'assets/icons/Vector Smart Object-3.png',
                            scale: 2.5,
                          ),
                          locale.ac!),
                      Spacer(),
                      buildIconButton(
                          Image.asset(
                            'assets/icons/Vector Smart Object-2.png',
                            scale: 2.5,
                          ),
                          locale.nonAc!),
                      Spacer(),
                      buildIconButton(
                          Image.asset(
                            'assets/icons/Vector Smart Object-1.png',
                            scale: 2.5,
                          ),
                          locale.seater!),
                      Spacer(),
                      buildIconButton(
                          Image.asset(
                            'assets/icons/Vector Smart Object.png',
                            scale: 2.5,
                          ),
                          locale.sleeper!),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 20,
            start: 20,
            end: 20,
            child: CustomButton(
              locale.searchBuses,
              onTap: () => Navigator.pushNamed(
                  context, PageRoutes.paymentSuccessfulPage),
            ),
          ),
        ],
      ),
    );
  }

  Column buildIconButton(Widget icon, String title) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              border: Border.all(width: 0.2),
              borderRadius: BorderRadius.circular(3)),
          child: icon,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style:
              Theme.of(context).textTheme.caption!.copyWith(color: hintColor),
        )
      ],
    );
  }
}
