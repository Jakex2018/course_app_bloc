import 'package:appbloc_02/screens/welcome/bloc/welcome_events.dart';
import 'package:appbloc_02/screens/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvents , WelcomeState>{
  WelcomeBloc(): super(WelcomeState()){
    on<WelcomeEvents>((event , emit){
    // ignore: invalid_use_of_visible_for_testing_member
    emit(WelcomeState(page:state.page));
  });
  }
}