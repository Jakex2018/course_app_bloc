import 'package:appbloc_02/screens/sign_in/widget/build_app_bar.dart';
import 'package:appbloc_02/screens/sign_in/widget/text_form_login.dart';
import 'package:appbloc_02/screens/sign_in/widget/third_login.dart';
import 'package:appbloc_02/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:appbloc_02/screens/sign_up/bloc/sign_up_events.dart';
import 'package:appbloc_02/screens/sign_up/bloc/sign_up_states.dart';
import 'package:appbloc_02/screens/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc,SignUpStates>(
      builder: (BuildContext context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Sign Up '),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        'Enter your details below & free sign up',
                        style:
                            TextStyle(color: Colors.black38, fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      textFormLogin('Username', 'Enter your username',
                          'username', 'person(1)', (value) {
                        context.read<SignUpBloc>().add(UsernameEvent(value));
                      },null),
                      SizedBox(
                        height: 20.h,
                      ),
                      textFormLogin(
                          'Phone or email',
                          'Enter your Phone or email',
                          'email',
                          'b_phone', (value) {
                        context.read<SignUpBloc>().add(EmailEvents(value));
                      },null),
                      SizedBox(
                        height: 20.h,
                      ),
                      textFormLogin(
                          'Password', 'Enter your password', 'password', 'lock',
                          (value) {
                        context.read<SignUpBloc>().add(PasswordEvents(value));
                      },IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye_outlined),)),
                      SizedBox(
                        height: 20.h,
                      ),
                      textFormLogin('Confirm Password', 'Retry your password',
                          'password', 'lock', (value) {
                        context.read<SignUpBloc>().add(RePasswordEvent(value));
                      },IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye_outlined),)),
                      Row(
                        children: [
                          Flexible(
                            child: CheckboxListTile(
                              value: false,
                              onChanged: (value) {
                                // Haz algo con el valor de la casilla.
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                'By creating an account you have to agree with our terms & conditions',
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Column(
                        children: [
                          buttonTwo(
                              'Sign up', Colors.purple, Colors.white, 'signup',
                              () {
                            SignUpController(context: context).handleSignUp();
                            
                            //Navigator.of(context).pushNamed('register');
                          })
                        ],
                      )
                    ],
                  ),
                )),
          )),
        );
      },
    );
  }
}
