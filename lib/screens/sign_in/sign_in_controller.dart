//import 'package:appbloc_02/common/widgets/flutter_toast.dart';
import 'package:appbloc_02/common/values/constants.dart';
import 'package:appbloc_02/common/widgets/flutter_toast.dart';
import 'package:appbloc_02/global.dart';
import 'package:appbloc_02/screens/sign_in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController{
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type)async{
    try {
      if(type == 'email'){
        final state = context.read<SignInBloc>().state;
        String emailAdress = state.email;
        String passwordAdress = state.password;
        if (emailAdress.isEmpty || passwordAdress.isEmpty ) {
        ToastInfo(smg: 'All fields are required');
        return;
      }
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAdress, password: passwordAdress);
          if(credential.user == null){
           
            ToastInfo(smg: 'No found User Credendialts');
          }
          if(!credential.user!.emailVerified){
            //
          }
          var user = credential.user;
          if(user != null){
            // ignore: avoid_print
            ToastInfo(smg: 'User Exist');
            Global.storageService.setString(AppGlobal.STORAGE_DEVICE_OPEN_TOKEN_USER, '123456');
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(context, '/application', (route) => false);
            //
          }

        } on FirebaseAuthException catch (e) {
          if(e.code == 'user-not-found'){
            // ignore: avoid_print
            ToastInfo(smg: 'No user found that email');
          }else if(e.code == 'wrong-password'){
            ToastInfo(smg: 'wrong password provider for that user');
          }else if(e.code=='invalid-mail'){
            ToastInfo(smg: 'Your email format is wrong');
          }
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}