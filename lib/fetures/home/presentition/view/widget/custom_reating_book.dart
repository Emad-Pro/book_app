import 'package:book_app_mvvm/fetures/home/data/model/book_model/volume_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../core/utils/styles.dart';

class CustomReatingBookDetails extends StatelessWidget {
  const CustomReatingBookDetails({Key? key, required this.volumeInfo}) : super(key: key);
  final VolumeInfo? volumeInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconlyBold.star,
          color: Colors.amber[300],
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "${volumeInfo!.ratingsCount == null ? 0.0 : volumeInfo!.ratingsCount!}",
          style: StylesText.textFont20Reqular,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "(${volumeInfo!.averageRating == null ? 0 : volumeInfo!.averageRating!})",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
        )
      ],
    );
  }
}
