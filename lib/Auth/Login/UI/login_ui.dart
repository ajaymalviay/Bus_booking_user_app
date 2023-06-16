import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Theme/colors.dart' show background, blackColor, primary, transparentColor;
import '../../../helper/apiservices.dart';
import '../../Registration/UI/registration_ui.dart';
import 'package:http/http.dart' as http;

class LoginUI extends StatefulWidget {

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {

  bool isLoading = false;
  bool isloader = false;
  bool isMobile = false;

  TextEditingController mobileCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();


  getLoginApi() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie': 'ci_session=82d54b12ed7aa11a9ddd2cc054abba94d291adbd'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.login}'));
    request.fields.addAll({
      'mobile': mobileCtr.text,
      'password':passCtr.text
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
    final result = await response.stream.bytesToString();
    final Finalresult = jsonDecode(result);

    if(!(Finalresult['error'])) {
        var id = Finalresult['data']['id'];
        var mobile = Finalresult['data']['mobile'];
        var address = Finalresult['data']['address'];
        var email = Finalresult['data']['email'];
        var userName = Finalresult['data']['username'];


        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("userId", id.toString());
        preferences.setString("mobile", mobile.toString());
        preferences.setString("address", address.toString());
        preferences.setString("userName", userName.toString());
        preferences.setString("email", email.toString());
        String? name = preferences.getString('userName');
        print('${name} _________________name');

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBar()));

        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${Finalresult['message']}")));
      } else {

      setState(() {
        isLoading = false ;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("${Finalresult['message']}")));
    }

    }
    else {
      setState(() {
        isLoading = false ;
      });
    print(response.reasonPhrase);

    }

  }
  // loginwitMobile() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('otp', "otp");
  //   preferences.setString('mobile', "mobile");
  //
  //   print("this is apiiiiiiii");
  //   var headers = {
  //     'Cookie': 'ci_session=b13e618fdb461ccb3dc68f327a6628cb4e99c184'
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse('${ApiService.login}'));
  //   request.fields.addAll({
  //     'mobile': mobileCtr.text,
  //   });
  //   print("Request here${request.fields}");
  //
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     print("this is true response");
  //     var finalresponse = await response.stream.bytesToString();
  //     final jsonresponse = json.decode(finalresponse);
  //     print("this is final response${finalresponse}");
  //     // Future.delayed(Duration(seconds: 1)).then((_) {
  //     //   Navigator.pushReplacement(
  //     //       context,
  //     //       MaterialPageRoute(
  //     //           builder: (context) => VerifyOtp()
  //     //       ));
  //     // });
  //     if (jsonresponse['error'] == false) {
  //       int? otp = jsonresponse["otp"];
  //       String mobile = jsonresponse["mobile"];
  //
  //       print("otpppp${otp.toString()}");
  //       print("mobilee${mobile.toString()}");
  //       // print("This is urllllllllllllllll${baseUrl}");
  //       print("this is final response${finalresponse}");
  //
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
  //
  //       setState(() {
  //
  //       });
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => VerifyOtp(otp: otp.toString(), mobile:mobile.toString() ,)
  //           ));
  //     }
  //     else{
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
  //     }
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();

  }

  String? id;
  void checkLogin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('userId');

    if(id == null){
      print("this is is user is ${id} from null");
     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginUI()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
   // var theme = Theme.of(context);
    //var locale = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Form(key: _formKey,
          child: Scaffold(
            backgroundColor: background,
              body: InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FadedSlideAnimation(
                        child: Stack(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height/1,
                              child: Column(
                                children: [
                              Container(
                                color: primary,
                                height:MediaQuery.of(context).size.height/2.1,
                                child: Center(child: Image.asset('assets/loginlogo.png', scale: 3.5,)),
                              ),
                            ],
                              ),
                            ),
                            Positioned(
                              top: 300,
                              child: Container(
                                padding: EdgeInsets.all(14),
                                width: size.width,
                                height: MediaQuery.of(context).size.height/1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Align(
                                      alignment:Alignment.center,
                                      child:
                                      Text("Login",style: TextStyle(color: primary,fontWeight: FontWeight.w500,fontSize: 40)),
                                    ),
                                    SizedBox(height: 20,),
                                    // SizedBox(height: 45,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text("Mobile Number",style: TextStyle(fontSize: 14)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          child: Card(
                                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            elevation: 5,
                                            child: Center(
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Please enter mobile';
                                                  }
                                                  return null;
                                                },
                                                controller: mobileCtr,
                                                keyboardType: TextInputType.number,
                                                maxLength: 10,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: "",
                                                  contentPadding:
                                                  EdgeInsets.only(left: 15, top: 15),
                                                  hintText: "Mobile",hintStyle: TextStyle(color: blackColor),
                                                  prefixIcon: Icon(
                                                    Icons.phone,
                                                    color: blackColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text("Password",style: TextStyle(fontSize: 14)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          child: Card(
                                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            elevation: 5,
                                            child: Center(
                                              child: TextFormField(
                                                validator: (value) {
                                                  // add your custom validation here.
                                                  if (value!.isEmpty) {
                                                    return 'Please enter password';
                                                  }
                                                  if (value.length < 3) {
                                                    return 'Must be more than 2 charater';
                                                  }
                                                },
                                                controller: passCtr,
                                                obscureText: isPasswordVisible,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  counterText: "",
                                                  contentPadding:
                                                  EdgeInsets.only(left: 15, top: 15),
                                                  hintText: "Password",hintStyle: TextStyle(color: blackColor),
                                                  prefixIcon: Icon(
                                                    Icons.lock_open_rounded,
                                                    color: blackColor,
                                                    size: 20,
                                                  ),
                                                  suffixIcon: InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                        isPasswordVisible = !isPasswordVisible ;
                                                      });
                                                    },
                                                      child: isPasswordVisible ? Icon(Icons.visibility,) : Icon(Icons.visibility_off,)
                                                  )

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 35),
                                    InkWell(
                                        onTap: ()
                                        {
                                          setState(() {
                                          }); if (_formKey.currentState!.validate()) {
                                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Otp Sent success")));
                                            getLoginApi();
                                          } else {
                                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Correct Credentials")));
                                          }
                                        },
                                        child:  Container(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [primary, primary],
                                                  stops: [0, 1]), color: primary),
                                          child:
                                          // isloader == true ? Center(child: CircularProgressIndicator(color: Colors.white,),) :
                                          Center(
                                              child: isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,),)  : Text("Login", style: TextStyle(fontSize: 18, color: Colors.white))),
                                        )
                                    ),
                                    SizedBox(height: 23,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Don't Have an Account?",style: TextStyle(fontSize: 15),),
                                        SizedBox(width: 5,),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationUI()));

                                              // Navigator.push(context, MaterialPageRoute(builder: ))
                                              // widget.loginInteractor.signUp();
                                            },
                                            child: Text("Register Now",style: TextStyle(color: primary,fontSize: 17,fontWeight: FontWeight.bold),))
                                      ],),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        beginOffset: Offset(0, 0.1),
                        endOffset: Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ));
    // return Scaffold(
    //   body: Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height/1.2,
    //     decoration: BoxDecoration(
    //         image: DecorationImage(
    //             image: AssetImage('assets/imgs/login.png'), fit: BoxFit.fill)),
    //     child: Column(
    //       children: <Widget>[
    //         Expanded(
    //           flex: 1,
    //           child: Container(),
    //         ),
    //         Stack(
    //           // flex: 0,
    //           children:[ SingleChildScrollView(
    //             child: Container(
    //               decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(30),
    //                     topRight: Radius.circular(30),
    //                   )),
    //               child: Padding(
    //                 padding:
    //                 const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
    //                 child: Column(
    //                   children: [
    //                     SizedBox(height: 20,),
    //                     Text("Login",style: TextStyle(color: primary,fontWeight: FontWeight.w500,fontSize: 35),),
    //                     SizedBox(height: 45,),
    //                     Column(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.only(left: 8.0),
    //                           child: Text("Mobile Number",style: TextStyle(fontSize: 15),),
    //                         ),
    //                         Padding(
    //                           padding: EdgeInsets.symmetric(
    //                               horizontal: 0, vertical: 0),
    //                           child: Card(
    //                             shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //                             elevation: 4,
    //                             child: Center(
    //
    //                               child: TextFormField(
    //                                 keyboardType: TextInputType.number,
    //                                 maxLength: 10,
    //                                 decoration: InputDecoration(
    //                                   border: InputBorder.none,
    //                                   counterText: "",
    //                                   contentPadding:
    //                                   EdgeInsets.only(left: 15, top: 15),
    //                                   hintText: "Mobile Number",hintStyle: TextStyle(color: blackColor),
    //                                   prefixIcon: Icon(
    //                                     Icons.call,
    //                                     color: blackColor,
    //                                     size: 20,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //
    //                       ],
    //                     ),
    //                     Padding(
    //                         padding: const EdgeInsets.only(
    //                             top: 40, left: 0, right: 0),
    //                         child:
    //                         InkWell(
    //                           onTap: (){
    //                             Navigator.push(context, MaterialPageRoute(builder: (c)=>HomePage()));
    //                           },
    //                             child:  Container(
    //                               height: 50,
    //                               width: MediaQuery.of(context).size.width,
    //                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: primary),
    //                               child:
    //                               Center(child: Text("Login", style: TextStyle(fontSize: 18, color: Colors.white))),
    //                             )
    //                         )
    //                     ),
    //                     SizedBox(height: 10,),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                       Text("Dont Have an Account?",style: TextStyle(fontSize: 15),),
    //                       Text("Register Now",style: TextStyle(color: primary,fontSize: 17),)
    //                     ],)
    //
    //                     // Container(
    //                     //   decoration: BoxDecoration(
    //                     //       border: Border.all(color: Colors.black87,width: 1),
    //                     //       borderRadius: BorderRadius.circular(7)
    //                     //   ),
    //                     //   child:
    //                     //   CustomButton(
    //                     //     text: 'Sign Up',
    //                     //     bgColor: Colors.white.withOpacity(0),
    //                     //     textColor: Colors.black,
    //                     //   ),
    //                     // ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    // ]
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   backgroundColor: background,
    //   body: Stack(
    //     children:[
    //       Container(
    //         height: 500,
    //         decoration:  BoxDecoration(
    //             image:  DecorationImage(
    //               image:  AssetImage("assets/imgs/Layer 1672.png"),
    //               fit: BoxFit.cover,
    //             )
    //         ),
    //
    //     ),
    //       Container(
    //           height: 400,
    //           // alignment: Alignment.center,
    //           decoration: BoxDecoration(
    //               color: background,
    //               borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
    //           ),
    //           child: Column(
    //             children: [
    //               SizedBox(height: 20,),
    //               Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35),),
    //               SizedBox(height: 15,),
    //               Padding(
    //                 padding: EdgeInsets.symmetric(
    //                     horizontal: 20, vertical: 20),
    //                 child: Card(
    //                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //                   elevation: 4,
    //                   child: Center(
    //                     child: TextFormField(
    //                       keyboardType: TextInputType.number,
    //                       maxLength: 10,
    //                       decoration: InputDecoration(
    //                         border: InputBorder.none,
    //                         counterText: "",
    //                         contentPadding:
    //                         EdgeInsets.only(left: 15, top: 15),
    //                         hintText: "Mobile Number",hintStyle: TextStyle(color: Colors.red),
    //                         prefixIcon: Icon(
    //                           Icons.call,
    //                           color: Colors.red,
    //                           size: 20,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                   padding: const EdgeInsets.only(
    //                       top: 80, left: 20, right: 20),
    //                   child:
    //                   InkWell(
    //
    //                       child:  Container(
    //                         height: 50,
    //                         width: MediaQuery.of(context).size.width,
    //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black),
    //                         child:
    //                         // isloader == true ? Center(child: CircularProgressIndicator(color: Colors.white,),) :
    //                         Center(child: Text("Send Otp", style: TextStyle(fontSize: 18, color: Colors.black))),
    //                       )
    //                   )
    //
    //               )
    //             ],
    //           )
    //
    //         // Column(
    //         //   children: [
    //         //     SizedBox(height: 20,),
    //         //     Text("Login",style: TextStyle(color: colors.blackTemp,fontSize: 30,fontWeight: FontWeight.w500),),
    //         //     SizedBox(height: 30,),
    //         //     Container(
    //         //       child: Row(
    //         //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         //         children: [
    //         //           InkWell(
    //         //             onTap: () {
    //         //               setState(() {
    //         //                 selectedIndex = 1;
    //         //               });
    //         //             },
    //         //             child: Container(
    //         //               child: Row(
    //         //                 children: [
    //         //                   Container(
    //         //                     height: 20,
    //         //                     width: 20,
    //         //                     padding: EdgeInsets.all(3),
    //         //                     decoration: BoxDecoration(
    //         //                         borderRadius: BorderRadius.circular(100),
    //         //                         border: Border.all(
    //         //                             color: selectedIndex == 1
    //         //                                 ? colors.secondary
    //         //                                 :colors.secondary,
    //         //                             width: 2)),
    //         //                     child: Container(
    //         //                       decoration: BoxDecoration(
    //         //                         borderRadius: BorderRadius.circular(100),
    //         //                         color: selectedIndex == 1
    //         //                             ? colors.secondary
    //         //                             : Colors.transparent,
    //         //                       ),
    //         //                     ),
    //         //                   ),
    //         //                   SizedBox(
    //         //                     width: 10,
    //         //                   ),
    //         //                   Text(
    //         //                     "Email",
    //         //                     style: TextStyle(
    //         //                         color:colors.secondary,
    //         //                         fontSize: 14,
    //         //                         fontWeight: FontWeight.w500),
    //         //                   )
    //         //                 ],
    //         //               ),
    //         //             ),
    //         //           ),
    //         //           InkWell(
    //         //             onTap: () {
    //         //               setState(() {
    //         //                 selectedIndex = 2;
    //         //               });
    //         //             },
    //         //             child: Container(
    //         //               child: Row(
    //         //                 children: [
    //         //                   Container(
    //         //                     height: 20,
    //         //                     width: 20,
    //         //                     padding: EdgeInsets.all(3),
    //         //                     decoration: BoxDecoration(
    //         //                         borderRadius: BorderRadius.circular(100),
    //         //                         border: Border.all(
    //         //                             color: selectedIndex == 2
    //         //                                 ? colors.secondary
    //         //                                 :colors.secondary,
    //         //                             width: 2)),
    //         //                     child: Container(
    //         //                       decoration: BoxDecoration(
    //         //                         borderRadius: BorderRadius.circular(100),
    //         //                         color: selectedIndex == 2
    //         //                             ? colors.secondary
    //         //                             : Colors.transparent,
    //         //                       ),
    //         //                     ),
    //         //                   ),
    //         //                   SizedBox(
    //         //                     width: 10,
    //         //                   ),
    //         //                   Text(
    //         //                     "Mobile no.",
    //         //                     style: TextStyle(
    //         //                         color: colors.secondary,
    //         //                         fontSize: 14,
    //         //                         fontWeight: FontWeight.w500),
    //         //                   )
    //         //                 ],
    //         //               ),
    //         //             ),
    //         //           ),
    //         //         ],
    //         //       ),
    //         //     ),
    //         //     Padding(
    //         //       padding: const EdgeInsets.only(right: 15,left: 15,top: 20),
    //         //       child: Column(
    //         //         children: [
    //         //       selectedIndex == 1?
    //         //         Form(
    //         //           key: _formKey,
    //         //           child: Column(
    //         //             crossAxisAlignment: CrossAxisAlignment.end,
    //         //             children: [
    //         //               Card(
    //         //                 shape: RoundedRectangleBorder(
    //         //                   borderRadius: BorderRadius.circular(10.0),
    //         //                 ),
    //         //                 elevation: 4,
    //         //                 child: TextFormField(
    //         //                   controller: emailController,
    //         //                   keyboardType: TextInputType.text,
    //         //                   decoration: InputDecoration(
    //         //                       prefixIcon: Icon(Icons.email_outlined,color: colors.secondary),
    //         //                       hintText: 'Email', hintStyle: TextStyle(fontSize: 15.0, color: colors.secondary),
    //         //                       border: InputBorder.none,
    //         //                       contentPadding: EdgeInsets.only(left: 10,top: 10)
    //         //                   ),
    //         //                   validator: (v) {
    //         //                     if (v!.isEmpty) {
    //         //                       return "Email is required";
    //         //                     }
    //         //                     if (!v.contains("@")) {
    //         //                       return "Enter Valid Email Id";
    //         //                     }
    //         //                   },
    //         //                 ),
    //         //               ),
    //         //               SizedBox(height: 10,),
    //         //               Card(
    //         //                 shape: RoundedRectangleBorder(
    //         //                   borderRadius: BorderRadius.circular(10.0),
    //         //                 ),
    //         //                 elevation: 5,
    //         //                 child: TextFormField(
    //         //                   controller: passwordController,
    //         //                   obscureText: true,
    //         //                   keyboardType: TextInputType.text,
    //         //                   decoration: InputDecoration(
    //         //                       prefixIcon: Icon(Icons.lock_open_rounded,color: colors.secondary),
    //         //                       hintText: 'Password', hintStyle: TextStyle(fontSize: 15.0, color: colors.secondary),
    //         //                       border: InputBorder.none,
    //         //                       contentPadding: EdgeInsets.only(left: 10,top: 12)
    //         //                   ),
    //         //                   validator: (v) {
    //         //                     if (v!.isEmpty) {
    //         //                       return "Password is required";
    //         //                     }
    //         //                   },
    //         //                 ),
    //         //               ),
    //         //
    //         //               InkWell(
    //         //                 onTap: (){
    //         //                   Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdatePassword()));
    //         //                 },
    //         //                   child: Padding(
    //         //                     padding: const EdgeInsets.all(8.0),
    //         //                     child: Text("Forget Password?",style: TextStyle(color: colors.secondary),),
    //         //                   )),
    //         //               SizedBox(height: 40,),
    //         //               Padding(
    //         //                 padding: const EdgeInsets.only(right:10.0),
    //         //                 child: Btn(
    //         //                     height: 50,
    //         //                     width: 350,
    //         //                     title: 'Sign in',
    //         //                     onPress: () {
    //         //                       if (_formKey.currentState!.validate()) {
    //         //                         Navigator.push(context,
    //         //                             MaterialPageRoute(builder: (context) =>SignupScreen()));
    //         //                       } else {
    //         //                         const snackBar = SnackBar(
    //         //                           content: Text('All Fields are required!'),
    //         //                         );
    //         //                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //         //                         //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    //         //                       }
    //         //
    //         //                     }
    //         //
    //         //                 ),
    //         //               ),
    //         //             ],
    //         //           ),
    //         //         )
    //         //           : SizedBox.shrink(),
    //         //           selectedIndex == 2?
    //         //           Form(
    //         //             key: _formKey,
    //         //             child: Column(
    //         //               children: [
    //         //                 Card(
    //         //                   shape: RoundedRectangleBorder(
    //         //                     borderRadius: BorderRadius.circular(10.0),
    //         //                   ),
    //         //                   elevation: 5,
    //         //                   child: TextFormField(
    //         //                     maxLength: 10,
    //         //                     maxLines: 1,
    //         //                     controller: mobileController,
    //         //                     keyboardType: TextInputType.number,
    //         //                     decoration: InputDecoration(
    //         //                         counterText: "",
    //         //                         prefixIcon: Icon(Icons.perm_identity_sharp,color: colors.secondary),
    //         //                         hintText: 'Mobile ',hintStyle: TextStyle(fontSize: 15.0, color: colors.secondary),
    //         //                         border: InputBorder.none,
    //         //                         contentPadding: EdgeInsets.only(left: 10,top: 12)
    //         //                     ),
    //         //                     validator: (v) {
    //         //                       if (v!.isEmpty) {
    //         //                         return "Mobile is required";
    //         //                       }
    //         //
    //         //                     },
    //         //                   ),
    //         //                 ),
    //         //                 SizedBox(height: 40,),
    //         //                 Btn(
    //         //                     height: 50,
    //         //                     width: 350,
    //         //                     title: 'Send OTP',
    //         //                     onPress: () {
    //         //                       if (_formKey.currentState!.validate()) {
    //         //                         Navigator.push(context,
    //         //                             MaterialPageRoute(builder: (context) =>VerifyOtp()));
    //         //                       } else {
    //         //                         const snackBar = SnackBar(
    //         //                           content: Text('All Fields are required!'),
    //         //                         );
    //         //                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //         //                         //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    //         //                       }
    //         //                     }
    //         //
    //         //                 ),
    //         //               ],
    //         //             ),
    //         //           ) : SizedBox.shrink(),
    //         //          //  SizedBox(height: 30,),
    //         //          // Btn(
    //         //          //    height: 50,
    //         //          //    width: 320,
    //         //          //    title: selectedIndex==1?'Sign in': 'Send OTP',
    //         //          //    onPress: () {
    //         //          //      if (_formKey.currentState!.validate()) {
    //         //          //      } else {
    //         //          //        // Navigator.push(context,
    //         //          //        //     MaterialPageRoute(builder: (context) =>LoginScreen()));
    //         //          //        //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    //         //          //      }
    //         //          //        const snackBar = SnackBar(
    //         //          //          content: Text('All Fields are required!'),
    //         //          //        );
    //         //          //        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //         //          //
    //         //          //      }
    //         //          //
    //         //          //  ),
    //         //         ],
    //         //       ),
    //         //     )
    //         //   ],
    //         // ),
    //       ),
    // ]
    //   ),
    //
    //
    // );

  }
}
