import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: non_constant_identifier_names
ToastInfo({required String smg , Color backgroundColor =Colors.black, Color textColor = Colors.white}){
  return Fluttertoast.showToast(
    msg: smg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    fontSize: 16.sp
  );
}