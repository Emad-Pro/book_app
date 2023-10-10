import 'package:book_app_mvvm/fetures/setting/presentition/view_model/cubit/setting_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                "Dark Mode",
                style: TextStyle(fontSize: 20),
              ),
              const Spacer(),
              FlutterSwitch(
                  value: !SettingCubit.get(context).darkMode,
                  padding: 8.0,
                  showOnOff: true,
                  onToggle: (value) {
                    BlocProvider.of<SettingCubit>(context).changeAppThemeMode();
                  }),
            ],
          ),
        );
      },
    );
  }
}
