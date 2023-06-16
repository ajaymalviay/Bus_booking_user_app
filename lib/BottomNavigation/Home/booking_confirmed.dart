import 'package:flutter/material.dart';

import '../bottom_navigation.dart';

class BookingConfirmed extends StatelessWidget {
  const BookingConfirmed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 120,),
        Image.asset('assets/imgs/booking_confirmed.png'),
      ElevatedButton(onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomBar(),));
      },
      child: Text('Back to Home & see bookings')),
      ],),
    );
  }
}
