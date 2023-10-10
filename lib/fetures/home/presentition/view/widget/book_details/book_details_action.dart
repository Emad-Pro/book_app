import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/widget/custom_buttom.dart';
import '../../../../data/model/book_model/item.dart';

class BookDetailsAction extends StatelessWidget {
  const BookDetailsAction({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButtom(
            funcation: () {
              launchUrl(
                Uri.parse(item.volumeInfo!.previewLink!),
                mode: LaunchMode.inAppWebView,
              );
            },
            borderRadius: item.accessInfo!.pdf!.isAvailable == false
                ? BorderRadius.circular(15)
                : const BorderRadius.only(
                    topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            backgroundColor: Colors.blueGrey,
            textColor: Colors.black,
            text: 'View',
          ),
        ),
        if (item.accessInfo!.pdf!.isAvailable == true)
          Expanded(
            child: CustomButtom(
              funcation: () {
                launchUrl(Uri.parse(item.accessInfo!.pdf!.downloadLink!),
                    mode: LaunchMode.externalApplication);
              },
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              text: 'Download',
            ),
          ),
      ],
    );
  }
}
