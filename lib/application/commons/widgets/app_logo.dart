

import 'package:dive_club/resources/resources.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget{
  const AppLogo({super.key, this.height, this.width});

  final double? height;
  final double? width; 

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
      width: width,
      child:  const Image(
        image: AssetImage(AppResources.logoAssetPath),
      ),
    );
  }
}