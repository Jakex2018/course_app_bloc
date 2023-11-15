import 'package:appbloc_02/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildScreen(int index) {
  // ignore: no_leading_underscores_for_local_identifiers
  List<Widget> _widget = [
    const HomePage(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Course"),
    ),
    const Center(
      child: Text("Chat"),
    ),
    const Center(
      child: Text("Profile"),
    )
  ];
  return _widget[index];
}

var buttonNavigateItem = [
  BottomNavigationBarItem(
      label: 'Home',
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(
            title: 'home',
          )),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(
            title: 'home',
            color: Colors.blue,
          ))),
  BottomNavigationBarItem(
      label: 'Search',
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(
            title: 'search',
          )),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(
            title: 'search',
            color: Colors.blue,
          ))),
  BottomNavigationBarItem(
      label: 'Play',
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(title: 'play-circle1')),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(
            title: 'play-circle1',
            color: Colors.blue,
          ))),
  BottomNavigationBarItem(
      label: 'Chat',
      icon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(title: 'message-circle')),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(
            title: 'message-circle',
            color: Colors.blue,
          ))),
  BottomNavigationBarItem(
      label: 'Profile',
      icon: SizedBox(
          width: 15.w, height: 15.h, child: const ImageTitle(title: 'person2')),
      activeIcon: SizedBox(
          width: 15.w,
          height: 15.h,
          child: const ImageTitle(
            title: 'person2',
            color: Colors.blue,
          ))),
];


class ImageTitle extends StatelessWidget {
  const ImageTitle({
    super.key,
    required this.title,
    this.color,
  });
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/icons/$title.png',
      color: color,
    );
  }
}