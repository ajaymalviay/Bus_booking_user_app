import 'package:flutter/material.dart';

import 'modules.dart';

class WidgetComponent {
  static  ElevatedButton ({
    required Widget buttons,
    required Color colors,
    required VoidCallback onPressed,
  }) => ElevatedButton(
    // child: buttons,
    // color: colors,
    onPressed: onPressed, buttons: buttons, colors: Colors.black,
  );
  static TextFormField formField ({
    // required String hints,
    required String label,
    // required Widget suffix,
    required Widget prefix,
    required InputBorder borders,
    bool secure: false,
    bool autocorrent : true,
    // required Icon icon,
    bool enables  = true,
    // required TextInputType inputType,
    required TextEditingController controllers,
    required FormFieldValidator valids,
  }) => TextFormField(
    enabled: enables,
    validator: valids,
    obscureText: secure,
    // keyboardType: inputType,
    autocorrect: autocorrent,
    controller: controllers,
    decoration: InputDecoration(
      border: borders,
      // icon: icon,
      // labelText: label,
      // hintText: hints,
      // suffixIcon: suffix,
      prefixIcon: prefix,
    ),
  );

  static RawMaterialButton buttons(String label, {
    required double elevas,
    required double radius,
    required Color coloring,
    required Color textColor,
    required FontWeight bolds,
    required EdgeInsetsGeometry padding,
    required VoidCallback onPressed,
  }) => RawMaterialButton(
      elevation: elevas,
      padding: padding,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      fillColor: coloring,
      child: Text(label, style: TextStyle(color: textColor, fontWeight: bolds),),
      onPressed: onPressed
  );

  static ListTile listiles (String titles, {
      required IconData leads,
      required IconData icons,
      required VoidCallback onPressed,
  }) => ListTile(
      leading: Icon(leads),
      title: Text(titles),
      onTap: onPressed,
      trailing: IconButton(icon: Icon(icons), onPressed: onPressed),
    );

}