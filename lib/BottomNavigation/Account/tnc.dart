import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:http/http.dart'as http;

import '../../helper/apiservices.dart';

class TncPage extends StatefulWidget {

  @override
  State<TncPage> createState() => _TncPageState();
}

class _TncPageState extends State<TncPage> {
  var trmscondition;

  getSettingApi() async {
    var headers = {
      'Cookie': 'ci_session=eb651cdce0850614d296b81363913b2ca08fe641'
    };
    var request = http.Request('POST', Uri.parse('${ApiService.getSettings}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Privacy PolicyI hereeeeeeeeeeeeeeeeee${trmscondition}");
      final result =  await response.stream.bytesToString();
      final jsonResponse = json.decode(result);
      print("Thiiiiiiiiiiiiiiiiisssssssss${jsonResponse}");

      setState(() {
        trmscondition = jsonResponse['data']['privacy_policy'][0];
      });
      // var FinalResult = GetSettingModel.fromJson(jsonDecode(result));
      // print("thi osoks0  ============>${FinalResult}");
      // setState(() {
      //   settingModel = FinalResult;
      // });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSettingApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primary,
          title: Text("Terms & Condition"),
        ),
        body: trmscondition  == null ? Center(child: Text('Data not available')) :Html(
            data:"${trmscondition}"
        )
    );
  }
}
