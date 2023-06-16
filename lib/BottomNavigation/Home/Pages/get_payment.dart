// import 'dart:convert';
//
// import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:flutter/material.dart';
// import 'package:quick_pay/Theme/colors.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../helper/apiservices.dart';
// import '../../../helper/constant.dart';
// import '../../../model/userprofile.dart';
// import 'package:http/http.dart'as http;
//
// class GetPaymentPage extends StatefulWidget {
//   @override
//   _GetPaymentPageState createState() => _GetPaymentPageState();
// }
//
// class _GetPaymentPageState extends State<GetPaymentPage> {
//
//   Userprofile? getqrcode;
//
//
//   getQRcode() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? id = preferences.getString('id');
//
//
//     var headers = {
//       'Cookie': 'ci_session=7ff77755bd5ddabba34d18d1a5a3b7fbca686dfa'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getUserProfile}'));
//     request.fields.addAll({
//       'user_id': id.toString()
//     });
//     print("This is user request-----------${request.fields}");
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var finalResult = await response.stream.bytesToString();
//       final jsonResponse = Userprofile.fromJson(json.decode(finalResult));
//       print("this is qrresponsessss${finalResult}");
//       print("getuserdetails==============>${jsonResponse}");
//       setState(() {
//         getqrcode = jsonResponse;
//       });
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getQRcode();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     print('${getqrcode?.data?.first.qrcode}________________');
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: primary,
//         iconTheme: IconThemeData(color: white),
//         centerTitle: true,
//         title: Text("QR Code"),
//         // QuickPayText(),
//         // actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
//       ),
//       body: getqrcode == null || getqrcode == ""? Center(child: CircularProgressIndicator(),):
//       FadedSlideAnimation(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Spacer(
//               flex: 8,
//             ),
//             Text(
//               "Scan This code to SabkaWallet",
//               textAlign: TextAlign.center,
//             ),
//             Spacer(),
//             FadedScaleAnimation(child: Image.network(
//               '${getqrcode?.data?[0].qrcode}',
//             )),
//             Spacer(
//               flex: 3,
//             ),
//             Text('${getqrcode?.data?[0].username}'.toUpperCase(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle1!
//                     .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
//                 textAlign: TextAlign.center),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(left: 40,),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('UPI Id : ${getqrcode?.data?[0].upiId}',
//                       style: Theme.of(context).textTheme.subtitle1,
//                       textAlign: TextAlign.center
//                   ),
//                   SizedBox(width: 5,),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 0),
//                     child: Text("Copy", style: Theme.of(context).textTheme.subtitle1,),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 55),
//                     child: Icon(Icons.copy, size: 20, color: primary),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(
//               flex: 8,
//             ),
//             // Padding(
//             //   padding:
//             //       const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
//             //   child: CustomButton(
//             //     locale.downloadQrCode,
//             //     textColor: Theme.of(context).primaryColorLight,
//             //     color: Theme.of(context).scaffoldBackgroundColor,
//             //   ),
//             // ),
//             Spacer(
//               flex: 5,
//             ),
//           ],
//         ),
//         beginOffset: Offset(0, 0.3),
//         endOffset: Offset(0, 0),
//         slideCurve: Curves.linearToEaseOut,
//       ),
//     );
//   }
// }
