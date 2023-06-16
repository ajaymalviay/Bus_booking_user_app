import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/model/getwalletmodel.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'add_money.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  Getwalletmodel? walletData;

   getWallet() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     String? id = preferences.getString("id");

     print('_________________>>>>>>>>>>>>>>>>>>>>>${id}');
     var headers = {
       'Cookie': 'ci_session=8c2275d8af8aa49a38366843cf03ea05190bd53b'
     };
     var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/bus_booking/api/get_wallet_transaction'));
     request.fields.addAll({
       'user_id': id.toString()
     });

     request.headers.addAll(headers);

     http.StreamedResponse response = await request.send();

     if (response.statusCode == 200) {
       var walletresult = await response.stream.bytesToString();
       final finalresponse = Getwalletmodel.fromJson(json.decode(walletresult));
       setState((){
         walletData = finalresponse;
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
    getWallet();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: white),
        title: Text(
          "My Wallet",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700,color:white),
        ),
      ),
      body:
      FadedSlideAnimation(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: 90,
                      width: 170,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, border: Border.all(color: primary)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children:[
                        Text(
                          "Your Current Balance",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                            walletData==null || walletData?.data?.first.amount == ""? Center(child: CircularProgressIndicator(color: primary,),):
                        Text('\₹' + "${walletData?.data?.first.amount}",
                            style: Theme.of(context).textTheme
                                .headline4!
                                .copyWith(color: blackColor),
                            textAlign: TextAlign.center),
                    ]))),
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
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/mywallet.jpg", height: 300, width: 300,),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                    locale.addMoney,
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (C) => AddMoneyUI()));
                    }
                ),
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {
        Navigator.pop(context);

      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
