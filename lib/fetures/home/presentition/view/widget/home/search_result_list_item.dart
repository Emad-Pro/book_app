import 'package:animate_do/animate_do.dart';
import 'package:auto_direction/auto_direction.dart';

import 'package:book_app_mvvm/fetures/home/data/model/book_model/item.dart';

import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../../book_details_view.dart';
import '../custom_reating_book.dart';

class ListViewBooksItem extends StatelessWidget {
  final Item item;

  const ListViewBooksItem({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookDetailsView(
                    item: item,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AspectRatio(
                    aspectRatio: 2.6 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                          image: DecorationImage(
                              image: NetworkImage(item.volumeInfo!.imageLinks!.thumbnail!),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoDirection(
                        text: item.volumeInfo!.title!,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1.2,
                          child: Text(item.volumeInfo!.title!,
                              maxLines: 2,
                              softWrap: true,
                              style: StylesText.textFont27Rightteousw500),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 1.2,
                          child: Text(
                            item.volumeInfo!.authors != null
                                ? item.volumeInfo!.authors![0]
                                : 'unknow',
                            maxLines: 2,
                            style: StylesText.textFont20Reqular,
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            item.saleInfo!.saleability!,
                            style: StylesText.textFont25Bold,
                          ),
                          const Spacer(),
                          CustomReatingBookDetails(
                            volumeInfo: item.volumeInfo,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
