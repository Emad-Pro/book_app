import 'package:book_app_mvvm/fetures/home/data/model/book_model/item.dart';
import 'package:book_app_mvvm/fetures/home/presentition/view/widget/book_details/custom_appbar_book_details.dart';
import 'package:flutter/material.dart';

import 'widget/book_details/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustumAppBarBookDetails(),
      ),
      body: SafeArea(
          child: BookDetailsViewBody(
        item: item,
      )),
    );
  }
}
