import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/BottomNavigation/Home/seats_detail_creen.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/model/bus_model/bus_data_response.dart';



class BookingList extends StatefulWidget {
  const BookingList(
      {Key? key,
      required this.fromCityId,
      required this.toCityId,
      required this.date})
      : super(key: key);
  final String fromCityId;

  final String toCityId;

  final String date;



  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   searchBus();
  }

  List <BusDataList> busDataList = [] ;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Vehicle List"),
        backgroundColor: primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text("${busDataList.length} VEHICLE FOUND"),
            SizedBox(
              height: 20,
            ),
            isLoading ? Center(child: CircularProgressIndicator(),) : busDataList.isEmpty ? Center(child: Column(children: [
              SizedBox(height: 50,),
              Image.asset('assets/imgs/nobusavailable.png')
            ],),) : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: busDataList.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black,
              ),
              itemBuilder: (BuildContext context, int index) {
                var item = busDataList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusBookingPage(id: item.id.toString(),date:  widget.date,type: item.type.toString(),)));
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
                              Text("${item.startTime} - ${item.endTime}"),
                              Text("₹ ${item.amount}", style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [/*Text("5h 02"),*/ Text("${item.availableSeats} seats left")],
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
                                "${item.name}",
                                style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text("${item.type.toString().toUpperCase()}")
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> searchBus() async {
    setState(() {
      isLoading= true ;
    });
    var headers = {
      'Cookie': 'ci_session=ba5b65aa074927b9d9c1a401ca8edf20b7aeba71'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiService.searchBusAvailable));
    request.fields.addAll({
      'from_city': widget.fromCityId,
      'to_city': widget.toCityId,
      'journey_date': widget.date
    });

    request.headers.addAll(headers);

    print('${request.fields}');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = BusDataResponse.fromJson(jsonDecode(result));

      setState(() {
        busDataList = finalResult.data ?? [] ;
        isLoading= false ;

      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading= false ;
      });
    }
  }

}
