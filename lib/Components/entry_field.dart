import 'package:flutter/material.dart';
import 'package:quick_pay/Theme/colors.dart';

class EntryField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? labelText;
  final String? initialValue;
  EntryField(this.hintText, this.suffix, {this.prefixIcon, this.labelText, this.initialValue});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline5!.copyWith(color: hintColor, fontSize: 18),
          suffixIcon: suffix,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: hintColor!))
      ),
    );
  }
}
