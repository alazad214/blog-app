import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, inder) {
          return Container(
            height: 120,
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 110,
                  width: w / 4,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: Lottie.asset("assets/animations/shimmer.json",
                      fit: BoxFit.cover),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: w / 6,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Lottie.asset("assets/animations/shimmer.json",
                          fit: BoxFit.cover),
                    ),
                    Container(
                      height: 10,
                      width: w / 3.5,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Lottie.asset("assets/animations/shimmer.json",
                          fit: BoxFit.cover),
                    ),
                    Container(
                      height: 10,
                      width: w / 2.5,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Lottie.asset("assets/animations/shimmer.json",
                          fit: BoxFit.cover),
                    ),
                    Container(
                      height: 10,
                      width: w / 2.6,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Lottie.asset("assets/animations/shimmer.json",
                          fit: BoxFit.cover),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
