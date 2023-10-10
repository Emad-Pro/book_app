import 'package:book_app_mvvm/fetures/home/data/model/book_model/item.dart';
import 'package:book_app_mvvm/fetures/home/data/model/book_model/volume_info.dart';
import 'package:flutter/material.dart';

import 'book_details_action.dart';

import '../custom_book_image.dart';
import 'custom_details_book.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.25, vertical: 20),
                child: CustomBookImage(
                  items: item,
                ),
              ),
              CustomDetailsBook(
                item: item,
              ),
              const SizedBox(
                height: 37,
              ),
              BookDetailsAction(
                item: item,
              ),
              const Expanded(
                child: SizedBox(
                  height: 49,
                ),
              ),
              if (item.volumeInfo!.description != null)
                CostumViewDetilsBook(
                  volumeInfo: item.volumeInfo!,
                )
              //   const SimllerBookListView(),
            ],
          ),
        ),
      )
    ]);
  }
}

class CostumViewDetilsBook extends StatelessWidget {
  const CostumViewDetilsBook({Key? key, required this.volumeInfo}) : super(key: key);
  final VolumeInfo volumeInfo;
  @override
  Widget build(BuildContext context) {
    return Text(volumeInfo.description!);
  }
}
