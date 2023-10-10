import 'package:book_app_mvvm/fetures/home/data/model/book_model/item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import '../custom_reating_book.dart';

class CustomDetailsBook extends StatelessWidget {
  const CustomDetailsBook({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        if (item.volumeInfo!.title != null)
          Text(
            item.volumeInfo!.title!,
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: StylesText.textFont35,
          ),
        const SizedBox(
          height: 4,
        ),
        if (item.volumeInfo!.authors != null)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: item.volumeInfo!.authors!.length,
                itemBuilder: (contex, index) {
                  return Center(
                    child: Text(
                      item.volumeInfo!.authors![index],
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: StylesText.textFont25Bold.copyWith(
                          fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.7)),
                    ),
                  );
                }),
          ),
        const SizedBox(
          height: 15,
        ),
        CustomReatingBookDetails(
          volumeInfo: item.volumeInfo,
        )
      ],
    );
  }
}
