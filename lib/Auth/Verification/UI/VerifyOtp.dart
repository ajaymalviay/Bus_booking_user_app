import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:pinput/pinput.dart';
import 'package:quick_pay/BottomNavigation/Home/home.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BottomNavigation/bottom_navigation.dart';
import '../../../Theme/colors.dart';
import 'package:http/http.dart'as http;

import '../../../helper/constant.dart';

class VerifyOtp extends StatefulWidget {
  final otp;
  final mobile;

  VerifyOtp({Key? key,this.otp,this.mobile}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool isLoading = false;
  bool isloader = false;
  TextEditingController pinController = TextEditingController();

  @override
  verifyOtp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("successsssssssssssss");
    var headers = {
      'Cookie': 'ci_session=1fae43cb24be06ee09e394b6be82b42f6d887269'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.verifyOtp}'));
    request.fields.addAll({
      'mobile': widget.mobile.toString(),
      'otp': widget.otp.toString()
    });
    print("Requestt>>>>>>>${request.fields}");

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalresponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalresponse);
      print("this is final responsesssssssssss${finalresponse}");
      if (jsonresponse['error'] == false){
        int? otp = jsonresponse["otp"];
        String? id = jsonresponse['data']['id'];
        pref.setString('id', id.toString());
        print("tHis is id here ${id.toString()}");
        print("This Is Otp-------${otp.toString()}");
        print("this is final responses${finalresponse}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BottomBar()
            ));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
      }
    }
    else {
    print(response.reasonPhrase);
    }
  }

  final _formKey = GlobalKey<FormState>();

  /*final defaultPinTheme = PinTheme(
    width: 66,
    height: 60,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: primary),
      borderRadius: BorderRadius.circular(50),
    ),
  );*/

  // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  //   borderRadius: BorderRadius.circular(8),
  // );
  //
  // final submittedPinTheme = defaultPinTheme.copyWith(
  //   decoration: defaultPinTheme.decoration.copyWith(
  //     color: Color.fromRGBO(234, 239, 243, 1),
  //   ),
  // );

  // @override


    @override
  // void initState() {
  //   super.initState();
  //   verifyOtp();
  //   // Future.delayed(Duration(seconds: 60)).then((_) {
  //   //   verifyOtp();
  //   //
  //   // });
  //
  // }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form( key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            title: Text(
             "Verification",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 20,color: Colors.white),
            ),
          ),
          body: InkWell(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Code has sent to",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    "+91${widget.mobile}",
                    style: TextStyle(color:  Colors.black,fontWeight:FontWeight.w500,fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "OTP-${widget.otp}",
                    style: TextStyle(color:  Colors.black,fontWeight:FontWeight.bold,fontSize: 16),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Directionality(
                            // Specify direction if desired
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: EdgeInsets.only(left: 40,right: 40),
                              child: SizedBox()/*Pinput(
                                controller: pinController,
                                defaultPinTheme: defaultPinTheme,
                                // focusedPinTheme: ,
                                // submittedPinTheme: submittedPinTheme,
                                validator: (s) {
                                  return s == '${widget.otp}' ? null : 'Pin is incorrect';
                                },
                                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                                showCursor: true,
                                onCompleted: (pin) => print(pin),
                              )*/,
                              // Pinput(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   controller: pinController,
                              //   // focusNode: focusNode,
                              //   androidSmsAutofillMethod:
                              //   AndroidSmsAutofillMethod.smsUserConsentApi,
                              //   listenForMultipleSmsOnAndroid: true,
                              //   // defaultPinTheme: defaultPinTheme,
                              //   // validator: (value) {
                              //   //   return value == '2222' ? null : 'Pin is incorrect';
                              //   // },
                              //   onClipboardFound: (value) {
                              //     debugPrint('onClipboardFound: $value');
                              //     pinController.setText(value);
                              //   },
                              //   hapticFeedbackType: HapticFeedbackType.lightImpact,
                              //   onCompleted: (pin) {
                              //     debugPrint('onCompleted: $pin');
                              //   },
                              //   onChanged: (value) {
                              //     debugPrint('onChanged: $value');
                              //   },
                              //   cursor: Column(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       Container(
                              //         color: colors.whiteTemp,
                              //         margin:  EdgeInsets.only(bottom: 9),
                              //         width: 22,
                              //         height: 1,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Text("Haven't received the verification code?",style: TextStyle(
                      color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold
                  ),),
                  Text("Resend",style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17
                  ),),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 18),
                    child: InkWell(
                        onTap: ()
                        {setState(() {
                            isloader = true;
                          });
                          if(pinController.text== widget.otp){
                            verifyOtp();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter valid otp")));
                            // Fluttertoast.showToast(msg: "Please enter valid otp!");
                          }
                          // if (_formKey.currentState!.validate()) {
                          //   Fluttertoast.showToast(
                          //       msg:
                          //       "Login Success");
                          //   verifyOtp();
                          // } else {
                          //   Fluttertoast.showToast(
                          //       msg:
                          //       "Enter Correct Credentials!");
                          // }
                        },
                        child:  Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [primary, primary],
                                  stops: [0, 1]),
                              color: primary),
                          child:
                          Center(
                              child: Text("Send", style: TextStyle(fontSize: 18, color: Colors.white))),
                        )
                    ),
                  ),
                  // Btn(
                  //   color: Colors.black,
                  //   height: 45,
                  //   width: 300,
                  //   title: 'Done',
                  //   onPress: () {
                  //     // verifyOtp();
                  //     if(pinController.text== widget.otp){
                  //       verifyOtp();
                  //     }else{
                  //       Fluttertoast.showToast(msg: "Please enter valid otp!");
                  //     }
                  //     // Navigator.push(context,
                  //     //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
