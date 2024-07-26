import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MotionLoadingText extends StatelessWidget {
  const MotionLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0,bottom:25.0,top: 20.0),
      child: SizedBox(
          width: 350.0,
          height: 9.0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                Container(
                  width: 350.0,
                  height: 9,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(17))),
                ),
                ],
            ),
          )
          ),
    );
  }
}
