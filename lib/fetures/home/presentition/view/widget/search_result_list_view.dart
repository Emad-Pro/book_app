import 'package:book_app_mvvm/fetures/home/presentition/view_model/cubit/search_books_cubit.dart';
import 'package:book_app_mvvm/fetures/setting/presentition/view_model/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/custom_erorr.dart';
import '../../../../../core/widget/custom_simmer_loading_listview.dart';
import 'home/search_result_list_item.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return BlocBuilder<SearchBooksCubit, SearchBooksState>(builder: (context, state) {
          if (state is SearchBooksLoaded) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.bookModel.items!.length,
                itemBuilder: (context, index) => ListViewBooksItem(
                  item: state.bookModel.items![index],
                ),
              ),
            );
          } else if (state is SearchBooksErorr) {
            return CustomErorr(
              erorrMessage: state.erorrMessage,
            );
          } else if (state is SearchBooksLoading) {
            return const Expanded(child: CustomShimmerLoadingListView());
          } else {
            return const SizedBox(
              child: Text(
                "BY: Dev.Emad Younis",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            );
          }
        });
      },
    );
  }
}
