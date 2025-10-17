import 'package:first_app/Counter%20App/counter_cubit.dart';
import 'package:first_app/Counter%20App/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),

      child: Scaffold(
        appBar: AppBar(title: Text('Counter App Using Bloc-Cubit')),
        body: BlocConsumer<CounterCubit, CounterStates>(
          listener: (context, state) {
            var cubit = context.read<CounterCubit>();
            if (cubit.state.currentState == 10) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('You reached 10')));
            }
            if (cubit.state.currentState == 0 && state is DecreamentState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('You Done 0')));
            }
          },
          builder: (context, state) {
            var cubit = context.read<CounterCubit>();
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: cubit.decreamentState,
                    child: Text('-', style: TextStyle(fontSize: 25)),
                  ),
                  Text(
                    '${cubit.state.currentState}',
                    style: TextStyle(fontSize: 25),
                  ),
                  TextButton(
                    onPressed: cubit.increamentState,
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
