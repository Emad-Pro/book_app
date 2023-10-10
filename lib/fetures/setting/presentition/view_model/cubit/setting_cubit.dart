// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_prefrance/CacheHelper.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);
  bool darkMode = true;
  void changeAppThemeMode({bool? fromShared}) async {
    if (fromShared != null) {
      darkMode = fromShared;
      emit(ChangeAppThemeState());
    } else {
      darkMode = !darkMode;
      await CacheHelper.setData(key: "darkMode", value: darkMode).then((value) {
        emit(ChangeAppThemeState());
      }).catchError((onError) {});
    }
  }
}
