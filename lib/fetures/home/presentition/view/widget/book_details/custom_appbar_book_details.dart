import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';

class CustumAppBarBookDetails extends StatelessWidget {
  const CustumAppBarBookDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AssetsData.splashImage,
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "my books".toUpperCase(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const Spacer(),
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            size: 35,
          ),
        ),
      ],
    );
  }
}
