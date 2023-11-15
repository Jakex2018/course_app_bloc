import 'package:appbloc_02/common/widgets/flutter_toast.dart';
import 'package:appbloc_02/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController {
  final BuildContext context;

  SignUpController({required this.context});

  Future<void> handleSignUp() async {
    try {
      final registerState = context.read<SignUpBloc>().state;
      String usernameRegister = registerState.username;
      String emailRegister = registerState.email;
      String passwordRegister = registerState.password;
      String repasswordRegister = registerState.repassword;
      if (usernameRegister.isEmpty||emailRegister.isEmpty || passwordRegister.isEmpty || repasswordRegister.isEmpty) {
        ToastInfo(smg: 'All fields are required');
        return;
      }
      try {
        final registerCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailRegister, password: passwordRegister);
        
        if(registerCredential.user==null){
          ToastInfo(smg: 'No user register');
        }
        if(registerCredential.user != null){
          await registerCredential.user?.sendEmailVerification();
          await registerCredential.user?.updateDisplayName(usernameRegister);
          ToastInfo(smg: 'An email has been sent to your registered email');
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // ignore: avoid_print
          ToastInfo(smg: 'This email already in use');
        } else if (e.code == 'wrong-password') {
          ToastInfo(smg: 'wrong password provider for that user');
        } else if (e.code == 'weak-password') {
          // ignore: avoid_print
          ToastInfo(smg: 'Your password is weak');
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
