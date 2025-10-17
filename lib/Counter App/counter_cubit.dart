import 'package:first_app/Counter%20App/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialState(currentState: 0));
  // int counter = 0;
  increamentState() {
    // counter++;
    emit(IncreamentState(currentState: state.currentState + 1));
  }

  decreamentState() {
    if (state.currentState == 0) return;
    // counter--;
    emit(DecreamentState(currentState: state.currentState - 1));
  }
}

// enum CounterState { inishalState, increamentState, decrementState }
