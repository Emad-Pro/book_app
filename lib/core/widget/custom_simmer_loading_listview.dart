import 'package:book_app_mvvm/fetures/setting/presentition/view_model/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class CustomShimmerLoadingListView extends StatelessWidget {
  const CustomShimmerLoadingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmerLoadingItem(
                width: 120,
                height: MediaQuery.of(context).size.height * .2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomShimmerLoadingItem(
                        width: MediaQuery.of(context).size.width * .5,
                        height: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomShimmerLoadingItem(
                        width: MediaQuery.of(context).size.width * .5,
                        height: 20,
                      ),
                      CustomShimmerLoadingItem(
                        width: MediaQuery.of(context).size.width * .5,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: 10);
  }
}

class CustomShimmerLoadingItem extends StatelessWidget {
  const CustomShimmerLoadingItem({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: !SettingCubit.get(context).darkMode
          ? Colors.grey[850]!
          : const Color.fromARGB(255, 223, 223, 223),
      highlightColor: !SettingCubit.get(context).darkMode
          ? Colors.grey[800]!
          : const Color.fromARGB(255, 185, 185, 185),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: !SettingCubit.get(context).darkMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
