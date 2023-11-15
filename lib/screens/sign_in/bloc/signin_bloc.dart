import 'package:appbloc_02/screens/sign_in/bloc/signin_events.dart';
import 'package:appbloc_02/screens/sign_in/bloc/signin_states.dart';
import 'package:bloc/bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    // ignore: avoid_print
    print('your email is: ${event.email}');
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    // ignore: avoid_print
    print('your password is: ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}