import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectIndex = 0;
  List categories =['All' ,'Popular' , 'Moment'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            setState(() {
              selectIndex = index; 
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding:EdgeInsets.symmetric(horizontal:25.w),
            margin: EdgeInsets.only(left: 0 ,top: 5,
              right: index == categories.length -1 ? 10: 0),
            decoration: BoxDecoration(
              color: index == selectIndex ? Colors.purple: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child:Text(categories[index],style: TextStyle(color: index== selectIndex? Colors.white:Colors.black12),),
          ),
        ),
      ),
    );
  }
}