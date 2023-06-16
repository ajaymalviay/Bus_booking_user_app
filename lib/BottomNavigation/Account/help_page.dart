import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class NeedHelpPage extends StatefulWidget {
  @override
  _NeedHelpPageState createState() => _NeedHelpPageState();
}

class _NeedHelpPageState extends State<NeedHelpPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(

          'Help',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20,color: white),
        ),
        iconTheme: IconThemeData(color: white),
      ),
      body:FadedSlideAnimation(
    child:  Padding(
      padding :const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16,top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Contact Us',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Mobile : 9828758367',style: TextStyle(fontSize: 15),),
          InkWell(
            onTap: (){
              Uri uri = Uri.parse('tel://<9828758367>');
              launchInBrowser(uri);
            },
              child: Icon(Icons.local_phone_outlined, color: Colors.blue,))
        ],),
          SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('WhatsApp : 9680955912',style: TextStyle(fontSize: 15),),
          InkWell(
            onTap: (){
              Uri uri = Uri.parse("https://wa.me/?text=9680955912");
              launchInBrowser(uri);
            },
              child: Image.asset('assets/whatsapp.png', scale: 17,)),
        ],),
          SizedBox(height: 10,),

        InkWell(
          onTap: (){
            Uri uri = Uri.parse("mailto:comforttourandtravels2023@gmail.com.org?subject=News&body=New plugin");
            launchInBrowser(uri);
          },
            child: Text('Email : comforttourandtravels2023@gmail.com',style: TextStyle(fontSize: 15, color: Colors.blue, decoration: TextDecoration.underline),)),


      ],),
    ),

        beginOffset: Offset(0, 0.3),
    endOffset: Offset(0, 0),
    slideCurve: Curves.linearToEaseOut,
    ),

    // FadedSlideAnimation(
    //     child: ListView.builder(
    //         physics: BouncingScrollPhysics(),
    //         padding: EdgeInsets.symmetric(vertical: 16),
    //         itemCount: _faqs.length,
    //         itemBuilder: (context, index) {
    //           return Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
    //             child: Text(
    //               _faqs[index]!,
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .bodyText2!
    //                   .copyWith(fontSize: 17),
    //             ),
    //           );
    //         }),
    //     beginOffset: Offset(0, 0.3),
    //     endOffset: Offset(0, 0),
    //     slideCurve: Curves.linearToEaseOut,
    //   ),
    );
  }


  Future<void> launchInBrowser(Uri url) async {
    if (await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
