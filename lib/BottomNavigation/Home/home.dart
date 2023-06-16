import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:quick_pay/BottomNavigation/Account/my_profile.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/add_money.dart';
import 'package:quick_pay/BottomNavigation/Home/search_from.dart';
import 'package:quick_pay/BottomNavigation/Home/seats_detail_creen.dart';

import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Booking/booking_List.dart';
import '../../model/RechrgeModel.dart';
import '../../model/getbannermodel.dart';
import '../../model/userprofile.dart';
import '../Account/notifications_page.dart';
import '../Scan/scan_page.dart';
import 'Pages/MyWallet.dart';
import 'Pages/book_ticket.dart';
import 'Pages/get_payment.dart';
import 'Pages/phone_recharge.dart';
import 'Pages/transactions_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Payment {
  String image;
  String? title;
  Function onTap;
  String? date ;

  Payment(this.image, this.title, this.onTap);
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  int currentindex = 0;
  final _fomKey  =
  GlobalKey<FormState>();


  Getbannermodel? getbannermodel;

  getBanner() async {
    var headers = {
      'Cookie': 'ci_session=83721b31871c96522e60f489ca4e917362cdb60c'
    };
    var request = http.Request('GET', Uri.parse('${ApiService.getSlider}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('_____fdgggggfdg_____${response.statusCode}_________');
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = Getbannermodel.fromJson(json.decode(finalResponse));
      print("aaaaaaaa>>>>>>>>>>>>>$jsonResponse");
      setState(() {
        getbannermodel = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  String? username;
  String? address;
  Userprofile? getprofile;

  getuserProfile() async {
    print("This is user profile${username}");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString('userId');
    username = preferences.getString('username');
    address = preferences.getString("address");
    var headers = {
      'Cookie': 'ci_session=7ff77755bd5ddabba34d18d1a5a3b7fbca686dfa'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse("${ApiService.getUserProfile}"));
    request.fields.addAll({'user_id': id.toString()});

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("This is user request-----------${response.statusCode}");
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = Userprofile.fromJson(json.decode(finalResult));
      print("this is final resultsssssssss${jsonResponse}");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      name = preferences.getString('userName');
      print('${name}________');
      setState(() {
        getprofile = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  RechrgeModel? rechargecard;
  String? name ;

  void initState() {
    super.initState();
    getuserProfile();
    getBanner();
  }

  Future _refresh() {
    return callAPI();
  }

  callAPI() async{
    getuserProfile();
    getBanner();
    
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }



  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  int _currentPost = 0;

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    if (getbannermodel == null) {
    } else {
      for (int i = 0; i < getbannermodel!.data!.length; i++) {
        dots.add(
          Container(
            margin: EdgeInsets.all(1.5),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPost == i ? primary : sconddary),
          ),
        );
      }
    }
    return dots;
  }

  // final formats = DateFormat("yyyy-MM-dd");
  late DateTime journeys;
  var fromLocation;

  var toLocation;

  String? date;

  @override
  Widget build(BuildContext context) {

    print('${getprofile?.data?.profilePic}______');
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: Scaffold(
          key: _refreshIndicatorKey,
          backgroundColor: background,
          body: getprofile == null || getprofile?.data == ""
              ? Center(
                  child: CircularProgressIndicator(
                    color: primary,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 10.7,
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 0.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 0, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyProfilePage()));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              70),
                                                      child:
                                                          //Image.asset("assets/imgs/Layer 1753.png",fit: BoxFit.fill,),
                                                          Image.network(
                                                              "${getprofile?.data?.profilePic}")),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 15),
                                                  child: Text(name?.toUpperCase() ?? '', style: TextStyle(color: Colors.white, fontSize: 20),),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => BusBookingPage(),));
                                              Navigator.push(context, MaterialPageRoute(builder: (c)=> NotificationsPage()));
                                            },
                                            child: Icon(
                                              Icons.notifications,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.maxFinite,
                            child: Stack(children: [
                              _CarouselSlider(),
                              Positioned(
                                bottom: 25,
                                left: 0,
                                right: 0,
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _buildDots(),
                              ),)
                            ],)
                                // getbannermodel == null? Center(child: CircularProgressIndicator(
                                //   color: primary,
                                // )):

                          ),

                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "Book Tickets",
                                      style: TextStyle(
                                          color: blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Card(
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Form(
                                         key: _fomKey,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 8),
                                              child: TextFormField(
                                                readOnly: true,
                                                validator: (value) {
                                                  if(value!.isEmpty){
                                                    return 'Please add from city' ;
                                                  }
                                                },
                                                controller: fromController,
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            BusSearchScreen(
                                                                isFrom: true),
                                                      )).then((value) {
                                                    if (value != null) {
                                                      if (value[1] == true) {
                                                        fromController.text =
                                                            value[0].name;
                                                        fromLocation = value[0];
                                                        setState(() {});
                                                      }
                                                    }
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                    focusColor: primary,
                                                    border: InputBorder.none,
                                                    icon: Icon(Icons
                                                        .directions_bus_outlined),
                                                    hintText: "From"),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.black,
                                            ),

                                            // WidgetComponent.formField(
                                            //   borders: InputBorder.none,
                                            //   label: "From",
                                            //   prefix: Icon(Icons.location_city),
                                            //   controllers: fromController,
                                            //   valids: (value) {  },
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 2, horizontal: 8),
                                              child: TextFormField(
                                                readOnly: true,
                                                validator: (value){
                                                  if(value!.isEmpty){
                                                    return 'Please add to city' ;
                                                  }
                                                },
                                                controller: toController,
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            BusSearchScreen(
                                                                isFrom: false),
                                                      )).then((value) {
                                                    if (value != null) {
                                                      if (value[1] == false) {
                                                        toController.text =
                                                            value[0].name;
                                                        toLocation = value[0];
                                                        setState(() {});
                                                      }
                                                    }
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    icon: Icon(Icons
                                                        .directions_bus_outlined),
                                                    hintText: "To"),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: blackColor,
                                            ),
                                            InkWell(
                                              onTap: () => _selectDate(context),
                                              child: Card(
                                                  elevation: 2.0,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text("Journey Date"),
                                                        DateTimeFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            enabledBorder:
                                                                InputBorder.none,
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black45),
                                                            errorStyle: TextStyle(
                                                                color: Colors
                                                                    .redAccent,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            border:
                                                                OutlineInputBorder(),
                                                            suffixIcon: Icon(
                                                                Icons.event_note),
                                                            // labelText: 'Only time',
                                                          ),
                                                          mode:
                                                              DateTimeFieldPickerMode
                                                                  .date,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          validator: (e) {
                                                            var date = e?.add(
                                                                Duration(
                                                                    hours: 23));
                                                            return (date ??
                                                                        DateTime
                                                                            .now())
                                                                    .isBefore(
                                                                        DateTime
                                                                            .now())
                                                                ? 'Please select date after yesterday'
                                                                : null;
                                                          },
                                                          onDateSelected:
                                                              (DateTime value) {
                                                            print(value);

                                                            date = DateFormat('yyyy-MM-dd').format(value) ;

                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            Divider(
                                              thickness: 1,
                                              color: Colors.black,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if(_fomKey.currentState!.validate()) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BookingList(
                                                                fromCityId:
                                                                    fromLocation
                                                                        .id
                                                                        .toString(),
                                                                toCityId: toLocation
                                                                    .id
                                                                    .toString(),
                                                                date: date ?? '',
                                                              )));
                                                }
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 50,
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        gradient: LinearGradient(
                                                            begin:
                                                                Alignment.topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              primary,
                                                              primary
                                                            ],
                                                            stops: [
                                                              0,
                                                              1
                                                            ]),
                                                        color: primary),
                                                    child:
                                                        // isloader == true ? Center(child: CircularProgressIndicator(color: Colors.white,),) :
                                                        Center(
                                                            child: Text(
                                                                "SEARCH VEHICLE",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    color: Colors
                                                                        .white))),
                                                  )),
                                            ),

                                            SizedBox(
                                              height: 8.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  _CarouselSlider() {
    return Padding(
      padding: EdgeInsets.only(top: 18, bottom: 18, left: 10, right: 10),
      child: getbannermodel == null || getbannermodel == ""
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                height: 180,
                onPageChanged: (position, reason) {
                  setState(() {
                    currentindex = position;
                  });
                  print(reason);
                  print(CarouselPageChangedReason.controller);
                },
              ),
              items: getbannermodel?.data?.map((val) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  // height: 180,
                  // width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "${val.image}",
                        fit: BoxFit.fill,
                      )),
                );
              }).toList(),
            ),
    );
  }

  Future<void> searchBus() async {
    var headers = {
      'Cookie': 'ci_session=ba5b65aa074927b9d9c1a401ca8edf20b7aeba71'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiService.searchBusAvailable));
    request.fields.addAll({
      'from_city': fromLocation.id.toString(),
      'to_city': toLocation.id.toString()
    });

    request.headers.addAll(headers);

    print('${request.fields}');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
