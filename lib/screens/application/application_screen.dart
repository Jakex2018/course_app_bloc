import 'package:appbloc_02/screens/application/application_widgets.dart';
import 'package:appbloc_02/screens/application/bloc/application_bloc.dart';
import 'package:appbloc_02/screens/application/bloc/application_events.dart';
import 'package:appbloc_02/screens/application/bloc/application_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AplicationScreen extends StatefulWidget {
  const AplicationScreen({super.key});

  @override
  State<AplicationScreen> createState() => _AplicationScreenState();
}

class _AplicationScreenState extends State<AplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc,ApplicationStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            body: buildScreen(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 2)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                selectedItemColor: Colors.black26,
                unselectedItemColor: Colors.black45,
                elevation: 0,
                currentIndex: state.index,
                onTap: (value) {
                  context.read<ApplicationBloc>().add(TriggerApplicationEvent(value));
                },
                items: buttonNavigateItem
              ),
            ),
          )),
        );
      },
    );
  }
}