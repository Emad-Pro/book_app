import 'package:flutter/material.dart';

import '../search_result_list_view.dart';

import 'form_search_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FormSearchViewItem(),
          SearchListView(),
        ],
      ),
    );
  }
}
