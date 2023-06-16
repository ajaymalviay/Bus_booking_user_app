import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/heading_container_widget.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:http/http.dart'as http;

import '../../../model/transactionhistorymodel.dart';

class TransactionPage extends StatefulWidget {
  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
   Transactionhistorymodel? transactionhistory;

  Transaction() async {
    var headers = {
      'Cookie': 'ci_session=08628db3954ee6abd539f30067f0d8ebc43c8a38'
    };
    var request = http.Request('POST', Uri.parse('https://developmentalphawizz.com/bus_booking/api/get_transactions'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalresponse = await response.stream.bytesToString();
      final jsonrespose = Transactionhistorymodel.fromJson(json.decode(finalresponse));
      setState(() {
        transactionhistory = jsonrespose;
      });

      print('this is transaction historyyyyyyy___${jsonrespose}');
      print('this is transaction historyyyyyyy___${finalresponse}');

    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Transaction();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    String balance = "30";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: white),
        title: Text(
          "Transaction History",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700,color: white),
        ),
      ),
      body: transactionhistory == null || transactionhistory == "" ? Center(child: CircularProgressIndicator(),)
      :ListView(
        // physics: BouncingScrollPhysics(),
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          // Text(
          //   "Your Balance",
          //   style: Theme.of(context).textTheme.bodyText2,
          //   textAlign: TextAlign.center,
          // ),
          // SizedBox(
          //   height: 4,
          // ),
          // Text('\₹' + balance.toString(),
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline4!
          //         .copyWith(color: blackColor),
          //     textAlign: TextAlign.center),
          // SizedBox(
          //   height: 30,
          // ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 12,
          //     ),
          //     Expanded(
          //         child: CustomButton(
          //       locale.sendToBank,
          //       textColor: Theme.of(context).primaryColorLight,
          //       color: Theme.of(context).scaffoldBackgroundColor,
          //     )),
          //     SizedBox(
          //       width: 8,
          //     ),
          //     Expanded(child: CustomButton(locale.addMoney)),
          //     SizedBox(
          //       width: 12,
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactionhistory?.data?.length  ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomHeading(
                      heading: locale.today! + ',19 Dec, 2018',
                    ),
                    Card(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: transactionhistory?.data?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    'assets/icons/ic_pay.png',
                                    scale: 2.5,
                                  ),
                                  title: Text("${transactionhistory?.data?[index].message}"),
                            subtitle:
                            Text("${transactionhistory?.data?[index]?.transactionDate}",
                                    style: TextStyle(
                                        fontSize: 12, color: hintColor),
                                  ),
                                  trailing: Text('- \₹ 10'
                                      '.50'),
                                ),
                                index != 2
                                    ? Divider(thickness: 6)
                                    : SizedBox.shrink(),
                              ],
                            );
                          }),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
