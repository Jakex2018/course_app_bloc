import 'package:appbloc_02/common/values/constants.dart';
import 'package:appbloc_02/global.dart';
import 'package:appbloc_02/widget/button_one.dart';
import 'package:appbloc_02/screens/welcome/bloc/welcome_bloc.dart';
import 'package:appbloc_02/screens/welcome/bloc/welcome_events.dart';
import 'package:appbloc_02/screens/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller:  pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvents());
                  
                },
                children: [
                  _page(
                    1,
                    context,
                    'asset/images/reading.png',
                    'First See Learning',
                    'Forget about a for of paper all knowledge\n in one learning',
                    'Next',
                  ),
                  _page(
                    2,
                    context,
                     'asset/images/man.png',
                    'Connect With Everyone',
                    'Forget about a for of paper all knowledge\n in one learning',
                    'Next',
                  ),
                  _page(
                    3,
                    context,
                     'asset/images/boy.png',
                    'Connect With Everyone',
                    'Forget about a for of paper all knowledge\n in one learning',
                    'Get StartedB',
                  ),
                ],
              ),
              Positioned(
                bottom: 190.h,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.page,
                ),
              )
            ],
          ),
        );
      },
    )
    );
  }

  Widget _page(int index, BuildContext context, String image,text,desc,title) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.w,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
        // ignore: avoid_unnecessary_containers
        Container(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          width: 375.w,
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150.h,
        ),
        GestureDetector(
          onTap: () {
            if (index < 3){
              pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
            }else{
              Global.storageService.setBool(AppGlobal.STORAGE_DEVICE_OPEN_FIRTS_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: ButtonOne(
              title: title,
              color: Colors.white,
              weight: FontWeight.bold,
              fontSize: 15.dm,
              paddingX: 120.w,
              paddingY: 18.h,
              colorTwo: Colors.purple),
        )
      ],
    );
  }
}

// ignore: camel_case_types
/*
class _page extends StatelessWidget {
  const _page({
    // ignore: unused_element
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    required this.title,
  });
  final String image, text, desc, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(image,fit: BoxFit.cover,)
        ),
        Container(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 375.w,
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150.h,
        ),
        GestureDetector(
          onTap: () {
            if(index<3);
          },
          child: ButtonOne(
              title: title,
              color: Colors.white,
              weight: FontWeight.bold,
              fontSize: 15.dm,
              paddingX: 120.w,
              paddingY: 18.h,
              colorTwo: Colors.purple),
        )
      ],
    );
  }
}*/