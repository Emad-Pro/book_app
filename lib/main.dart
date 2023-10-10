import 'package:book_app_mvvm/core/shared_prefrance/CacheHelper.dart';

import 'package:book_app_mvvm/fetures/home/presentition/view_model/cubit/search_books_cubit.dart';
import 'package:book_app_mvvm/fetures/setting/presentition/view_model/cubit/setting_cubit.dart';
import 'package:book_app_mvvm/fetures/splash_screen/presentation/view/splashView.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'core/theme_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  bool? darkMode = CacheHelper.getSaveData(key: 'darkMode');
  runApp(BookApp(
    darkModeTheme: darkMode ?? false,
  ));
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key, required this.darkModeTheme}) : super(key: key);
  final bool? darkModeTheme;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SettingCubit()..changeAppThemeMode(fromShared: darkModeTheme)),
        BlocProvider(
          create: (context) => SearchBooksCubit(getIt()),
        ),
      ],
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode:
                BlocProvider.of<SettingCubit>(context).darkMode ? ThemeMode.dark : ThemeMode.light,
            theme: darkTheme(),
            darkTheme: lightTheme(),
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
