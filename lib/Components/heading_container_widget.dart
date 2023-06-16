import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String? heading;

  const CustomHeading({Key? key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      color: Theme.of(context).dividerColor,
      child: Text(heading!),
    );
  }
}
