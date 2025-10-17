import 'package:first_app/Counter%20App/counter_events.dart';
import 'package:first_app/Counter%20App/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialState(currentState: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(IncreamentState(currentState: state.currentState + 1));
    });

    on<DecrementEvent>((event, emit) {
      if (state.currentState <= 0) return;
      emit(DecreamentState(currentState: state.currentState - 1));
    });
  }
}
