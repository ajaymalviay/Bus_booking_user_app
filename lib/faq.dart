import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Theme/colors.dart';
import 'package:http/http.dart'as http;

import 'model/faqmodel.dart';

class FaQScreen extends StatefulWidget {
  const FaQScreen({Key? key}) : super(key: key);

  @override
  State<FaQScreen> createState() => _FaQScreenState();
}

class _FaQScreenState extends State<FaQScreen> {

  Faqmodel? getFaQ;
  Faq() async {
    var headers = {
      'Cookie': 'ci_session=195222aacbc4ffb278fce93b58a79cb5cb0bd7de'
    };
    var request = http.Request('POST', Uri.parse('https://developmentalphawizz.com/bus_booking/api/get_faqs'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalresponse = await response.stream.bytesToString();
      final jsonresponse = Faqmodel.fromJson(json.decode(finalresponse));
      print("This is final............${finalresponse}");
      print("__________________${jsonresponse}");
      setState(() {
        print("Thisisanswerrrrrrrrrrr${getFaQ?.data?[0].question}");

        getFaQ = jsonresponse;
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
    Faq();
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primary,
            title: Text("FAQs"),
          ),
          body: getFaQ == null || getFaQ == "" ? Center(child: Text('Data Not Available'),)
          :Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: getFaQ?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListTile(
                                title: Text("${getFaQ?.data?[0].question}"),
                                subtitle:
                                Text("${getFaQ?.data?[0].answer}",
                                  style: TextStyle(
                                      fontSize: 12, color: hintColor),
                                ),

                              ),
                              index != 2
                                  ? Divider(thickness: 6)
                                  : SizedBox.shrink(),
                            ],
                          );
                        }),
                  ],
                ),
      );
    }
}
