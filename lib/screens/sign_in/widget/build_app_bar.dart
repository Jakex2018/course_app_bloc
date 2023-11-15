import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String title) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), 
          child: Container(
            color: Colors.grey.withOpacity(.5),height: 1.0,
          ),
        ),
        title: Text(title,style: TextStyle(
          color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.normal
        ),),
        centerTitle: true,
      );
  }