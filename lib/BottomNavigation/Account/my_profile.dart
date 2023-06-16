import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/Login/UI/login_page.dart';
import 'package:quick_pay/BottomNavigation/Account/favourites_page.dart';
import 'package:quick_pay/BottomNavigation/Account/help_page.dart';
import 'package:quick_pay/BottomNavigation/Account/tnc.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Components/custom_profile.dart';
import '../../Editeprofile.dart';
import '../../faq.dart';
import '../../model/userprofile.dart';
import 'package:http/http.dart'as http;

import '../../privacy_policy.dart';
import 'notifications_page.dart';
class MyProfilePage extends StatefulWidget {
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

  Userprofile? getprofile;
  String? username;
  String? address;

  getuserProfile() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id  =  preferences.getString('userId');
    username  =  preferences.getString('username');
    address = preferences.getString("address");
    print(username);
    print(address);
    setState(() {

    });

    var headers = {
      'Cookie': 'ci_session=7ff77755bd5ddabba34d18d1a5a3b7fbca686dfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.baseUrl}get_profile'));
    request.fields.addAll({
      'user_id': id.toString()
    });
    print("This is user request-----------${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = Userprofile.fromJson(json.decode(finalResult));
      print("this is final resultsssssssss${finalResult}");

      print("getuserdetails==============>${jsonResponse}");
     setState(() {
       getprofile = jsonResponse;

     });
    }
    else {
      print(response.reasonPhrase);
    }
  }
  void initState(){
    super.initState();
    getuserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: primary,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700, fontSize: 20,color: Colors.white),
        ),
        actions: [
          // TextButton(
          //     onPressed: () {},
          //     child: Text(
          //       locale.update!,
          //       style: Theme.of(context).textTheme.subtitle1!.copyWith(
          //           color: Theme.of(context).primaryColorLight,
          //           fontWeight: FontWeight.w600),
          //     ))
        ],
      ),
      body: SingleChildScrollView(
        child: getprofile == null|| getprofile == ""? Center(child: CircularProgressIndicator(),):
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 35,
                      backgroundImage:
                      NetworkImage('${getprofile?.data?.profilePic}')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('${getprofile?.data?.username}',style: TextStyle(color: primary,fontSize: 20),),
                                InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (c)=>EditeProfile(getprofile))).then((value) {
                                        if(value != null){
                                          getuserProfile();
                                        }
                                      });
                                    },
                                    child: Icon(Icons.edit,color: primary,))
                              ],
                            ),

                            Text('${getprofile?.data?.email}',style: TextStyle(color: primary,fontSize: 20),),
                            // Text(address?? "",style: TextStyle(color: primary,fontSize: 20),),
                            Text("View Profile",style: TextStyle(color: primary),)
                          ],
                        ),

                      ],
                    ),
                  )
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 150,
                  //   color: Theme.of(context).scaffoldBackgroundColor,
                  //   child: Column(
                  //     children: [
                  //       // Spacer(),
                  //       CircleAvatar(
                  //           radius: 55,
                  //           backgroundImage:
                  //               AssetImage('assets/imgs/Layer 1032.png')),
                  //       SizedBox(
                  //         height: 12,
                  //       ),
                  //       Text(locale.changePicture!),
                  //       Spacer(),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(5.0),
            //   child: CustomDrawerTile(tileName: 'Favorites ', tileIcon:Image.asset("assets/imgs/Favorites.png",scale: 1.7,),
            //     onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (c)=>FavouritesPage()));
            //   },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomDrawerTile(tileName: 'Notifications ', tileIcon: Image.asset("assets/imgs/Notifications.png",scale: 1.7,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>NotificationsPage()));
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomDrawerTile(tileName: 'Help Desk? ', tileIcon:Image.asset("assets/imgs/Need Help.png",scale: 1.7,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>NeedHelpPage()));
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomDrawerTile(tileName: 'Rate us ', tileIcon:Image.asset("assets/imgs/Rate us.png",scale: 1.7,),
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (c)=>Rateu()));
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomDrawerTile(tileName: 'Terms & Conditions ', tileIcon:Image.asset("assets/imgs/Terms & Conditions.png",scale: 1.7,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>TncPage()));
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomDrawerTile(tileName: 'Privacy Policy ', tileIcon:Image.asset("assets/imgs/Privacy Policy.png",scale: 1.7,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>Privacy()));
                },),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomDrawerTile(tileName: 'FAQs', tileIcon:Image.asset("assets/imgs/Privacy Policy.png",scale: 1.7,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>FaQScreen()));
                },),
            ),
            SizedBox(height: 17,),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: InkWell(
                onTap: (){
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirm Sign out"),
                            content: Text("Are you sure to sign out from app now?"),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: primary),
                                child: Text("YES"),
                                onPressed: () async {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Logout")));
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    prefs.clear();
                                  });
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                                  // Navigator.pushNamedAndRemoveUntil(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) =>LoginPage()),
                                  // );
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(primary:primary),
                                child: Text("NO"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                },
                child: Row(
                  children: [
                    Image.asset("assets/imgs/log out.png",scale: 1.6,),
                    SizedBox(width: 10,),
                    Text("LogOut",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'Lora' ),)
                  ],
                ),
              ),
            ),
            // SizedBox(height: 100,),
            // Padding(
            //   padding: const EdgeInsets.only(left: 18.0),
            //   child: Row(
            //     children: [
            //       Image.asset("assets/imgs/log out.png",scale: 1.4,),
            //       SizedBox(width: 10,),
            //       Text("LogOut",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,fontFamily: 'Lora' ),)
            //     ],
            //   ),
            // )
            // CustomDrawerTile(tileName: 'Change Password', tileIcon: Image.asset(changepasswordIconR,color: primaryColor, scale: 1.3,), onTap: (){Get.to(ChangePasswordScreen());},),
            // // CustomDrawerTile(tileName: 'Generate Ticket', tileIcon: Image.asset(changepasswordIconR,color: primaryColor, scale: 1.3,),onTap: (){Get.to(GenerateTicket());},),
            // CustomDrawerTile(tileName: 'My Wallet', tileIcon: Image.asset(termsandconditionIconR,color: primaryColor, scale: 1.3,), onTap: (){Get.to(MyWallet());},),
            // // CustomDrawerTile(tileName: 'Support', tileIcon: Image.asset(shareappIconR,color: primaryColor, scale: 1.3,),onTap: (){Get.to(share());},),
            // CustomDrawerTile(tileName: 'Support', tileIcon: Image.asset(shareappIconR,color: primaryColor, scale: 1.3,),onTap: (){Get.to(SupportScreens());},),
            // CustomDrawerTile(tileName: 'Feedback', tileIcon: Image.asset(privactpolicyIconR,color: primaryColor, scale: 1.3,), onTap: (){Get.to(FeedbackScreen());},),
            // /*CustomDrawerTile(tileName: 'Parcel Status', tileIcon: Image.asset(privactpolicyIconR,color: primaryColor, scale: 1.3,), onTap: (){Get.to(ParcelStetus());},),*/
            // //  CustomDrawerTile(tileName: 'Notification', tileIcon: Image.asset(notificationIconR, scale: 1.3,),onTap: (){Get.to(NotificationScreen());}),
            // CustomDrawerTile(tileName: 'Privacy Policy', tileIcon: Image.asset(privactpolicyIconR,color: primaryColor, scale: 1.3,), onTap: (){Get.to(PrivacyPolicyScreen());},),
            // CustomDrawerTile(tileName: 'Terms & Conditions', tileIcon: Image.asset(termsandconditionIconR,color: primaryColor, scale: 1.3,),onTap: (){Get.to(TermsAndConditionScreen());},),
            // CustomDrawerTile(tileName: 'Contact Us', tileIcon: Image.asset(contactusIconR,color: primaryColor, scale: 1.3,), onTap: (){Get.to(const ContactUsScreen());},),
            // CustomDrawerTile(tileName: 'Sign Out', tileIcon: Image.asset(signoutIconR,color: primaryColor, scale: 1.3,),onTap: (){openLogoutDialog();},),
            // Material(
            //   elevation: 0.5,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            //     color: Theme.of(context).scaffoldBackgroundColor,
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Expanded(
            //                 flex: 4,
            //                 child: EntryField(
            //                   locale.firstName,
            //                   null,
            //                   labelText: locale.firstName,
            //                   initialValue: 'Sam',
            //                 )),
            //             Spacer(),
            //             Expanded(
            //                 flex: 4,
            //                 child: EntryField(
            //                   locale.lastName,
            //                   null,
            //                   labelText: locale.lastName,
            //                   initialValue: 'Smith',
            //                 )),
            //           ],
            //         ),
            //         EntryField(
            //           locale.emailAddress,
            //           Image.asset(
            //             'assets/icons/ic_verified.png',
            //             scale: 2,
            //           ),
            //           labelText: locale.emailAddress,
            //           initialValue: 'samsmith@mail.com',
            //         ),
            //         EntryField(
            //           locale.phoneNumber,
            //           Image.asset(
            //             'assets/icons/ic_verified.png',
            //             scale: 2,
            //           ),
            //           labelText: locale.phoneNumber,
            //           initialValue: '+1 987 654 3210',
            //         ),
            //         Row(
            //           children: [
            //             Expanded(
            //                 flex: 4,
            //                 child: EntryField(
            //                   locale.gender,
            //                   null,
            //                   labelText: locale.gender,
            //                   initialValue: locale.male,
            //                 )),
            //             Spacer(),
            //             Expanded(
            //                 flex: 4,
            //                 child: EntryField(
            //                   locale.dateOfBirth,
            //                   null,
            //                   labelText: locale.dateOfBirth,
            //                   initialValue: '23rd Dec, 1990',
            //                 )),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 20,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

