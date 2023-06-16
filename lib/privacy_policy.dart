import 'dart:convert';

import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'Theme/colors.dart';
import 'package:http/http.dart'as http;

import 'helper/apiservices.dart';
import 'model/Get_privacy_police_model.dart';
import 'model/getsettingmodel.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  
  GetPrivacyPoliceModel? getPrivacyPoliceModel;
  getPrivacyPolicy() async {
    var headers = {
      'Cookie': 'ci_session=b1b0eba7591b38a7c05bf68eb6d0af9154aa441e'
    };
    var request = http.Request('GET', Uri.parse('${ApiService.getPrivacyPolicy}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
     final result =  await response.stream.bytesToString();
     final finalResult = GetPrivacyPoliceModel.fromJson(jsonDecode(result));
     print('_____ssss_____${finalResult}_________');
     setState(() {
       getPrivacyPoliceModel = finalResult;
     });
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrivacyPolicy();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primary,
          title: Text("Privacy Policy"),
        ),
        body: getPrivacyPoliceModel == null || getPrivacyPoliceModel!.setting! == '' ?Center(child: CircularProgressIndicator()): Html(
            data:"${getPrivacyPoliceModel!.setting!.discription}"
        )
    );
  }
}
