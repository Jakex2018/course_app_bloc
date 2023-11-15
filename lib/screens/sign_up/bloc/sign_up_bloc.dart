import 'package:appbloc_02/screens/sign_up/bloc/sign_up_events.dart';
import 'package:appbloc_02/screens/sign_up/bloc/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBloc():super(SignUpStates()){
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvents>(_emailEvent);
    on<PasswordEvents>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<SignUpStates> emit){
    emit(state.copyWith(username: event.username));
  }
  void _emailEvent(EmailEvents event, Emitter<SignUpStates> emit){
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvents event, Emitter<SignUpStates> emit){
    // ignore: avoid_print
    emit(state.copyWith(password: event.password));
  }
  void _repasswordEvent(RePasswordEvent event, Emitter<SignUpStates> emit){
    emit(state.copyWith(repassword: event.repassword));
  }
}