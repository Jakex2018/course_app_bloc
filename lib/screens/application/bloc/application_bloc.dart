import 'package:appbloc_02/screens/application/bloc/application_events.dart';
import 'package:appbloc_02/screens/application/bloc/application_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent,ApplicationStates>{
  ApplicationBloc():super(const ApplicationStates()){
    on<TriggerApplicationEvent>(((event, emit) {
      emit(ApplicationStates(index: event.index));
    }));
  }
}