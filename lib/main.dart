import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pages/home_page.dart';
import './blocs/counter_cubit.dart';
import './blocs/theme_cubit.dart';
import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Themes theme = Themes();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(0)..restoreData(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..restoreData(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state ? theme.lightTheme() : theme.darkTheme(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
