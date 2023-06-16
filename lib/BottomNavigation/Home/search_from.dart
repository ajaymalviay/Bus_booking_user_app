import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Theme/colors.dart';
import 'dart:convert';

import 'package:quick_pay/helper/apiservices.dart';
import 'package:quick_pay/model/bus_model/from_to_location_serach_response.dart';

class BusSearchScreen extends StatefulWidget {

  BusSearchScreen({Key? key, required this.isFrom });

  bool isFrom;

  @override
  _BusSearchScreenState createState() => _BusSearchScreenState();
}

class _BusSearchScreenState extends State<BusSearchScreen> {
  // Declare variables to store the user's input and the search suggestions


  LocationSearchList? _fromLocation;

  final fromController = TextEditingController();
  final toController = TextEditingController();


  FromAndToLocationSarchResponse? fromAndToResponse;

  List <LocationSearchList> locationSearchData = [];
bool isLoading = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: primary,),),
        title: Text("Location", style: TextStyle(color: primary),),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
              children: [
              TextFormField(
              onChanged: (vlaue){
        getSuggestions(vlaue);
        },
          controller: widget.isFrom ? fromController : toController,
          decoration: InputDecoration(
              hintText: widget.isFrom ? 'From' : 'To'
          ),
        ),
        SizedBox(height: 16.0),

                isLoading
            ? Center(child: CircularProgressIndicator(),)
            : locationSearchData.isEmpty ? Center(
          child: Text('No location found'),) : ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: locationSearchData.length,
          itemBuilder: (context, index) =>
              InkWell(onTap: (){
                Navigator.pop(context, [locationSearchData[index], widget.isFrom ? true : false]);
              },
                child: ListTile(
                  title: Text(locationSearchData[index].name ?? ''),),
              ),
          // Button to initiate the search
          /*ElevatedButton(
                onPressed: () {
                  // TODO: Implement search functionality
                },
                child: Text("Search"),
              ),*/
        )],
        ),
      ),
    ),);
  }




  Future<void> getSuggestions(String query) async {
    setState(() {
      isLoading =true ;
    });
    var headers = {
      'Cookie': 'ci_session=ba5b65aa074927b9d9c1a401ca8edf20b7aeba71'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiService.getLocationSearch));
    request.fields.addAll({
      'search_text': query
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print('${request.fields}________');
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = FromAndToLocationSarchResponse.fromJson(json.decode(result));
      setState(() {
        fromAndToResponse = finalResult;
        locationSearchData = finalResult.data ?? [];
        if(locationSearchData.isEmpty){
          locationSearchData.clear() ;
        }


        isLoading = false ;
      });
    } else {
      throw Exception("Failed to load suggestions");
    }
  }

}
