// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class EditeProfile extends StatefulWidget {
//   const EditeProfile({Key? key}) : super(key: key);
//
//   @override
//   State<EditeProfile> createState() => _EditeProfileState();
// }
//
// class _EditeProfileState extends State<EditeProfile> {
//
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phonelController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   TextEditingController CpassController = TextEditingController();
//
//   File? imageFile;
//   final ImagePicker _picker = ImagePicker();
//
//   Future<bool> showExitPopup() async {
//     return await showDialog(
//       //show confirm dialogue
//       //the return value will be from "Yes" or "No" options
//       context: context,
//       builder: (context) => AlertDialog(
//           title: Text('Select Image'),
//           content: Row(
//             // crossAxisAlignment: CrossAxisAlignment.s,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   _getFromCamera();
//                 },
//                 //return false when click on "NO"
//                 child: Text('Camera'),
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _getFromGallery();
//                   // Navigator.pop(context,true);
//                   // Navigator.pop(context,true);
//                 },
//                 //return true when click on "Yes"
//                 child: Text('Gallery'),
//               ),
//             ],
//           )),
//     ) ??
//         false; //if showDialouge had returned null, then return false
//   }
//
//   _getFromGallery() async {
//     final XFile? pickedFile =
//     await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
//     /* PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//     );*/
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//       Navigator.pop(context);
//     }
//   }
//
//   _getFromCamera() async {
//     final XFile? pickedFile =
//     await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
//     /*  PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//     );*/
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//       Navigator.pop(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(text: "",isTrue: true, context: context),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children:<Widget>[
//             SizedBox(height: 20,),
//             Stack(
//                 children:[
//                   Container(
//                     height: 100,
//                     width: 100,
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.asset("assets/images/tablets.png")
//                       // Image.file(imageFile!,fit: BoxFit.fill,),
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 0,
//                       right: 0,
//                       // top: 30,
//                       child: InkWell(
//                         onTap: (){
//                           showExitPopup();
//                         },
//                         child: Container(
//                             height: 30,width: 30,
//                             decoration: BoxDecoration(
//                                 color: colors.secondary,
//                                 borderRadius: BorderRadius.circular(50)
//                             ),
//                             child: Icon(Icons.camera_enhance_outlined,color: Colors.white,)),
//                       ))
//                 ]
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 10,),
//
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Text("Name", style: TextStyle(
//                           color: colors.black54, fontWeight: FontWeight.bold),),
//                     ),
//                     SizedBox(height: 10,),
//                     TextFormField(
//                       controller: nameController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                           hintText: 'Ankit Bairagi',
//                           hintStyle: TextStyle(
//                               fontSize: 15.0, color: colors.secondary),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           contentPadding: EdgeInsets.only(left: 10, top: 10)
//                       ),
//                       // validator: (v) {
//                       //   if (v!.isEmpty) {
//                       //     return "name is required";
//                       //   }
//                       // },
//                     ),
//                     SizedBox(height: 10,),
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Text("Email Id", style: TextStyle(
//                           color: colors.black54, fontWeight: FontWeight.bold),),
//                     ),
//                     SizedBox(height: 10,),
//                     TextFormField(
//                       controller: emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                           hintText: 'mailto:ankit0147@gmail.com',
//                           hintStyle: TextStyle(
//                               fontSize: 15.0, color: colors.secondary),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           contentPadding: EdgeInsets.only(left: 10, top: 10)
//                       ),
//                       // validator: (v) {
//                       //   if (v!.isEmpty) {
//                       //     return "Email is required";
//                       //   }
//                       //   if (!v.contains("@")) {
//                       //     return "Enter Valid Email Id";
//                       //   }
//                       // },
//                     ),
//                     SizedBox(height: 10,),
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Text("Mobile No", style: TextStyle(
//                           color: colors.black54, fontWeight: FontWeight.bold),),
//                     ),
//                     SizedBox(height: 10,),
//
//                     TextFormField(
//                       controller: mobileController,
//                       keyboardType: TextInputType.number,
//                       maxLength: 10,
//                       decoration: InputDecoration(
//                           counterText: "",
//                           hintText: '9109599773',
//                           hintStyle: TextStyle(
//                               fontSize: 15.0, color: colors.secondary),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           contentPadding: EdgeInsets.only(left: 10, top: 10)
//                       ),
//                       // validator: (v) {
//                       //   if (v!.isEmpty) {
//                       //     return "mobile number is required";
//                       //   }
//                       //
//                       // },
//                     ),
//                     SizedBox(height: 10,),
//
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Text("DOB", style: TextStyle(
//                           color: colors.black54, fontWeight: FontWeight.bold),),
//                     ),
//
//                     SizedBox(height: 10,),
//                     TextFormField(
//                       controller: passController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                           hintText: '22/1/2001',
//                           hintStyle: TextStyle(
//                               fontSize: 15.0, color: colors.secondary),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           contentPadding: EdgeInsets.only(left: 10, top: 10)
//                       ),
//                       // validator: (v) {
//                       //   if (v!.isEmpty) {
//                       //     return "Date of Birth is required";
//                       //   }
//                       //
//                       // },
//                     ),
//                     SizedBox(height: 10,),
//
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Text("Gender", style: TextStyle(
//                           color: colors.black54, fontWeight: FontWeight.bold),),
//                     ),
//
//                     SizedBox(height: 10,),
//                     TextFormField(
//                       controller: CpassController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                           hintText: 'Male',
//                           hintStyle: TextStyle(
//                               fontSize: 15.0, color: colors.secondary),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           contentPadding: EdgeInsets.only(left: 10, top: 10)
//                       ),
//                       // validator: (v) {
//                       //   if (v!.isEmpty) {
//                       //     return "Gender is required";
//                       //   }
//                       // },
//                     ),
//                     SizedBox(height: 10,),
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Text("Registration Card", style: TextStyle(
//                           color: colors.black54, fontWeight: FontWeight.bold),),
//                     ),
//                     SizedBox(height: 10,),
//
//                     InkWell(
//                       onTap: (){
//                         showExitPopup();
//                       },
//                       child: Container(
//                         // height: MediaQuery.of(context).size.height/4,
//                         // height: 60,
//                         child: DottedBorder(
//                           borderType: BorderType.RRect,
//                           radius: Radius.circular(5),
//                           dashPattern: [5, 5],
//                           color: Colors.grey,
//                           strokeWidth: 2,
//                           child: imageFile == null || imageFile == ""  ?
//                           Center(child:Icon(Icons.drive_folder_upload_outlined,color: Colors.grey,size: 60,)): Column(
//                             children: [
//                               Image.file(imageFile!,fit: BoxFit.fill,),
//                             ],
//                           ),
//
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     SizedBox(height: 45,),
//                     Center(
//                       child: Btn(
//                           height: 50,
//                           width: 320,
//                           color: colors.secondary,
//                           title: 'Update',
//                           // onPress: () {
//                           //   {
//                           //     Navigator.push(context,
//                           //         MaterialPageRoute(
//                           //             builder: (context) => HomeScreen()));
//                           //   }
//                           // },
//                           onPress: () {
//                             if (_formKey.currentState!.validate())
//                             {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) =>ProfileScreen()));
//                             } else {
//                               const snackBar = SnackBar(
//                                 content: Text('All Fields are required!'),
//                               );
//                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                               //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
//                             }
//                           }
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//
//   }
// }
