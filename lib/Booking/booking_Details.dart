import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/model/bus_model/booked_bus_list_data_response.dart';

import '../Theme/colors.dart';

class BookingDetals extends StatefulWidget {
  const BookingDetals({Key? key, this.bookedListData, this.name}) : super(key: key);
   final BookedListData? bookedListData ;
  final String? name;

  @override
  State<BookingDetals> createState() => _BookingDetalsState();
}

class _BookingDetalsState extends State<BookingDetals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(title: Text("${widget.name}"),
        backgroundColor: primary,
        centerTitle: true,),
      body:deatilCard(widget.bookedListData! ),
    );
  }
}

Widget deatilCard(BookedListData bookedListData){



  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Id :'),
                Text("${bookedListData.id.toString().toUpperCase()}")
              ],),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Booking Date :'),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "${bookedListData.bookingDate.toString().substring(0,10)}",
                  style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "START FORM",
                  style: TextStyle(color: primary),
                ),
                Text("${bookedListData.fromCity} - ${bookedListData.toCity}"),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vehicle Type :'),
                Text("${bookedListData.type.toString().toUpperCase()}")
              ],),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [/*Text("5h 02"),*/ Text("Status :"), Text( bookedListData.status == '0' ? 'Confirmed' : 'Complete')],
            ),
            
            SizedBox(
              height: 5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price :", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("₹ ${bookedListData.amount}", style: TextStyle(fontWeight: FontWeight.bold),),

              ],
            ),
            SizedBox(height: 10,),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookedListData.passengerDetails?.length ?? 0,
              itemBuilder: (context, index) {
                var item = bookedListData.passengerDetails?[index];
                return Card(
                  elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [Text(
                        "Name: ",
                        style: TextStyle(color: primary),
                      ),Text(
                        "${item?.name}",
                        style: TextStyle(color: primary),
                      )],),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("SeatNo."),
                          Text("${item?.seatNo}", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Booking Id"),
                          Text("${item?.bookingId}", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),*/
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gender"),
                          Text("${item?.gender}", style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),

                    ],
                  ),
                ),
              );
              },),
          ],
        ),
      ),
    ),
  );
}
