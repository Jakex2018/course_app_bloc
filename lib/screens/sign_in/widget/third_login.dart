import 'package:appbloc_02/screens/sign_in/bloc/signin_bloc.dart';
import 'package:appbloc_02/screens/sign_in/bloc/signin_events.dart';
import 'package:appbloc_02/screens/sign_in/sign_in_controller.dart';
import 'package:appbloc_02/screens/sign_in/widget/icon_text.dart';
import 'package:appbloc_02/screens/sign_in/widget/text_form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget thirdLogin(BuildContext context,String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        iconLogin(),
        SizedBox(
          height: 30.w,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.black38, fontSize: 16.sp),
        ),
        SizedBox(
          height: 80.h,
        ),
        textFormLogin('Email', 'Enter your email', 'email','person(1)',
          (value){
            context.read<SignInBloc>().add(EmailEvent(value));
          },null
        ),
        SizedBox(
          height: 20.h,
        ),
        textFormLogin('Password', 'Enter your Password', 'password', 'lock',
          (value){
            context.read<SignInBloc>().add(PasswordEvent(value));
          },IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye_outlined))
        ),
        forgotPassword(),
        SizedBox(
          height: 30.h,
        ),
        Column(
          children: [
            buttonTwo('Log In', Colors.purple, Colors.white,'login',(){
              SignInController(context: context).handleSignIn("email");
            }),
            SizedBox(
              height: 20.h,
            ),
            buttonTwo('Sign up', Colors.white.withOpacity(.8), Colors.black,'signup',(){
              Navigator.of(context).pushNamed('/register');
            })
          ],
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    width: 320.w,
    height: 50.w,
    margin: EdgeInsets.only(top: 12.h),
    child: GestureDetector(
      onTap: (){},
      child: Text(
        'Forgot Password',
        style: TextStyle(
            color: Colors.black38,
            decoration:TextDecoration.underline,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}

Widget buttonTwo(String title, Color color, colorText,border,void Function()?func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: border=='login' ? Colors.transparent:Colors.black26
          ),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 1,
                spreadRadius: 2,
                color: Colors.grey.withOpacity(.15))
          ]),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: colorText, fontWeight: FontWeight.normal, fontSize: 18.sp),
        ),
      ),
    ),
  );
}

/*
Widget iconText() {
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
}*/