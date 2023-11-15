import 'package:appbloc_02/screens/home/widget/category_list.dart';
import 'package:appbloc_02/screens/home/widget/home_widget.dart';
import 'package:appbloc_02/screens/sign_in/widget/image_asset.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  List categories = ['All', 'Hidrolized', 'Isolate'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bulidAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodyWelcomeUser(),
              const HomeSearchIcon(),
              ImageAsset(image: 'Art', height: 160.h),
              Center(
                  child: DotsIndicator(
                dotsCount: 3,
              )),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choice your course',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: Colors.black12,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const CategoryList(),
              
            ],
          ),
        ),
      ),
    );
  }
}

class HomeSearchIcon extends StatelessWidget {
  const HomeSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 250.w,
            height: 45.h,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 2.w),
                borderRadius: BorderRadius.circular(20.sp)),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black12,
                ),
                hintText: 'Search your course...',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          ImageAsset(image: 'filter', height: 45.h)
        ],
      ),
    );
  }
}

class BodyWelcomeUser extends StatelessWidget {
  const BodyWelcomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Hello,\n',
          style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              fontSize: 32.sp),
          children: [
            TextSpan(
                text: 'Robert Nicklas',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp))
          ]),
    );
  }
}
