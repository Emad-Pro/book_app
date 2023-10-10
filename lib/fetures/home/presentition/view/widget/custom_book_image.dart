import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/model/book_model/item.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, this.items}) : super(key: key);
  final Item? items;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FadeInRight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    imageUrl: items!.volumeInfo!.imageLinks!.thumbnail!,
                    placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ));
  }
}
