import 'package:book_app_mvvm/fetures/home/presentition/view/widget/home/custum_appBar.dart';
import 'package:book_app_mvvm/fetures/home/presentition/view/widget/home/home_view_body.dart';
import 'package:book_app_mvvm/fetures/setting/presentition/view_model/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../setting/presentition/view/theme/dark_mode.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const CustumAppBar(),
            ),
            drawer: Drawer(
                child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Books App',
                    style: TextStyle(fontSize: 25, color: Colors.grey[900]),
                  ),
                ),
                DarkMode()
              ],
            )),
            body: const HomeViewBody(),
          );
        },
      ),
    );
  }
}
