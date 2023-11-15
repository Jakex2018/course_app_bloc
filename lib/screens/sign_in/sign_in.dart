import 'package:appbloc_02/screens/sign_in/bloc/signin_bloc.dart';
import 'package:appbloc_02/screens/sign_in/bloc/signin_states.dart';
import 'package:appbloc_02/screens/sign_in/widget/build_app_bar.dart';
import 'package:appbloc_02/screens/sign_in/widget/third_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (BuildContext context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Log in'),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: thirdLogin(context,'Or use your email account login')),
          )),
        );
      },
    );
  }
}