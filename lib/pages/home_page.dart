import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_cubit.dart';
import '../blocs/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                text(state),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonMinus(() {
                      context.read<CounterCubit>().decrement();
                    }),
                    buttonPlus(() {
                      context.read<CounterCubit>().increment();
                    }),
                  ],
                ),
                BlocBuilder<ThemeCubit, bool>(
                  builder: (context, state) {
                    return Switch(
                      value: state,
                      onChanged: (bool value) {
                        context.read<ThemeCubit>().changeTheme();
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget text(int counter) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        counter.toString(),
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  Widget buttonMinus(VoidCallback func) {
    return MaterialButton(
      onPressed: func,
      color: Colors.redAccent,
      child: const Text('-'),
    );
  }

  Widget buttonPlus(VoidCallback func) {
    return MaterialButton(
      onPressed: func,
      color: Colors.greenAccent,
      child: const Text('+'),
    );
  }
}
