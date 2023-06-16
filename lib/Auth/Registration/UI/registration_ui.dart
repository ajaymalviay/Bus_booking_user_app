import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_pay/Auth/Login/UI/login_ui.dart';
import 'package:quick_pay/Auth/Registration/UI/register_interactor.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/assets.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../BottomNavigation/Home/home.dart';
import '../../../helper/constant.dart';
import '../../Login/UI/login_page.dart';

class RegistrationUI extends StatefulWidget {
  // final RegistrationInteractor registrationInteractor;
  // final String? phoneNumber ;

  //RegistrationUI(this.registrationInteractor, this.phoneNumber);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  bool isLoading = false;
  bool isloader = false;

  TextEditingController mobileCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
    TextEditingController passCtr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();
  TextEditingController conPassCtr = TextEditingController();

  registerUser() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Cookie':
          'ci_session=ffffc57e44a0c1c5fa3fff2590cbff7bd73843c5; ekart_security_cookie=19d081fe2b0ed3bced56c82e36e72db0'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.userRegister}'));
    request.fields.addAll({
      'name': nameCtr.text,
      'email': emailCtr.text,
      'mobile': mobileCtr.text,
      'password':passCtr.text,
      'address': addressCtr.text,
      "confirm_password":conPassCtr.text
    });
    print("fields----------${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalresponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalresponse);
      print("${jsonresponse['error']}__________________");
      if (jsonresponse['error'] == false) {
        print("user registerrrrrrrrrr_________");
        var id = jsonresponse['data']['id'];
        SharedPreferences preferences = await SharedPreferences.getInstance();
       //preferences.setString("userId", "${id}");
        var username = jsonresponse['data']['username'];
        var address = jsonresponse['data']['address'];
        var mobile = jsonresponse ['data']['mobile'];
        var email = jsonresponse ['data']["email"];

        preferences.setString("username", "${username}");
        preferences.setString("address", "${address}");
        preferences.setString("mobile", "${mobile}");
        preferences.setString("email", "${email}");

        print("thisis my email${email}");

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginUI(),
            ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${jsonresponse['message']}")));
      }
    } else {
      isLoading = false;
      print(response.reasonPhrase);
    }
  }

  var _current = 0;
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isCPasswordVisible = true;
  @override
  Widget build(BuildContext context) {

    /*List<Widget> carouselWidgets = [
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(text: locale.registerNownGet! + '\n\n'),
                TextSpan(
                    text: locale.ultimateExpOf! + '\n' + locale.quickPaying!,
                    style: TextStyle(fontSize: 18)),
              ])),
        ),
      ),*/
    /*  Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                TextSpan(text: locale.registerNownGet! + '\n\n'),
                TextSpan(
                    text: locale.ultimateExpOf! + '\n' + locale.quickPaying!,
                    style: TextStyle(fontSize: 18)),
              ])),
        ),
      ),
    ];*/
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: primary,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: primary,
                  height:MediaQuery.of(context).size.height/3.1,
                  child: Center(child: Image.asset('assets/loginlogo.png', scale: 3.5,)),
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  width: size.width,
                  height: MediaQuery.of(context).size.height/1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        Text("Sign Up",style: TextStyle(color: blackColor,fontSize: 20,fontWeight: FontWeight.bold),),
                        // SizedBox(height: 45,),
                        SizedBox(height: 20,),
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
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                controller: nameCtr,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                                  hintText: "Name",hintStyle: TextStyle(color: blackColor),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: blackColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Card(
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length != 10) {
                                  return 'Please enter mobile';
                                }

                              },
                              controller: mobileCtr,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
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
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Card(
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Center(
                              child: TextFormField(
                                validator: (value) {
                                  if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                                    return 'Invalid Email';
                                  }
                                  return null;
                                },
                                controller: emailCtr,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                                  hintText: "Email",hintStyle: TextStyle(color: blackColor),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
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
                                    child: isPasswordVisible ? Icon(Icons.visibility,) : Icon(Icons.visibility_off,),)
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
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
                                    return 'Please enter confirm password';
                                  }
                                  if (value.length < 3) {
                                    return 'Must be more than 2 charater';
                                  }
                                },
                                controller: conPassCtr,
                                obscureText: isCPasswordVisible,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                                  hintText: "Confirm Password",hintStyle: TextStyle(color: blackColor),
                                  prefixIcon: Icon(
                                    Icons.lock_open_rounded,
                                    color: blackColor,
                                    size: 20,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                        isCPasswordVisible = !isCPasswordVisible ;

                                      });
                                    },
                                    child: isCPasswordVisible ? Icon(Icons.visibility,) : Icon(Icons.visibility_off,),)
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
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
                                    return 'Please enter address';
                                  }
                                  return null;
                                },
                                controller: addressCtr,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: "",
                                  contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                                  hintText: "Address",hintStyle: TextStyle(color: blackColor),
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: blackColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  registerUser();
                                } else {
                                  print('_____');
                                  setState((){
                                    isLoading = false;
                                  });
                                  ///Fluttertoast.showToast(msg: "Enter Correct Credentials!!");
                                  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Correct Credentials!")));
                                }
                              },
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [primary, primary],
                                        stops: [0, 1]),
                                    color: primary),
                                child: Center(
                                    child: isLoading == true ? CircularProgressIndicator():Text("Sign Up",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white))),
                              )),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have a account?",style: TextStyle(fontSize: 15),),
                            SizedBox(width: 5,),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUI()));

                                  // Navigator.push(context, MaterialPageRoute(builder: ))
                                  // widget.loginInteractor.signUp();
                                },
                                child: Text("Login",style: TextStyle(color: primary,fontSize: 17,fontWeight: FontWeight.bold),))
                          ],),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
