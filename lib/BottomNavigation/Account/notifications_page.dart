import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:http/http.dart'as http;
import 'package:quick_pay/helper/apiservices.dart';

import '../../Locale/notificationmodel.dart';
import '../../helper/constant.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class Notification {
  String? title;
  bool read;
  String? time;

  Notification(this.title, this.read, this.time);
}

class _NotificationsPageState extends State<NotificationsPage> {

  Notificationmodel? getnotification;

  getNotification() async {
    var headers = {
      'Cookie': 'ci_session=d178684d099d2928f6636c6820fe7b0e5696e468'
    };
    var request = http.Request('POST', Uri.parse('${ApiService.getNotification}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {

     var finalresponse = await  response.stream.bytesToString();
     final jsonrespomse = Notificationmodel.fromJson(jsonDecode(finalresponse));

     setState(() {
       getnotification = jsonrespomse;
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

    Future.delayed(Duration(milliseconds: 200),(){
      getNotification();
     }
    );
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Notification',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20,color: white),
        ),
        iconTheme: IconThemeData(color: white),
      ),
      body: FadedSlideAnimation(
        child:
        getnotification == null || getnotification == "" ? Center(child: Text('Notification not found'),): ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: getnotification?.total?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  elevation: 0.5,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${getnotification?.data![0].title}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                         Text("${getnotification?.data![index].message}")
                      ],
                    ),
                    trailing: /*_notifications[index].read
                        ? SizedBox.shrink()
                        :*/ CircleAvatar(
                            radius: 5,
                            backgroundColor: newNotificationColor,
                          ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("${getnotification?.data![index].dateSent}",
                        style: TextStyle(height: 0.8),

                      ),
                    ),

                  ),
                ),
              );
            }),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
