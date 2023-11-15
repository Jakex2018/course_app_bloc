///import 'package:equatable/equatable.dart';

class SignInState  {

  const SignInState({this.email='', this.password=''});
   final String email,password;
  SignInState copyWith({String? email, String?password}){
    return SignInState(
      email: email??this.email,
      password: password??this.password
    );
  }
  
 
}
