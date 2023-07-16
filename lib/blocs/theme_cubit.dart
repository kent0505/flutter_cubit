import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeState {}

class ThemeLight extends ThemeState {}

class ThemeDark extends ThemeState {}

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  void restoreData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLight = prefs.getBool('isLight') ?? false;
    emit(isLight);
  }

  void updateData(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLight', value);
  }

  void changeTheme() {
    if (state) {
      updateData(false);
      emit(false);
    } else {
      updateData(true);
      emit(true);
    }
  }
}
