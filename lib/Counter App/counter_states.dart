abstract class CounterStates {
  final int currentState;

  CounterStates({required this.currentState});
}

class IncreamentState extends CounterStates {
  IncreamentState({required super.currentState});
}

class DecreamentState extends CounterStates {
  DecreamentState({required super.currentState});
}

class InitialState extends CounterStates {
  InitialState({required super.currentState});
}
