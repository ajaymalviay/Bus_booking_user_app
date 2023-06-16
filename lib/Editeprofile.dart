import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_pay/BottomNavigation/Home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Theme/colors.dart';
import 'package:http/http.dart'as http;

import 'helper/apiservices.dart';
import 'model/userprofile.dart';


class EditeProfile extends StatefulWidget {
  Userprofile? getprofile;

  EditeProfile(this.getprofile);

  // const EditeProfile({Key? key}) : super(key: key);

  @override
  State<EditeProfile> createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController namCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController mobileCtr = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController CpassController = TextEditingController();
  TextEditingController addressCtr = TextEditingController();

  getuserProfile() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id  =  preferences.getString('id');

    setState(() {

    });

    var headers = {
      'Cookie': 'ci_session=7ff77755bd5ddabba34d18d1a5a3b7fbca686dfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/bus_booking/api/get_profile'));
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
        // getprofile = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  getUpdatedProfile(BuildContext context) async {
    setState(() {
      isLoading =  true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id  =  preferences.getString('userId');
    print("TTTTTTTTTTTTT>>>>>>>>>>>${id}");
    var headers = {
      'Cookie': 'ci_session=4597d2507ea9b57b4c874e1796d72232a878124e'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiService.getUpdateUser}'));
    request.fields.addAll({
      "name": namCtr.text,
      'user_id': id.toString(),
      'email': emailCtr.text,
      'mobile': mobileCtr.text,
      'address': addressCtr.text,
    });
    print('____surendra______${request.fields}_________');
    if(imageFile != null){
      request.files.add(await http.MultipartFile.fromPath('profile_pic',imageFile!.path.toString() ));
    }
    print('___dsfsdffsfsfsfsfsfs_______${request.files}_________');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('____surendra______${response.statusCode}_________');
     final result =  await response.stream.bytesToString();
     final finalResult = jsonDecode(result);

      if(!(finalResult['error'])){
       var mobile = finalResult['data']['mobile'];
       var address = finalResult['data']['address'];
       var email = finalResult['data']['email'];
       var userName = finalResult['data']['username'];

       SharedPreferences preferences = await SharedPreferences.getInstance();
       preferences.setString("mobile", mobile.toString());
       preferences.setString("address", address.toString());
       preferences.setString("userName", userName.toString());
       preferences.setString("email", email.toString());
      }


     print('____surendra______${finalResult}_________');
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "${finalResult['message']}");
     Navigator.pop(context, true);
     //

    }
    else {
      setState(() {
        isLoading = false;
      });

    print(response.reasonPhrase);
    }

  }


  void initState(){
    super.initState();
    namCtr.text = widget.getprofile!.data!.username.toString();
    emailCtr.text = widget.getprofile!.data!.email.toString();
    mobileCtr.text = widget.getprofile!.data!.mobile.toString();
    addressCtr.text = widget.getprofile!.data!.address.toString();
    addressCtr.text = widget.getprofile!.data!.address.toString();
    realProfileImage =widget.getprofile!.data!.profilePic.toString();
    getuserProfile();

  }

  var profileImage;

  File? imageFile;
  String? realProfileImage;

  final ImagePicker _picker = ImagePicker();

  Future<bool> showExitPopup() async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Select Image'),
          content: Row(
            // crossAxisAlignment: CrossAxisAlignment.s,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _getFromCamera();
                },
                //return false when click on "NO"
                child: Text('Camera'),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  _getFromGallery();
                  // Navigator.pop(context,true);
                  // Navigator.pop(context,true);
                },
                //return true when click on "Yes"
                child: Text('Gallery'),
              ),
            ],
          )),
    ) ??
        false; //if showDialouge had returned null, then return false
  }

  _getFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    /* PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );*/
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    /*  PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );*/
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: primary,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Text(
        "Edit Profile",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            SizedBox(height: 20,),
            Stack(
                children:[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: imageFile == null ? Image.network(realProfileImage ??'',fit: BoxFit.fill,): ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:Image.file(imageFile!,fit: BoxFit.cover,))
                  ),
                        //: Image.asset('assets/imgs/Layer 1753.png',fit: BoxFit.fill,),

                  Positioned(
                      bottom: 0,
                      right: 0,
                      // top: 30,
                      child: InkWell(
                        onTap: (){
                          showExitPopup();
                        },
                        child: Container(
                            height: 30,width: 30,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(Icons.camera_enhance_outlined,color: Colors.white,)),
                      ))
                ]
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Name", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: namCtr,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          // hintText: 'Ankit Bairagi',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "name is required";
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Email Id", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: emailCtr,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          // hintText: 'ankit0147@gmail.com',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color:blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Email is required";
                        }
                        if (!v.contains("@")) {
                          return "Enter Valid Email Id";
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Mobile No", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: mobileCtr,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          counterText: "",
                          // hintText: '9109599773',
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "mobile number is required";
                        }

                      },
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Address", style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: addressCtr,
                      decoration: InputDecoration(
                          counterText: "",
                          hintStyle: TextStyle(
                              fontSize: 15.0, color: blackColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 10, top: 10)
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "mobile number is required";
                        }

                      },
                    ),

                    SizedBox(height: 30,),
                    InkWell(
                        onTap: ()
                        {
                          if(_formKey.currentState!.validate())
                            {


                                getUpdatedProfile(context);

                                //Fluttertoast.showToast(msg: "Please select Images");

                            }else{

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
                                  stops: [0, 1]),
                              color: primary),
                          child:
                          Center(
                              child: isLoading  ? Center(child: CircularProgressIndicator(color: Colors.white,))
                                  :
                              Text("Update", style: TextStyle(fontSize: 18, color: Colors.white))),
                        )
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Text("Gender", style: TextStyle(
                    //       color: colors.black54, fontWeight: FontWeight.bold),),
                    // ),
                    //
                    // SizedBox(height: 10,),
                    // TextFormField(
                    //   controller: CpassController,
                    //   keyboardType: TextInputType.emailAddress,
                    //   decoration: InputDecoration(
                    //       hintText: 'Male',
                    //       hintStyle: TextStyle(
                    //           fontSize: 15.0, color: colors.secondary),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10)),
                    //       contentPadding: EdgeInsets.only(left: 10, top: 10)
                    //   ),
                    //   // validator: (v) {
                    //   //   if (v!.isEmpty) {
                    //   //     return "Gender is required";
                    //   //   }
                    //   // },
                    // ),
                    // SizedBox(height: 10,),
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: Text("Registration Card", style: TextStyle(
                    //       color: colors.black54, fontWeight: FontWeight.bold),),
                    // ),
                    // SizedBox(height: 10,),
                    //
                    // InkWell(
                    //   onTap: (){
                    //     showExitPopup();
                    //   },
                    //   child: Container(
                    //     // height: MediaQuery.of(context).size.height/4,
                    //     // height: 60,
                    //     child: DottedBorder(
                    //       borderType: BorderType.RRect,
                    //       radius: Radius.circular(5),
                    //       dashPattern: [5, 5],
                    //       color: Colors.grey,
                    //       strokeWidth: 2,
                    //       child: imageFile == null || imageFile == ""  ?
                    //       Center(child:Icon(Icons.drive_folder_upload_outlined,color: Colors.grey,size: 60,)): Column(
                    //         children: [
                    //           Image.file(imageFile!,fit: BoxFit.fill,),
                    //         ],
                    //       ),
                    //
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                    // SizedBox(height: 45,),
                    // Center(
                    //   child: Btn(
                    //       height: 50,
                    //       width: 320,
                    //       color: colors.secondary,
                    //       title: 'Update',
                    //       // onPress: () {
                    //       //   {
                    //       //     Navigator.push(context,
                    //       //         MaterialPageRoute(
                    //       //             builder: (context) => HomeScreen()));
                    //       //   }
                    //       // },
                    //       onPress: () {
                    //         if (_formKey.currentState!.validate())
                    //         {
                    //           Navigator.push(context,
                    //               MaterialPageRoute(builder: (context) =>ProfileScreen()));
                    //         } else {
                    //           const snackBar = SnackBar(
                    //             content: Text('All Fields are required!'),
                    //           );
                    //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //           //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    //         }
                    //       }
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}
