import 'package:book_app_mvvm/fetures/setting/presentition/view_model/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../view_model/cubit/search_books_cubit.dart';

class FormSearchViewItem extends StatelessWidget {
  const FormSearchViewItem({
    super.key,
  });
  static final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        return Column(
          children: [
            BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          enabledBorder: buildOutlineInputBorder(context),
                          focusedBorder: buildOutlineInputBorder(context),
                          hintText: 'Search Books',
                          suffixIcon: const Opacity(
                            opacity: .8,
                            child: Icon(
                              IconlyBold.search,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CostumElevatedButtom(textEditingController: _textEditingController),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder(context) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: SettingCubit.get(context).darkMode ? Colors.black : Colors.white),
      borderRadius: BorderRadius.circular(
        24,
      ),
    );
  }
}

class CostumElevatedButtom extends StatelessWidget {
  const CostumElevatedButtom({Key? key, required this.textEditingController}) : super(key: key);
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.1,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
          onPressed: () {
            if (textEditingController.text.isNotEmpty) {
              BlocProvider.of<SearchBooksCubit>(context)
                  .getSearchData(textSearch: textEditingController.text);
            }
          },
          child: const Text("Search")),
    );
  }
}
