import 'package:appbloc_02/screens/sign_in/widget/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget iconLogin() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ImageAsset(
        image: 'google',
        height: 50.w,
      ),
      ImageAsset(
        image: 'apple',
        height: 50.w,
      ),
      ImageAsset(
        image: 'facebook',
        height: 50.w,
      ),
    ],
  );
}