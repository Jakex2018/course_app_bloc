import 'package:appbloc_02/screens/sign_in/widget/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget textFormLogin(String title,desc,password,image,
void Function(String value)?func,IconButton? sufIcon){
  return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(
              height: 10.w,
            ),
            Container(
              width: 325.w,height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12.withOpacity(.3)),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  Container(
                    width: 20.w, height: 20.h,
                    margin: EdgeInsets.only(left: 10.w),
                    child: ImageAsset(image: image, height: 20.h),
                  ),
                  Container(
                    height: 80.h,
                    width: 290.w, 
                    margin: EdgeInsets.only(top:10.h),
                    child:  TextField(
                      onChanged:(value) => func!(value),
                      obscureText: password=='password'?true:false,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: desc,
                        suffixIcon: sufIcon,
                        border: const OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.transparent
                        )),
                        disabledBorder: const OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.transparent
                        )),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.transparent
                        ))
                        ),
                      
                    ),
                  )
                ],
              ),
            ),
          ],
        );
}