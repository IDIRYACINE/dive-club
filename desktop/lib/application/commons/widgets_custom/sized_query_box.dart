import 'package:flutter/material.dart';

class SizedQueryBox extends StatelessWidget {
  const SizedQueryBox(
      {super.key,
      required this.child,
      this.heightPercentage,
      this.widthPercentage});

  final Widget child;
  final double? heightPercentage;
  final double? widthPercentage;

  @override
  Widget build(BuildContext context) {
    final viewSize = MediaQuery.of(context).size;
    final height =
        heightPercentage == null ? null : viewSize.height * heightPercentage!;
    final width =
        widthPercentage == null ? null : viewSize.width * widthPercentage!;

    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
