import 'package:appbloc_02/screens/sign_in/widget/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar bulidAppBar() {
    return AppBar(
      backgroundColor: Colors.white,elevation: 0,
      title: Container(
        margin: EdgeInsets.only(left: 10.w,right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageAsset(image: 'menu', height: 15.h),
            ImageAsset(image: 'img', height: 35.h)
          ],
        ),
      ),
    );
}