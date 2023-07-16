import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  void restoreData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final counter = prefs.getInt('counter') ?? 1;
    emit(counter);
  }

  void updateData(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', value);
  }

  void increment() {
    emit(state + 1);
    updateData(state);
  }

  void decrement() {
    emit(state - 1);
    updateData(state);
  }
}
