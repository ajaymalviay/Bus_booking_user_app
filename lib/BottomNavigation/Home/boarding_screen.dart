// import 'package:flutter/material.dart';
//
// class BoardingDroppingScreen extends StatefulWidget {
//   const BoardingDroppingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<BoardingDroppingScreen> createState() => _BoardingDroppingScreenState();
// }
//
// class _BoardingDroppingScreenState extends State<BoardingDroppingScreen> {
//   List<String> boardingPoints = [
//     'Point A',
//     'Point B',
//     'Point C',
//   ];
//
//   List<String> droppingPoints = [
//     'Point X',
//     'Point Y',
//     'Point Z',
//   ];
//   String finalSelection = '';
//   String selectedBoardingPoint = '';
//   String selectedDroppingPoint = '';
//
//   void selectBoardingPoint(String point) {
//     setState(() {
//       finalSelection = '';
//       selectedBoardingPoint = point;
//     });
//   }
//
//   void selectDroppingPoint(String point) {
//     setState(() {
//       finalSelection = '';
//       selectedDroppingPoint = point;
//     });
//   }
//
//   void selectFinalPoint(String point) {
//     setState(() {
//       finalSelection = point;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Boarding and Dropping Points'),
//       ),
//       body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Select your boarding and dropping points',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             'Boarding Points',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Column(
//           children: boardingPoints.map((option) {
//             return RadioListTile(
//               title: Text(option),
//               value: selectedBoardingPoint,
//               groupValue: option,
//               onChanged: (value) {
//                 setState(() {
//
//                   selectedDroppingPoint = value.toString();
//                   print('${selectedDroppingPoint}');
//                 });
//               },
//             );
//           }).toList(),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             'Dropping Points',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Column(
//           children: droppingPoints.map((option) {
//             return RadioListTile(
//               title: Text(option),
//               value: option,
//               groupValue: selectedDroppingPoint,
//               onChanged: (value) {
//                 setState(() {
//                   selectedBoardingPoint = value.toString();
//                 });
//               },
//             );
//           }).toList(),
//         ),
//       ]),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:quick_pay/model/bus_model/pickup_drop_data_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/passenger_information.dart';

class BoardingDroppingScreen extends StatefulWidget {
  BoardingDroppingScreen(
      {Key? key,
      this.busId,
      this.travelsName,
      this.amount,
      this.date,
      this.seatNoList, this.fromTime, this.toTime, this.fromAndToCity});

  String? busId, travelsName, amount, date, fromTime, toTime, fromAndToCity;
  List<String>? seatNoList;

  @override
  _BoardingDroppingScreenState createState() => _BoardingDroppingScreenState();
}

class _BoardingDroppingScreenState extends State<BoardingDroppingScreen>
    with SingleTickerProviderStateMixin {
  var _selectedBoardingOption;

  var _selectedDroppingOption;

  late TabController _tabController;

  List<PPoint> _boardingPoints = [];

  List<DPoint> _droppingPoints = [];

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPoints();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back, color: Colors.white,)),
        backgroundColor: Colors.red,
        title: Text(
          'Boarding and Dropping Points',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              child: SizedBox(
                width: MediaQuery.of(context).size.width/3,
                  child: Center(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Text('Boarding', style: TextStyle(fontSize: 20)),
                    _selectedBoardingOption == null
                        ? SizedBox.shrink()
                        :Text('${_selectedBoardingOption.title}'),
                  ],))),
            ),
            Tab(child: SizedBox(
              width: MediaQuery.of(context).size.width/3,
                child: Center(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text('Dropping', style: TextStyle(fontSize: 20), ),
                  _selectedDroppingOption == null
                      ? SizedBox.shrink()
                      :Text('${_selectedDroppingOption.title}'),
                ],)))),
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                _buildBoardingTab(),
                _buildDroppingTab(),
              ],
            ),
    );
  }

  Widget _buildBoardingTab() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Select your boarding point',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Column(
        children: _boardingPoints.map((option) {
          return RadioListTile(
            title: Text(option.title ?? ''),
            value: option,
            groupValue: _selectedBoardingOption,
            onChanged: (value) {
              setState(() {
                _selectedBoardingOption = value;
                _tabController.animateTo(1);
              });
            },
          );
        }).toList(),
      ),
    ]);
  }

  Widget _buildDroppingTab() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Select your boarding point',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Column(
        children: _droppingPoints.map((option) {
          return RadioListTile(
            title: Text(option.title ?? ''),
            value: option,
            groupValue: _selectedDroppingOption,
            onChanged: (value) {

              setState(() {
                if (_selectedBoardingOption == null) {
                  Fluttertoast.showToast(msg: 'Pick first Boarding Point ');
                } else {
                  _selectedDroppingOption = value;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasssengerInformation(
                          amount: widget.amount,
                          seatNoList: widget.seatNoList,
                          travelsName: widget.travelsName,
                          date: widget.date,
                          busId: widget.busId,
                          boarding: _selectedBoardingOption.title.toString(),
                          dropping: _selectedDroppingOption.title.toString(),
                          cityFromAndTo: widget.fromAndToCity,
                          timeFrom: widget.fromTime,
                          timeTo: widget.toTime,

                        ),
                      ));
                }
              });
            },
          );
        }).toList(),
      ),
    ]);
  }

  Future<void> getPoints() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'ci_session=f4f89913a337979e74df18ee17719b79305ee037'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.pickupDrop));
    request.fields.addAll({'bus_id': widget.busId ?? ''});
    print('rrrrrrrrrrrrrrrrrr${widget.busId}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = PickupDropDataResponse.fromJson(jsonDecode(result));

      setState(() {
        _droppingPoints = finalResult.data?.dropPoints ?? [];
        _boardingPoints = finalResult.data?.pickupPoints ?? [];
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
      setState(() {
        isLoading = false;
      });
    }
  }
}
