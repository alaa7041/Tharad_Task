import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String? message, Color color, Color textColor) {
  Fluttertoast.showToast(
    backgroundColor: color,
    textColor: textColor,
    msg: message.toString(),
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 2,
  );
}
