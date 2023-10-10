import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';

class CustumAppBar extends StatelessWidget {
  const CustumAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
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
          ],
        ),
      ),
    );
  }
}
