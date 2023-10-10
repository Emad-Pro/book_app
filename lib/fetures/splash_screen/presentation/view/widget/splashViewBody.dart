import 'package:animate_do/animate_do.dart';
import 'package:book_app_mvvm/fetures/home/presentition/view/home_view.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Home()), (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsData.splashImage),
            FadeInUp(
              child: Text(
                'إذا كان الكتاب جديراً بالقراءة\n فإنه جدير بأن يقتنى',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo().copyWith(fontSize: 20),
              ),
            ),
            FadeInUp(
              child: Text(
                'By Emad Younis ',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoCondensed().copyWith(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
