import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_pay/Booking/booking_Details.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/model/bus_model/booked_bus_list_data_response.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyBookingsPage extends StatefulWidget {
  @override
  _MyBookingsPageState createState() => _MyBookingsPageState();
}
class _MyBookingsPageState extends State<MyBookingsPage> {

  bool isLoading = false ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    grtBookedList();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("My Booking",
          // locale.favorites!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20,color: white),
        ),
        iconTheme: IconThemeData(color: white),
        /*actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],*/
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            //Text("${bookedSeatsData?.data?.length} BOOKING FOUND"),
            SizedBox(
              height: 20,
            ),
            isLoading ? Center(child: CircularProgressIndicator(),) : bookedSeatsData?.data?.isEmpty ?? true ? Center(child: Text('Booking not available'),) : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookedSeatsData?.data?.length ?? 0,
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(
                color: Colors.black,
              ),
              itemBuilder: (BuildContext context, int index) {
                var item = bookedSeatsData?.data?[index];
                return InkWell(
                  onTap: () {
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusBookingPage(id: item.id.toString(),date:  widget.date,)));*/
                  },
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookingDetals(bookedListData: item, name: 'Booking Details'),));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "START FORM",
                              style: TextStyle(color: primary),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${item?.fromCity} - ${item?.toCity}"),
                                Text("₹ ${item?.amount}", style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [/*Text("5h 02"),*/ Text("Date: ${item?.bookingDate.toString().substring(0,10)}")],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Icon(Icons.bus_alert),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "${item?.pickupAddress}",
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text("${item?.type?.toUpperCase()}")
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),

      // FadedSlideAnimation(
      //   child: SingleChildScrollView(
      //       physics: BouncingScrollPhysics(),
      //       child: MallProductGridView(
      //         isFavourite: true,
      //       )),
      //   beginOffset: Offset(0, 0.3),
      //   endOffset: Offset(0, 0),
      //   slideCurve: Curves.linearToEaseOut,
      // ),
    );
  }

  BookedListDataResponse? bookedSeatsData ;
  grtBookedList() async{
    setState(() {
      isLoading = true ;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

   var headers = {
      'Cookie': 'ci_session=e2825aa2d7ee948b16c43a9cd734184b5ff97502'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.bookings));
    request.fields.addAll({
      'user_id': userId ?? '67'
    });

    request.headers.addAll(headers);
    print('${request.fields}');
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     var result = await response.stream.bytesToString();
     print('${result}');
     var finalResult = BookedListDataResponse.fromJson(jsonDecode(result));
     setState(() {
       bookedSeatsData = finalResult ;
       isLoading = false ;

     });
    }
    else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false ;
      });
    }

  }

}
//Center(child: Text("No Data Found",style: TextStyle(fontSize: 20),))