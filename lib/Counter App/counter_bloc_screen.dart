import 'package:first_app/Counter%20App/counter_bloc.dart';
import 'package:first_app/Counter%20App/counter_events.dart';
import 'package:first_app/Counter%20App/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),

      child: Scaffold(
        appBar: AppBar(title: Text('Counter App Using Bloc')),
        body: BlocConsumer<CounterBloc, CounterStates>(
          listener: (context, state) {
            var bloc = context.read<CounterBloc>();
            if (bloc.state.currentState == 10) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('You reached 10')));
            }
            if (bloc.state.currentState == 0 && state is DecreamentState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('You Done 0')));
            }
          },
          builder: (context, state) {
            var bloc = context.read<CounterBloc>();
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      bloc.add(DecrementEvent());
                    },
                    child: Text('-', style: TextStyle(fontSize: 25)),
                  ),
                  Text(
                    '${bloc.state.currentState}',
                    style: TextStyle(fontSize: 25),
                  ),
                  TextButton(
                    onPressed: () {
                      bloc.add(IncrementEvent());
                    },
                    child: Text('+', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
